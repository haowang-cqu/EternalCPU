#!/usr/bin/env python3
import os
import git
import shutil
from concurrent.futures import ThreadPoolExecutor
import threading
import subprocess

# CONFIG BEGIN
TO_GEN = [
	{"PLL_FREQ":"clk_pll","I_CACHE_INDEX":"12","D_CACHE_INDEX":"12"},
	{"PLL_FREQ":"clk_pll","I_CACHE_INDEX":"14","D_CACHE_INDEX":"14"},
	#{"PLL_FREQ":"clk_pll_70","I_CACHE_INDEX":"12","D_CACHE_INDEX":"12"},
	#{"PLL_FREQ":"clk_pll_80","I_CACHE_INDEX":"10","D_CACHE_INDEX":"10"},
	{"PLL_FREQ":"clk_pll_90","I_CACHE_INDEX":"4","D_CACHE_INDEX":"4"},
	{"PLL_FREQ":"clk_pll_90","I_CACHE_INDEX":"2","D_CACHE_INDEX":"2"},
	{"PLL_FREQ":"clk_pll","I_CACHE_INDEX":"16","D_CACHE_INDEX":"16"},
	{"PLL_FREQ":"clk_pll_70","I_CACHE_INDEX":"10","D_CACHE_INDEX":"10"},
	{"PLL_FREQ":"clk_pll_80","I_CACHE_INDEX":"8","D_CACHE_INDEX":"8"}
	#{"PLL_FREQ":"clk_pll_90","I_CACHE_INDEX":"6","D_CACHE_INDEX":"6"},
]
VIVADO = "/tools/Xilinx/Vivado/2019.2/bin/vivado"
BUILD_PREFIX = "build/" + git.Repo(search_parent_directories=True).head.object.hexsha[0:7]
MAX_TASKS = 4
# CONFIG END

executor = ThreadPoolExecutor(max_workers=MAX_TASKS)

with open("cpu_kernel/compile_options.vh","r") as file:
	options = file.readlines()
	options = [x.strip() for x in options]

def match_param(str,params_key):
	for i in range(len(params_key)):
		if params_key[i] in str:
			return params_key[i]
	return None

def rep_defs(src,new_params):
	res = []
	params_key = list(new_params.keys())
	for each_line in options:
		if each_line.startswith("`define") and match_param(each_line,params_key) != None:
			param_name = match_param(each_line,params_key)
			res.append("`define {} {}".format(param_name,new_params[param_name]))
		else:
			res.append(each_line)
	return "\n".join(res)

def gen_dir_name(params):
	res = []
	for x in params.values():
		res.append("".join(list(filter(str.isdigit,x))))
	return "_".join(res)

def do_param(params):
	stor_dir = BUILD_PREFIX + "/" + gen_dir_name(params)
	print("Doing with param {}".format(params))
	cmd = "{} -mode tcl -source scripts/gen_perf_bit.tcl {}/nscscc/perf_test_v0.01/soc_axi_perf/run_vivado/mycpu_prj1/mycpu.xpr".format(VIVADO,stor_dir)
	print(cmd)
	os.system(cmd)
	shutil.copy("{}/nscscc/perf_test_v0.01/soc_axi_perf/run_vivado/mycpu_prj1/mycpu.runs/impl_1/soc_axi_lite_top.bit".format(stor_dir),"{}/{}.bit".format(BUILD_PREFIX,gen_dir_name(params)))
	print("Done with param {}".format(params))

def do_new_param(params):
	stor_dir = BUILD_PREFIX + "/" + gen_dir_name(params)
	shutil.copytree("cpu_kernel", stor_dir + "/cpu_kernel",dirs_exist_ok=True)
	with open(stor_dir + "/cpu_kernel/compile_options.vh","w") as file:
		file.write(rep_defs(options,params))
	shutil.copytree("nscscc/perf_test_v0.01", stor_dir + "/nscscc/perf_test_v0.01",dirs_exist_ok=True)
	executor.submit(do_param,params)


for x in TO_GEN:
	do_new_param(x)

executor.shutdown(wait=True)