# 2021_CQU_NSCSCC

# 1.开始

## 团队赛资源包下载：
~~### 下载链接：https://nscscc2020-team.oss-cn-beijing.aliyuncs.com/nscscc2020_group_v0.01.zip~~
~~### 文件名：nscscc2020_group_v0.01.zip~~
~~### 解压密码：nscscc2020~~

### 下载链接：https://caiyun.139.com/w/i/105Cf9eXzxj8o
### 提取码：eT2g
### 文件名：nscscc2021_group_v0.01.zip
### 解压密码：nscscc2021

# 2. 自动化测试

```bash
source /tools/Xilinx/Vivado/2019.2/settings64.sh
```

## 功能仿真测试

```bash
vivado -mode tcl -source scripts/run_simulation.tcl nscscc/func_test_v0.01/soc_axi_func/run_vivado/mycpu_prj1/mycpu.xpr
```

## 生成性能测试bit流

```bash
vivado -mode tcl -source scripts/gen_perf_bit.tcl nscscc/perf_test_v0.01/soc_axi_perf/run_vivado/mycpu_prj1/mycpu.xpr
```