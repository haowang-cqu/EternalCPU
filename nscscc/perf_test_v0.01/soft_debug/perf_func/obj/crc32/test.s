
obj/crc32/main.elf:     file format elf32-tradlittlemips
obj/crc32/main.elf


Disassembly of section .text:

9fc00000 <_ftext>:
_ftext():
9fc00000:	3c1bbfb0 	lui	k1,0xbfb0
9fc00004:	af608ffc 	sw	zero,-28676(k1)
9fc00008:	af608ffc 	sw	zero,-28676(k1)
9fc0000c:	af60fff8 	sw	zero,-8(k1)
9fc00010:	af608ffc 	sw	zero,-28676(k1)
9fc00014:	af608ffc 	sw	zero,-28676(k1)
9fc00018:	8f608ffc 	lw	zero,-28676(k1)
9fc0001c:	8f7bfff8 	lw	k1,-8(k1)
9fc00020:	3c1bbfb0 	lui	k1,0xbfb0
9fc00024:	af608ffc 	sw	zero,-28676(k1)
9fc00028:	af608ffc 	sw	zero,-28676(k1)
9fc0002c:	af60fffc 	sw	zero,-4(k1)
9fc00030:	af608ffc 	sw	zero,-28676(k1)
9fc00034:	af608ffc 	sw	zero,-28676(k1)
9fc00038:	8f608ffc 	lw	zero,-28676(k1)
9fc0003c:	8f7bfffc 	lw	k1,-4(k1)
9fc00040:	3c0a0040 	lui	t2,0x40
9fc00044:	408a6000 	mtc0	t2,c0_sr
9fc00048:	00000000 	nop
9fc0004c:	40806800 	mtc0	zero,c0_cause
9fc00050:	3c1d9fc1 	lui	sp,0x9fc1
9fc00054:	27bd1dfc 	addiu	sp,sp,7676
9fc00058:	3c1c9fc1 	lui	gp,0x9fc1
9fc0005c:	279c9e20 	addiu	gp,gp,-25056
9fc00060:	3c199fc0 	lui	t9,0x9fc0
9fc00064:	2739038c 	addiu	t9,t9,908
9fc00068:	03200008 	jr	t9
9fc0006c:	00000000 	nop
	...

9fc00100 <test_finish>:
test_finish():
9fc00100:	25080001 	addiu	t0,t0,1
9fc00104:	240900ff 	li	t1,255
9fc00108:	3c0abfaf 	lui	t2,0xbfaf
9fc0010c:	354afff0 	ori	t2,t2,0xfff0
9fc00110:	a1490000 	sb	t1,0(t2)
9fc00114:	3c08bfaf 	lui	t0,0xbfaf
9fc00118:	3508f020 	ori	t0,t0,0xf020
9fc0011c:	8d080000 	lw	t0,0(t0)
9fc00120:	00000000 	nop
9fc00124:	31080080 	andi	t0,t0,0x80
9fc00128:	11000008 	beqz	t0,9fc0014c <test_finish+0x4c>
9fc0012c:	00000000 	nop
9fc00130:	00000000 	nop
9fc00134:	3c08bfaf 	lui	t0,0xbfaf
9fc00138:	35088000 	ori	t0,t0,0x8000
9fc0013c:	8d090000 	lw	t1,0(t0)
9fc00140:	10000005 	b	9fc00158 <test_finish+0x58>
9fc00144:	00000000 	nop
9fc00148:	00000000 	nop
9fc0014c:	3c08bfaf 	lui	t0,0xbfaf
9fc00150:	35088004 	ori	t0,t0,0x8004
9fc00154:	8d090000 	lw	t1,0(t0)
9fc00158:	3c08bfaf 	lui	t0,0xbfaf
9fc0015c:	3508f010 	ori	t0,t0,0xf010
9fc00160:	1000ffec 	b	9fc00114 <test_finish+0x14>
9fc00164:	ad090000 	sw	t1,0(t0)
9fc00168:	00000000 	nop
9fc0016c:	3c088000 	lui	t0,0x8000
9fc00170:	25290001 	addiu	t1,t1,1
9fc00174:	01005025 	move	t2,t0
9fc00178:	01ae5821 	addu	t3,t5,t6
9fc0017c:	8d0c0000 	lw	t4,0(t0)
	...
9fc00380:	1000ffff 	b	9fc00380 <test_finish+0x280>
9fc00384:	25080001 	addiu	t0,t0,1
9fc00388:	00000000 	nop

9fc0038c <run_test>:
run_test():
9fc0038c:	0411000c 	bal	9fc003c0 <shell4>
9fc00390:	00000000 	nop
9fc00394:	00000000 	nop

9fc00398 <go_finish>:
go_finish():
9fc00398:	3c099fc0 	lui	t1,0x9fc0
9fc0039c:	25290100 	addiu	t1,t1,256
9fc003a0:	3c0a2000 	lui	t2,0x2000
9fc003a4:	012ac825 	or	t9,t1,t2
9fc003a8:	03200008 	jr	t9
9fc003ac:	00000000 	nop
	...

9fc003c0 <shell4>:
shell4():
9fc003c0:	3c059fc0 	lui	a1,0x9fc0
9fc003c4:	27bdffc0 	addiu	sp,sp,-64
9fc003c8:	24a41720 	addiu	a0,a1,5920
9fc003cc:	afbf003c 	sw	ra,60(sp)
9fc003d0:	afbe0038 	sw	s8,56(sp)
9fc003d4:	afb70034 	sw	s7,52(sp)
9fc003d8:	afb60030 	sw	s6,48(sp)
9fc003dc:	afb5002c 	sw	s5,44(sp)
9fc003e0:	afb40028 	sw	s4,40(sp)
9fc003e4:	afb30024 	sw	s3,36(sp)
9fc003e8:	afb20020 	sw	s2,32(sp)
9fc003ec:	afb1001c 	sw	s1,28(sp)
9fc003f0:	0ff00446 	jal	9fc01118 <puts>
9fc003f4:	afb00018 	sw	s0,24(sp)
9fc003f8:	0ff00566 	jal	9fc01598 <get_count>
9fc003fc:	00000000 	nop
9fc00400:	0ff0056c 	jal	9fc015b0 <get_count_my>
9fc00404:	afa20014 	sw	v0,20(sp)
9fc00408:	3c04bfaf 	lui	a0,0xbfaf
9fc0040c:	afa20010 	sw	v0,16(sp)
9fc00410:	3482fff4 	ori	v0,a0,0xfff4
9fc00414:	8c430000 	lw	v1,0(v0)
9fc00418:	00000000 	nop
9fc0041c:	14600068 	bnez	v1,9fc005c0 <shell4+0x200>
9fc00420:	00000000 	nop
9fc00424:	8f918010 	lw	s1,-32752(gp)
9fc00428:	0ff00268 	jal	9fc009a0 <crc32>
9fc0042c:	02202021 	move	a0,s1
9fc00430:	02202021 	move	a0,s1
9fc00434:	0ff00268 	jal	9fc009a0 <crc32>
9fc00438:	00409821 	move	s3,v0
9fc0043c:	02202021 	move	a0,s1
9fc00440:	0ff00268 	jal	9fc009a0 <crc32>
9fc00444:	0040f021 	move	s8,v0
9fc00448:	02202021 	move	a0,s1
9fc0044c:	0ff00268 	jal	9fc009a0 <crc32>
9fc00450:	00408021 	move	s0,v0
9fc00454:	02202021 	move	a0,s1
9fc00458:	0ff00268 	jal	9fc009a0 <crc32>
9fc0045c:	0040b821 	move	s7,v0
9fc00460:	02202021 	move	a0,s1
9fc00464:	0ff00268 	jal	9fc009a0 <crc32>
9fc00468:	0040b021 	move	s6,v0
9fc0046c:	02202021 	move	a0,s1
9fc00470:	0ff00268 	jal	9fc009a0 <crc32>
9fc00474:	0040a821 	move	s5,v0
9fc00478:	02202021 	move	a0,s1
9fc0047c:	0ff00268 	jal	9fc009a0 <crc32>
9fc00480:	0040a021 	move	s4,v0
9fc00484:	02202021 	move	a0,s1
9fc00488:	0ff00268 	jal	9fc009a0 <crc32>
9fc0048c:	00409021 	move	s2,v0
9fc00490:	021e5821 	addu	t3,s0,s8
9fc00494:	01775021 	addu	t2,t3,s7
9fc00498:	01564821 	addu	t1,t2,s6
9fc0049c:	01354021 	addu	t0,t1,s5
9fc004a0:	01143821 	addu	a3,t0,s4
9fc004a4:	00f23021 	addu	a2,a3,s2
9fc004a8:	00c28021 	addu	s0,a2,v0
9fc004ac:	02202021 	move	a0,s1
9fc004b0:	0ff00268 	jal	9fc009a0 <crc32>
9fc004b4:	02709821 	addu	s3,s3,s0
9fc004b8:	00538821 	addu	s1,v0,s3
9fc004bc:	0ff0056c 	jal	9fc015b0 <get_count_my>
9fc004c0:	00000000 	nop
9fc004c4:	0ff00566 	jal	9fc01598 <get_count>
9fc004c8:	00409821 	move	s3,v0
9fc004cc:	8fad0014 	lw	t5,20(sp)
9fc004d0:	8fac0010 	lw	t4,16(sp)
9fc004d4:	004d9023 	subu	s2,v0,t5
9fc004d8:	12200029 	beqz	s1,9fc00580 <shell4+0x1c0>
9fc004dc:	026c8023 	subu	s0,s3,t4
9fc004e0:	3c149fc0 	lui	s4,0x9fc0
9fc004e4:	0ff00446 	jal	9fc01118 <puts>
9fc004e8:	26841740 	addiu	a0,s4,5952
9fc004ec:	3c08bfaf 	lui	t0,0xbfaf
9fc004f0:	3511f000 	ori	s1,t0,0xf000
9fc004f4:	3507f008 	ori	a3,t0,0xf008
9fc004f8:	3504f004 	ori	a0,t0,0xf004
9fc004fc:	24060001 	li	a2,1
9fc00500:	24050002 	li	a1,2
9fc00504:	ace60000 	sw	a2,0(a3)
9fc00508:	ac850000 	sw	a1,0(a0)
9fc0050c:	ae200000 	sw	zero,0(s1)
9fc00510:	3c16bfaf 	lui	s6,0xbfaf
9fc00514:	36c98004 	ori	t1,s6,0x8004
9fc00518:	36caf010 	ori	t2,s6,0xf010
9fc0051c:	36d58000 	ori	s5,s6,0x8000
9fc00520:	3c0b9fc0 	lui	t3,0x9fc0
9fc00524:	ad500000 	sw	s0,0(t2)
9fc00528:	02402821 	move	a1,s2
9fc0052c:	aeb00000 	sw	s0,0(s5)
9fc00530:	25641750 	addiu	a0,t3,5968
9fc00534:	ad320000 	sw	s2,0(t1)
9fc00538:	0ff00380 	jal	9fc00e00 <printf>
9fc0053c:	3c129fc0 	lui	s2,0x9fc0
9fc00540:	26441778 	addiu	a0,s2,6008
9fc00544:	02002821 	move	a1,s0
9fc00548:	8fbf003c 	lw	ra,60(sp)
9fc0054c:	8fbe0038 	lw	s8,56(sp)
9fc00550:	8fb70034 	lw	s7,52(sp)
9fc00554:	8fb60030 	lw	s6,48(sp)
9fc00558:	8fb5002c 	lw	s5,44(sp)
9fc0055c:	8fb40028 	lw	s4,40(sp)
9fc00560:	8fb30024 	lw	s3,36(sp)
9fc00564:	8fb20020 	lw	s2,32(sp)
9fc00568:	8fb1001c 	lw	s1,28(sp)
9fc0056c:	8fb00018 	lw	s0,24(sp)
9fc00570:	0bf00380 	j	9fc00e00 <printf>
9fc00574:	27bd0040 	addiu	sp,sp,64
	...
9fc00580:	3c1f9fc0 	lui	ra,0x9fc0
9fc00584:	27e41734 	addiu	a0,ra,5940
9fc00588:	0ff00446 	jal	9fc01118 <puts>
9fc0058c:	3c16bfaf 	lui	s6,0xbfaf
9fc00590:	3c02bfaf 	lui	v0,0xbfaf
9fc00594:	240e0001 	li	t6,1
9fc00598:	3459f000 	ori	t9,v0,0xf000
9fc0059c:	344ff008 	ori	t7,v0,0xf008
9fc005a0:	3443f004 	ori	v1,v0,0xf004
9fc005a4:	3418ffff 	li	t8,0xffff
9fc005a8:	ac6e0000 	sw	t6,0(v1)
9fc005ac:	af380000 	sw	t8,0(t9)
9fc005b0:	0bf00145 	j	9fc00514 <shell4+0x154>
9fc005b4:	adee0000 	sw	t6,0(t7)
	...
9fc005c0:	8f848010 	lw	a0,-32752(gp)
9fc005c4:	0ff00268 	jal	9fc009a0 <crc32>
9fc005c8:	00000000 	nop
9fc005cc:	0bf0012f 	j	9fc004bc <shell4+0xfc>
9fc005d0:	00408821 	move	s1,v0
	...

9fc005e0 <updateCRC32>:
updateCRC32():
9fc005e0:	00a44826 	xor	t1,a1,a0
9fc005e4:	312800ff 	andi	t0,t1,0xff
9fc005e8:	3c079fc0 	lui	a3,0x9fc0
9fc005ec:	00081880 	sll	v1,t0,0x2
9fc005f0:	24e618a0 	addiu	a2,a3,6304
9fc005f4:	00662021 	addu	a0,v1,a2
9fc005f8:	8c820000 	lw	v0,0(a0)
9fc005fc:	00052a02 	srl	a1,a1,0x8
9fc00600:	03e00008 	jr	ra
9fc00604:	00a21026 	xor	v0,a1,v0
	...

9fc00610 <crc32buf>:
crc32buf():
9fc00610:	10a0005b 	beqz	a1,9fc00780 <crc32buf+0x170>
9fc00614:	00805021 	move	t2,a0
9fc00618:	90890000 	lbu	t1,0(a0)
9fc0061c:	3c0c9fc0 	lui	t4,0x9fc0
9fc00620:	00095880 	sll	t3,t1,0x2
9fc00624:	396803fc 	xori	t0,t3,0x3fc
9fc00628:	258918a0 	addiu	t1,t4,6304
9fc0062c:	01093821 	addu	a3,t0,t1
9fc00630:	8ce40000 	lw	a0,0(a3)
9fc00634:	24a3ffff 	addiu	v1,a1,-1
9fc00638:	2406ffff 	li	a2,-1
9fc0063c:	00604021 	move	t0,v1
9fc00640:	00061202 	srl	v0,a2,0x8
9fc00644:	00823026 	xor	a2,a0,v0
9fc00648:	30630003 	andi	v1,v1,0x3
9fc0064c:	11000049 	beqz	t0,9fc00774 <crc32buf+0x164>
9fc00650:	25470001 	addiu	a3,t2,1
9fc00654:	10600024 	beqz	v1,9fc006e8 <crc32buf+0xd8>
9fc00658:	24180001 	li	t8,1
9fc0065c:	10780017 	beq	v1,t8,9fc006bc <crc32buf+0xac>
9fc00660:	24190002 	li	t9,2
9fc00664:	1079000b 	beq	v1,t9,9fc00694 <crc32buf+0x84>
9fc00668:	00061a02 	srl	v1,a2,0x8
9fc0066c:	91440001 	lbu	a0,1(t2)
9fc00670:	00000000 	nop
9fc00674:	00c45826 	xor	t3,a2,a0
9fc00678:	316600ff 	andi	a2,t3,0xff
9fc0067c:	00061080 	sll	v0,a2,0x2
9fc00680:	00494021 	addu	t0,v0,t1
9fc00684:	8d070000 	lw	a3,0(t0)
9fc00688:	24a8fffe 	addiu	t0,a1,-2
9fc0068c:	00e33026 	xor	a2,a3,v1
9fc00690:	25470002 	addiu	a3,t2,2
9fc00694:	90f80000 	lbu	t8,0(a3)
9fc00698:	00065202 	srl	t2,a2,0x8
9fc0069c:	00d87826 	xor	t7,a2,t8
9fc006a0:	31e500ff 	andi	a1,t7,0xff
9fc006a4:	00057080 	sll	t6,a1,0x2
9fc006a8:	01c96821 	addu	t5,t6,t1
9fc006ac:	8dac0000 	lw	t4,0(t5)
9fc006b0:	2508ffff 	addiu	t0,t0,-1
9fc006b4:	018a3026 	xor	a2,t4,t2
9fc006b8:	24e70001 	addiu	a3,a3,1
9fc006bc:	90ec0000 	lbu	t4,0(a3)
9fc006c0:	00061a02 	srl	v1,a2,0x8
9fc006c4:	00cc2026 	xor	a0,a2,t4
9fc006c8:	308b00ff 	andi	t3,a0,0xff
9fc006cc:	000b3080 	sll	a2,t3,0x2
9fc006d0:	00c91021 	addu	v0,a2,t1
9fc006d4:	8c590000 	lw	t9,0(v0)
9fc006d8:	2508ffff 	addiu	t0,t0,-1
9fc006dc:	03233026 	xor	a2,t9,v1
9fc006e0:	11000024 	beqz	t0,9fc00774 <crc32buf+0x164>
9fc006e4:	24e70001 	addiu	a3,a3,1
9fc006e8:	90ef0000 	lbu	t7,0(a3)
9fc006ec:	00066202 	srl	t4,a2,0x8
9fc006f0:	00cf2826 	xor	a1,a2,t7
9fc006f4:	30ae00ff 	andi	t6,a1,0xff
9fc006f8:	000e6880 	sll	t5,t6,0x2
9fc006fc:	01a95021 	addu	t2,t5,t1
9fc00700:	8d440000 	lw	a0,0(t2)
9fc00704:	90eb0001 	lbu	t3,1(a3)
9fc00708:	008cc026 	xor	t8,a0,t4
9fc0070c:	030b3026 	xor	a2,t8,t3
9fc00710:	30c300ff 	andi	v1,a2,0xff
9fc00714:	00031080 	sll	v0,v1,0x2
9fc00718:	0049c821 	addu	t9,v0,t1
9fc0071c:	8f250000 	lw	a1,0(t9)
9fc00720:	00187a02 	srl	t7,t8,0x8
9fc00724:	90ee0002 	lbu	t6,2(a3)
9fc00728:	00af3026 	xor	a2,a1,t7
9fc0072c:	00ce6826 	xor	t5,a2,t6
9fc00730:	31aa00ff 	andi	t2,t5,0xff
9fc00734:	000a6080 	sll	t4,t2,0x2
9fc00738:	01895821 	addu	t3,t4,t1
9fc0073c:	8d630000 	lw	v1,0(t3)
9fc00740:	00062202 	srl	a0,a2,0x8
9fc00744:	90e20003 	lbu	v0,3(a3)
9fc00748:	00646826 	xor	t5,v1,a0
9fc0074c:	01a2c826 	xor	t9,t5,v0
9fc00750:	333800ff 	andi	t8,t9,0xff
9fc00754:	00187880 	sll	t7,t8,0x2
9fc00758:	01e97021 	addu	t6,t7,t1
9fc0075c:	8dca0000 	lw	t2,0(t6)
9fc00760:	000d2a02 	srl	a1,t5,0x8
9fc00764:	2508fffc 	addiu	t0,t0,-4
9fc00768:	01453026 	xor	a2,t2,a1
9fc0076c:	1500ffde 	bnez	t0,9fc006e8 <crc32buf+0xd8>
9fc00770:	24e70004 	addiu	a3,a3,4
9fc00774:	03e00008 	jr	ra
9fc00778:	00061027 	nor	v0,zero,a2
9fc0077c:	00000000 	nop
9fc00780:	03e00008 	jr	ra
9fc00784:	00001021 	move	v0,zero
	...

9fc00790 <crc32file>:
crc32file():
9fc00790:	27bdffc8 	addiu	sp,sp,-56
9fc00794:	acc00000 	sw	zero,0(a2)
9fc00798:	afbf0034 	sw	ra,52(sp)
9fc0079c:	afb70030 	sw	s7,48(sp)
9fc007a0:	afb6002c 	sw	s6,44(sp)
9fc007a4:	afb50028 	sw	s5,40(sp)
9fc007a8:	afb40024 	sw	s4,36(sp)
9fc007ac:	afb30020 	sw	s3,32(sp)
9fc007b0:	afb2001c 	sw	s2,28(sp)
9fc007b4:	afb10018 	sw	s1,24(sp)
9fc007b8:	00c09021 	move	s2,a2
9fc007bc:	afb00014 	sw	s0,20(sp)
9fc007c0:	0ff002e4 	jal	9fc00b90 <fopen>
9fc007c4:	00a0b821 	move	s7,a1
9fc007c8:	3c059fc0 	lui	a1,0x9fc0
9fc007cc:	24a4186c 	addiu	a0,a1,6252
9fc007d0:	0ff00446 	jal	9fc01118 <puts>
9fc007d4:	00409821 	move	s3,v0
9fc007d8:	8e640000 	lw	a0,0(s3)
9fc007dc:	0ff00494 	jal	9fc01250 <strlen>
9fc007e0:	2414ffff 	li	s4,-1
9fc007e4:	3c049fc0 	lui	a0,0x9fc0
9fc007e8:	24841874 	addiu	a0,a0,6260
9fc007ec:	0ff00380 	jal	9fc00e00 <printf>
9fc007f0:	00402821 	move	a1,v0
9fc007f4:	3c039fc0 	lui	v1,0x9fc0
9fc007f8:	3c029fc0 	lui	v0,0x9fc0
9fc007fc:	02602021 	move	a0,s3
9fc00800:	24751880 	addiu	s5,v1,6272
9fc00804:	0ff00301 	jal	9fc00c04 <getc>
9fc00808:	245618a0 	addiu	s6,v0,6304
9fc0080c:	2410ffff 	li	s0,-1
9fc00810:	00408821 	move	s1,v0
9fc00814:	10540049 	beq	v0,s4,9fc0093c <crc32file+0x1ac>
9fc00818:	02a02021 	move	a0,s5
9fc0081c:	8e4d0000 	lw	t5,0(s2)
9fc00820:	00000000 	nop
9fc00824:	25ac0001 	addiu	t4,t5,1
9fc00828:	01802821 	move	a1,t4
9fc0082c:	0ff00380 	jal	9fc00e00 <printf>
9fc00830:	ae4c0000 	sw	t4,0(s2)
9fc00834:	02115826 	xor	t3,s0,s1
9fc00838:	316a00ff 	andi	t2,t3,0xff
9fc0083c:	000a4880 	sll	t1,t2,0x2
9fc00840:	01364021 	addu	t0,t1,s6
9fc00844:	8d070000 	lw	a3,0(t0)
9fc00848:	00103202 	srl	a2,s0,0x8
9fc0084c:	02602021 	move	a0,s3
9fc00850:	0ff00301 	jal	9fc00c04 <getc>
9fc00854:	00e68026 	xor	s0,a3,a2
9fc00858:	00408821 	move	s1,v0
9fc0085c:	10540037 	beq	v0,s4,9fc0093c <crc32file+0x1ac>
9fc00860:	02a02021 	move	a0,s5
9fc00864:	8e460000 	lw	a2,0(s2)
9fc00868:	00000000 	nop
9fc0086c:	24df0001 	addiu	ra,a2,1
9fc00870:	03e02821 	move	a1,ra
9fc00874:	ae5f0000 	sw	ra,0(s2)
9fc00878:	0ff00380 	jal	9fc00e00 <printf>
9fc0087c:	00000000 	nop
9fc00880:	02112826 	xor	a1,s0,s1
9fc00884:	30a400ff 	andi	a0,a1,0xff
9fc00888:	00041880 	sll	v1,a0,0x2
9fc0088c:	00761021 	addu	v0,v1,s6
9fc00890:	8c590000 	lw	t9,0(v0)
9fc00894:	0010c202 	srl	t8,s0,0x8
9fc00898:	02602021 	move	a0,s3
9fc0089c:	0ff00301 	jal	9fc00c04 <getc>
9fc008a0:	03388026 	xor	s0,t9,t8
9fc008a4:	00408821 	move	s1,v0
9fc008a8:	10540024 	beq	v0,s4,9fc0093c <crc32file+0x1ac>
9fc008ac:	02a02021 	move	a0,s5
9fc008b0:	8e4e0000 	lw	t6,0(s2)
9fc008b4:	00000000 	nop
9fc008b8:	25cd0001 	addiu	t5,t6,1
9fc008bc:	01a02821 	move	a1,t5
9fc008c0:	0ff00380 	jal	9fc00e00 <printf>
9fc008c4:	ae4d0000 	sw	t5,0(s2)
9fc008c8:	02116026 	xor	t4,s0,s1
9fc008cc:	318b00ff 	andi	t3,t4,0xff
9fc008d0:	000b5080 	sll	t2,t3,0x2
9fc008d4:	01564821 	addu	t1,t2,s6
9fc008d8:	8d280000 	lw	t0,0(t1)
9fc008dc:	00103a02 	srl	a3,s0,0x8
9fc008e0:	02602021 	move	a0,s3
9fc008e4:	0ff00301 	jal	9fc00c04 <getc>
9fc008e8:	01078026 	xor	s0,t0,a3
9fc008ec:	00408821 	move	s1,v0
9fc008f0:	10540012 	beq	v0,s4,9fc0093c <crc32file+0x1ac>
9fc008f4:	02a02021 	move	a0,s5
9fc008f8:	8e450000 	lw	a1,0(s2)
9fc008fc:	00000000 	nop
9fc00900:	24a50001 	addiu	a1,a1,1
9fc00904:	0ff00380 	jal	9fc00e00 <printf>
9fc00908:	ae450000 	sw	a1,0(s2)
9fc0090c:	02111826 	xor	v1,s0,s1
9fc00910:	306200ff 	andi	v0,v1,0xff
9fc00914:	0002c880 	sll	t9,v0,0x2
9fc00918:	0336c021 	addu	t8,t9,s6
9fc0091c:	8f110000 	lw	s1,0(t8)
9fc00920:	00107a02 	srl	t7,s0,0x8
9fc00924:	02602021 	move	a0,s3
9fc00928:	0ff00301 	jal	9fc00c04 <getc>
9fc0092c:	022f8026 	xor	s0,s1,t7
9fc00930:	00408821 	move	s1,v0
9fc00934:	1454ffb9 	bne	v0,s4,9fc0081c <crc32file+0x8c>
9fc00938:	02a02021 	move	a0,s5
9fc0093c:	3c119fc0 	lui	s1,0x9fc0
9fc00940:	26241888 	addiu	a0,s1,6280
9fc00944:	0ff00380 	jal	9fc00e00 <printf>
9fc00948:	2405ffff 	li	a1,-1
9fc0094c:	3c0f9fc0 	lui	t7,0x9fc0
9fc00950:	0ff00446 	jal	9fc01118 <puts>
9fc00954:	25e4188c 	addiu	a0,t7,6284
9fc00958:	0ff002f5 	jal	9fc00bd4 <fclose>
9fc0095c:	02602021 	move	a0,s3
9fc00960:	8fbf0034 	lw	ra,52(sp)
9fc00964:	00107027 	nor	t6,zero,s0
9fc00968:	aeee0000 	sw	t6,0(s7)
9fc0096c:	00001021 	move	v0,zero
9fc00970:	8fb70030 	lw	s7,48(sp)
9fc00974:	8fb6002c 	lw	s6,44(sp)
9fc00978:	8fb50028 	lw	s5,40(sp)
9fc0097c:	8fb40024 	lw	s4,36(sp)
9fc00980:	8fb30020 	lw	s3,32(sp)
9fc00984:	8fb2001c 	lw	s2,28(sp)
9fc00988:	8fb10018 	lw	s1,24(sp)
9fc0098c:	8fb00014 	lw	s0,20(sp)
9fc00990:	03e00008 	jr	ra
9fc00994:	27bd0038 	addiu	sp,sp,56
	...

9fc009a0 <crc32>:
crc32():
9fc009a0:	27bdffc8 	addiu	sp,sp,-56
9fc009a4:	afbf0034 	sw	ra,52(sp)
9fc009a8:	afb70030 	sw	s7,48(sp)
9fc009ac:	afb6002c 	sw	s6,44(sp)
9fc009b0:	afb50028 	sw	s5,40(sp)
9fc009b4:	afb30020 	sw	s3,32(sp)
9fc009b8:	afb2001c 	sw	s2,28(sp)
9fc009bc:	afb10018 	sw	s1,24(sp)
9fc009c0:	afb00014 	sw	s0,20(sp)
9fc009c4:	0ff002e4 	jal	9fc00b90 <fopen>
9fc009c8:	afb40024 	sw	s4,36(sp)
9fc009cc:	3c059fc0 	lui	a1,0x9fc0
9fc009d0:	24a4186c 	addiu	a0,a1,6252
9fc009d4:	0ff00446 	jal	9fc01118 <puts>
9fc009d8:	00409821 	move	s3,v0
9fc009dc:	8e640000 	lw	a0,0(s3)
9fc009e0:	0ff00494 	jal	9fc01250 <strlen>
9fc009e4:	2415ffff 	li	s5,-1
9fc009e8:	3c049fc0 	lui	a0,0x9fc0
9fc009ec:	24841874 	addiu	a0,a0,6260
9fc009f0:	0ff00380 	jal	9fc00e00 <printf>
9fc009f4:	00402821 	move	a1,v0
9fc009f8:	3c039fc0 	lui	v1,0x9fc0
9fc009fc:	3c029fc0 	lui	v0,0x9fc0
9fc00a00:	02602021 	move	a0,s3
9fc00a04:	24761880 	addiu	s6,v1,6272
9fc00a08:	0ff00301 	jal	9fc00c04 <getc>
9fc00a0c:	245718a0 	addiu	s7,v0,6304
9fc00a10:	2411ffff 	li	s1,-1
9fc00a14:	00009021 	move	s2,zero
9fc00a18:	00408021 	move	s0,v0
9fc00a1c:	1055003e 	beq	v0,s5,9fc00b18 <crc32+0x178>
9fc00a20:	02c02021 	move	a0,s6
9fc00a24:	26520001 	addiu	s2,s2,1
9fc00a28:	0ff00380 	jal	9fc00e00 <printf>
9fc00a2c:	02402821 	move	a1,s2
9fc00a30:	02305826 	xor	t3,s1,s0
9fc00a34:	316a00ff 	andi	t2,t3,0xff
9fc00a38:	000a4880 	sll	t1,t2,0x2
9fc00a3c:	01374021 	addu	t0,t1,s7
9fc00a40:	8d070000 	lw	a3,0(t0)
9fc00a44:	00113202 	srl	a2,s1,0x8
9fc00a48:	02602021 	move	a0,s3
9fc00a4c:	0ff00301 	jal	9fc00c04 <getc>
9fc00a50:	00e68826 	xor	s1,a3,a2
9fc00a54:	00408021 	move	s0,v0
9fc00a58:	02c02021 	move	a0,s6
9fc00a5c:	1055002e 	beq	v0,s5,9fc00b18 <crc32+0x178>
9fc00a60:	0240a021 	move	s4,s2
9fc00a64:	26520001 	addiu	s2,s2,1
9fc00a68:	0ff00380 	jal	9fc00e00 <printf>
9fc00a6c:	02402821 	move	a1,s2
9fc00a70:	02302826 	xor	a1,s1,s0
9fc00a74:	30a400ff 	andi	a0,a1,0xff
9fc00a78:	00041880 	sll	v1,a0,0x2
9fc00a7c:	00771021 	addu	v0,v1,s7
9fc00a80:	8c590000 	lw	t9,0(v0)
9fc00a84:	0011c202 	srl	t8,s1,0x8
9fc00a88:	02602021 	move	a0,s3
9fc00a8c:	0ff00301 	jal	9fc00c04 <getc>
9fc00a90:	03388826 	xor	s1,t9,t8
9fc00a94:	00408021 	move	s0,v0
9fc00a98:	1055001f 	beq	v0,s5,9fc00b18 <crc32+0x178>
9fc00a9c:	02c02021 	move	a0,s6
9fc00aa0:	26920002 	addiu	s2,s4,2
9fc00aa4:	0ff00380 	jal	9fc00e00 <printf>
9fc00aa8:	02402821 	move	a1,s2
9fc00aac:	02305826 	xor	t3,s1,s0
9fc00ab0:	316a00ff 	andi	t2,t3,0xff
9fc00ab4:	000a4880 	sll	t1,t2,0x2
9fc00ab8:	01374021 	addu	t0,t1,s7
9fc00abc:	8d070000 	lw	a3,0(t0)
9fc00ac0:	00113202 	srl	a2,s1,0x8
9fc00ac4:	02602021 	move	a0,s3
9fc00ac8:	0ff00301 	jal	9fc00c04 <getc>
9fc00acc:	00e68826 	xor	s1,a3,a2
9fc00ad0:	00408021 	move	s0,v0
9fc00ad4:	10550010 	beq	v0,s5,9fc00b18 <crc32+0x178>
9fc00ad8:	02c02021 	move	a0,s6
9fc00adc:	26920003 	addiu	s2,s4,3
9fc00ae0:	02402821 	move	a1,s2
9fc00ae4:	0ff00380 	jal	9fc00e00 <printf>
9fc00ae8:	0230a026 	xor	s4,s1,s0
9fc00aec:	328f00ff 	andi	t7,s4,0xff
9fc00af0:	000f7080 	sll	t6,t7,0x2
9fc00af4:	01d76821 	addu	t5,t6,s7
9fc00af8:	8dac0000 	lw	t4,0(t5)
9fc00afc:	00118202 	srl	s0,s1,0x8
9fc00b00:	02602021 	move	a0,s3
9fc00b04:	0ff00301 	jal	9fc00c04 <getc>
9fc00b08:	01908826 	xor	s1,t4,s0
9fc00b0c:	00408021 	move	s0,v0
9fc00b10:	1455ffc4 	bne	v0,s5,9fc00a24 <crc32+0x84>
9fc00b14:	02c02021 	move	a0,s6
9fc00b18:	3c149fc0 	lui	s4,0x9fc0
9fc00b1c:	2405ffff 	li	a1,-1
9fc00b20:	0ff00380 	jal	9fc00e00 <printf>
9fc00b24:	26841888 	addiu	a0,s4,6280
9fc00b28:	3c0f9fc0 	lui	t7,0x9fc0
9fc00b2c:	0ff00446 	jal	9fc01118 <puts>
9fc00b30:	25e4188c 	addiu	a0,t7,6284
9fc00b34:	0ff002f5 	jal	9fc00bd4 <fclose>
9fc00b38:	02602021 	move	a0,s3
9fc00b3c:	00119827 	nor	s3,zero,s1
9fc00b40:	3c0e9fc0 	lui	t6,0x9fc0
9fc00b44:	02403021 	move	a2,s2
9fc00b48:	02602821 	move	a1,s3
9fc00b4c:	0ff00380 	jal	9fc00e00 <printf>
9fc00b50:	25c41890 	addiu	a0,t6,6288
9fc00b54:	3c0da088 	lui	t5,0xa088
9fc00b58:	35acd565 	ori	t4,t5,0xd565
9fc00b5c:	8fbf0034 	lw	ra,52(sp)
9fc00b60:	026c8021 	addu	s0,s3,t4
9fc00b64:	0010102b 	sltu	v0,zero,s0
9fc00b68:	8fb70030 	lw	s7,48(sp)
9fc00b6c:	8fb6002c 	lw	s6,44(sp)
9fc00b70:	8fb50028 	lw	s5,40(sp)
9fc00b74:	8fb40024 	lw	s4,36(sp)
9fc00b78:	8fb30020 	lw	s3,32(sp)
9fc00b7c:	8fb2001c 	lw	s2,28(sp)
9fc00b80:	8fb10018 	lw	s1,24(sp)
9fc00b84:	8fb00014 	lw	s0,20(sp)
9fc00b88:	03e00008 	jr	ra
9fc00b8c:	27bd0038 	addiu	sp,sp,56

9fc00b90 <fopen>:
fopen():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:20
9fc00b90:	3c029fc0 	lui	v0,0x9fc0
9fc00b94:	24471e40 	addiu	a3,v0,7744
9fc00b98:	00e02821 	move	a1,a3
9fc00b9c:	00001821 	move	v1,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:22
9fc00ba0:	2406000a 	li	a2,10
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:23
9fc00ba4:	8ca20000 	lw	v0,0(a1)
9fc00ba8:	00000000 	nop
9fc00bac:	10400004 	beqz	v0,9fc00bc0 <fopen+0x30>
9fc00bb0:	24a50008 	addiu	a1,a1,8
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:22
9fc00bb4:	24630001 	addiu	v1,v1,1
9fc00bb8:	1466fffa 	bne	v1,a2,9fc00ba4 <fopen+0x14>
9fc00bbc:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:27
9fc00bc0:	000310c0 	sll	v0,v1,0x3
9fc00bc4:	00471021 	addu	v0,v0,a3
9fc00bc8:	ac440000 	sw	a0,0(v0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:30
9fc00bcc:	03e00008 	jr	ra
9fc00bd0:	ac400004 	sw	zero,4(v0)

9fc00bd4 <fclose>:
fclose():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:61
9fc00bd4:	3c029fc0 	lui	v0,0x9fc0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:63
9fc00bd8:	3c039fc0 	lui	v1,0x9fc0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:61
9fc00bdc:	24421e40 	addiu	v0,v0,7744
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:63
9fc00be0:	24631e90 	addiu	v1,v1,7824
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:64
9fc00be4:	10820004 	beq	a0,v0,9fc00bf8 <fclose+0x24>
9fc00be8:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:65
9fc00bec:	24420008 	addiu	v0,v0,8
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:63
9fc00bf0:	1443fffc 	bne	v0,v1,9fc00be4 <fclose+0x10>
9fc00bf4:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:69
9fc00bf8:	ac800004 	sw	zero,4(a0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:70
9fc00bfc:	03e00008 	jr	ra
9fc00c00:	ac800000 	sw	zero,0(a0)

9fc00c04 <getc>:
getc():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:88
9fc00c04:	27bdffe0 	addiu	sp,sp,-32
9fc00c08:	afb00014 	sw	s0,20(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:89
9fc00c0c:	8c900000 	lw	s0,0(a0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:88
9fc00c10:	afb10018 	sw	s1,24(sp)
9fc00c14:	00808821 	move	s1,a0
9fc00c18:	afbf001c 	sw	ra,28(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:90
9fc00c1c:	0ff00494 	jal	9fc01250 <strlen>
9fc00c20:	02002021 	move	a0,s0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:91
9fc00c24:	8e230004 	lw	v1,4(s1)
9fc00c28:	00000000 	nop
9fc00c2c:	10620009 	beq	v1,v0,9fc00c54 <getc+0x50>
9fc00c30:	02031021 	addu	v0,s0,v1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:97
9fc00c34:	8fbf001c 	lw	ra,28(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:94
9fc00c38:	24630001 	addiu	v1,v1,1
9fc00c3c:	90420000 	lbu	v0,0(v0)
9fc00c40:	ae230004 	sw	v1,4(s1)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:97
9fc00c44:	8fb00014 	lw	s0,20(sp)
9fc00c48:	8fb10018 	lw	s1,24(sp)
9fc00c4c:	03e00008 	jr	ra
9fc00c50:	27bd0020 	addiu	sp,sp,32
9fc00c54:	8fbf001c 	lw	ra,28(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:91
9fc00c58:	2402ffff 	li	v0,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:97
9fc00c5c:	8fb10018 	lw	s1,24(sp)
9fc00c60:	8fb00014 	lw	s0,20(sp)
9fc00c64:	03e00008 	jr	ra
9fc00c68:	27bd0020 	addiu	sp,sp,32

9fc00c6c <fgets>:
fgets():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:72
9fc00c6c:	27bdffe0 	addiu	sp,sp,-32
9fc00c70:	afb10014 	sw	s1,20(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:73
9fc00c74:	8cd10000 	lw	s1,0(a2)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:72
9fc00c78:	afb20018 	sw	s2,24(sp)
9fc00c7c:	afb00010 	sw	s0,16(sp)
9fc00c80:	00809021 	move	s2,a0
9fc00c84:	00c08021 	move	s0,a2
9fc00c88:	afbf001c 	sw	ra,28(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:74
9fc00c8c:	0ff00494 	jal	9fc01250 <strlen>
9fc00c90:	02202021 	move	a0,s1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:77
9fc00c94:	8e040004 	lw	a0,4(s0)
9fc00c98:	00000000 	nop
9fc00c9c:	10820012 	beq	a0,v0,9fc00ce8 <fgets+0x7c>
9fc00ca0:	00403821 	move	a3,v0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:78
9fc00ca4:	02242821 	addu	a1,s1,a0
9fc00ca8:	80a30000 	lb	v1,0(a1)
9fc00cac:	2402000a 	li	v0,10
9fc00cb0:	10620014 	beq	v1,v0,9fc00d04 <fgets+0x98>
9fc00cb4:	00003021 	move	a2,zero
9fc00cb8:	0bf00334 	j	9fc00cd0 <fgets+0x64>
9fc00cbc:	2408000a 	li	t0,10
9fc00cc0:	80a30001 	lb	v1,1(a1)
9fc00cc4:	00000000 	nop
9fc00cc8:	1068000e 	beq	v1,t0,9fc00d04 <fgets+0x98>
9fc00ccc:	24a50001 	addiu	a1,a1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:82
9fc00cd0:	02461021 	addu	v0,s2,a2
9fc00cd4:	24840001 	addiu	a0,a0,1
9fc00cd8:	a0430000 	sb	v1,0(v0)
9fc00cdc:	24c60001 	addiu	a2,a2,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:77
9fc00ce0:	14e4fff7 	bne	a3,a0,9fc00cc0 <fgets+0x54>
9fc00ce4:	ae040004 	sw	a0,4(s0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:86
9fc00ce8:	8fbf001c 	lw	ra,28(sp)
9fc00cec:	00001021 	move	v0,zero
9fc00cf0:	8fb20018 	lw	s2,24(sp)
9fc00cf4:	8fb10014 	lw	s1,20(sp)
9fc00cf8:	8fb00010 	lw	s0,16(sp)
9fc00cfc:	03e00008 	jr	ra
9fc00d00:	27bd0020 	addiu	sp,sp,32
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:79
9fc00d04:	02461021 	addu	v0,s2,a2
9fc00d08:	2403000a 	li	v1,10
9fc00d0c:	a0430000 	sb	v1,0(v0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:86
9fc00d10:	8fbf001c 	lw	ra,28(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:79
9fc00d14:	24840001 	addiu	a0,a0,1
9fc00d18:	ae040004 	sw	a0,4(s0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:86
9fc00d1c:	00001021 	move	v0,zero
9fc00d20:	8fb20018 	lw	s2,24(sp)
9fc00d24:	8fb10014 	lw	s1,20(sp)
9fc00d28:	8fb00010 	lw	s0,16(sp)
9fc00d2c:	03e00008 	jr	ra
9fc00d30:	27bd0020 	addiu	sp,sp,32

9fc00d34 <fread>:
fread():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:32
9fc00d34:	27bdffd8 	addiu	sp,sp,-40
9fc00d38:	afb10014 	sw	s1,20(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:34
9fc00d3c:	8cf10000 	lw	s1,0(a3)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:32
9fc00d40:	afb40020 	sw	s4,32(sp)
9fc00d44:	0080a021 	move	s4,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:35
9fc00d48:	02202021 	move	a0,s1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:32
9fc00d4c:	afb3001c 	sw	s3,28(sp)
9fc00d50:	afb20018 	sw	s2,24(sp)
9fc00d54:	afb00010 	sw	s0,16(sp)
9fc00d58:	afbf0024 	sw	ra,36(sp)
9fc00d5c:	00e08021 	move	s0,a3
9fc00d60:	00a09821 	move	s3,a1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:35
9fc00d64:	0ff00494 	jal	9fc01250 <strlen>
9fc00d68:	00c09021 	move	s2,a2
9fc00d6c:	00404821 	move	t1,v0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:36
9fc00d70:	8e020004 	lw	v0,4(s0)
9fc00d74:	00000000 	nop
9fc00d78:	10490017 	beq	v0,t1,9fc00dd8 <fread+0xa4>
9fc00d7c:	02530018 	mult	s2,s3
9fc00d80:	00003821 	move	a3,zero
9fc00d84:	00002812 	mflo	a1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:40
9fc00d88:	00e5102b 	sltu	v0,a3,a1
9fc00d8c:	10400009 	beqz	v0,9fc00db4 <fread+0x80>
9fc00d90:	02874021 	addu	t0,s4,a3
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:41
9fc00d94:	8e020004 	lw	v0,4(s0)
9fc00d98:	24e70001 	addiu	a3,a3,1
9fc00d9c:	02221821 	addu	v1,s1,v0
9fc00da0:	90640000 	lbu	a0,0(v1)
9fc00da4:	24420001 	addiu	v0,v0,1
9fc00da8:	a1040000 	sb	a0,0(t0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:42
9fc00dac:	1522fff6 	bne	t1,v0,9fc00d88 <fread+0x54>
9fc00db0:	ae020004 	sw	v0,4(s0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:47
9fc00db4:	8fbf0024 	lw	ra,36(sp)
9fc00db8:	00e01021 	move	v0,a3
9fc00dbc:	8fb40020 	lw	s4,32(sp)
9fc00dc0:	8fb3001c 	lw	s3,28(sp)
9fc00dc4:	8fb20018 	lw	s2,24(sp)
9fc00dc8:	8fb10014 	lw	s1,20(sp)
9fc00dcc:	8fb00010 	lw	s0,16(sp)
9fc00dd0:	03e00008 	jr	ra
9fc00dd4:	27bd0028 	addiu	sp,sp,40
9fc00dd8:	8fbf0024 	lw	ra,36(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:36
9fc00ddc:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/stdio.c:47
9fc00de0:	00e01021 	move	v0,a3
9fc00de4:	8fb40020 	lw	s4,32(sp)
9fc00de8:	8fb3001c 	lw	s3,28(sp)
9fc00dec:	8fb20018 	lw	s2,24(sp)
9fc00df0:	8fb10014 	lw	s1,20(sp)
9fc00df4:	8fb00010 	lw	s0,16(sp)
9fc00df8:	03e00008 	jr	ra
9fc00dfc:	27bd0028 	addiu	sp,sp,40

9fc00e00 <printf>:
printf():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:2
9fc00e00:	27bdffc8 	addiu	sp,sp,-56
9fc00e04:	afb30024 	sw	s3,36(sp)
9fc00e08:	afbf0034 	sw	ra,52(sp)
9fc00e0c:	afb60030 	sw	s6,48(sp)
9fc00e10:	afb5002c 	sw	s5,44(sp)
9fc00e14:	afb40028 	sw	s4,40(sp)
9fc00e18:	afb20020 	sw	s2,32(sp)
9fc00e1c:	afb1001c 	sw	s1,28(sp)
9fc00e20:	afb00018 	sw	s0,24(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:10
9fc00e24:	80900000 	lb	s0,0(a0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:2
9fc00e28:	00809821 	move	s3,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:8
9fc00e2c:	27a4003c 	addiu	a0,sp,60
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:2
9fc00e30:	afa5003c 	sw	a1,60(sp)
9fc00e34:	afa60040 	sw	a2,64(sp)
9fc00e38:	afa70044 	sw	a3,68(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:10
9fc00e3c:	12000013 	beqz	s0,9fc00e8c <printf+0x8c>
9fc00e40:	afa40010 	sw	a0,16(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:17
9fc00e44:	3c029fc0 	lui	v0,0x9fc0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:9
9fc00e48:	00809021 	move	s2,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:17
9fc00e4c:	24561ca0 	addiu	s6,v0,7328
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:9
9fc00e50:	00008821 	move	s1,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:13
9fc00e54:	24140025 	li	s4,37
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:79
9fc00e58:	2415000a 	li	s5,10
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:13
9fc00e5c:	12140016 	beq	s0,s4,9fc00eb8 <printf+0xb8>
9fc00e60:	02711021 	addu	v0,s3,s1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:79
9fc00e64:	1215002f 	beq	s0,s5,9fc00f24 <printf+0x124>
9fc00e68:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:80
9fc00e6c:	0ff00419 	jal	9fc01064 <putchar>
9fc00e70:	02002021 	move	a0,s0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:10
9fc00e74:	26310001 	addiu	s1,s1,1
9fc00e78:	02711021 	addu	v0,s3,s1
9fc00e7c:	80500000 	lb	s0,0(v0)
9fc00e80:	00000000 	nop
9fc00e84:	1600fff5 	bnez	s0,9fc00e5c <printf+0x5c>
9fc00e88:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:84
9fc00e8c:	8fbf0034 	lw	ra,52(sp)
9fc00e90:	00001021 	move	v0,zero
9fc00e94:	8fb60030 	lw	s6,48(sp)
9fc00e98:	8fb5002c 	lw	s5,44(sp)
9fc00e9c:	8fb40028 	lw	s4,40(sp)
9fc00ea0:	8fb30024 	lw	s3,36(sp)
9fc00ea4:	8fb20020 	lw	s2,32(sp)
9fc00ea8:	8fb1001c 	lw	s1,28(sp)
9fc00eac:	8fb00018 	lw	s0,24(sp)
9fc00eb0:	03e00008 	jr	ra
9fc00eb4:	27bd0038 	addiu	sp,sp,56
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:13
9fc00eb8:	80440001 	lb	a0,1(v0)
9fc00ebc:	24050001 	li	a1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:17
9fc00ec0:	2482ffdb 	addiu	v0,a0,-37
9fc00ec4:	304200ff 	andi	v0,v0,0xff
9fc00ec8:	2c430054 	sltiu	v1,v0,84
9fc00ecc:	14600005 	bnez	v1,9fc00ee4 <printf+0xe4>
9fc00ed0:	00021080 	sll	v0,v0,0x2
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:73
9fc00ed4:	0ff00419 	jal	9fc01064 <putchar>
9fc00ed8:	24040025 	li	a0,37
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:10
9fc00edc:	0bf0039e 	j	9fc00e78 <printf+0x78>
9fc00ee0:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:17
9fc00ee4:	02c21021 	addu	v0,s6,v0
9fc00ee8:	8c430000 	lw	v1,0(v0)
9fc00eec:	00000000 	nop
9fc00ef0:	00600008 	jr	v1
9fc00ef4:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:65
9fc00ef8:	26310001 	addiu	s1,s1,1
9fc00efc:	02711021 	addu	v0,s3,s1
9fc00f00:	80440001 	lb	a0,1(v0)
9fc00f04:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:67
9fc00f08:	2482ffcf 	addiu	v0,a0,-49
9fc00f0c:	304200ff 	andi	v0,v0,0xff
9fc00f10:	2c420009 	sltiu	v0,v0,9
9fc00f14:	1440003f 	bnez	v0,9fc01014 <printf+0x214>
9fc00f18:	00002821 	move	a1,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:17
9fc00f1c:	0bf003b1 	j	9fc00ec4 <printf+0xc4>
9fc00f20:	2482ffdb 	addiu	v0,a0,-37
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:79
9fc00f24:	0ff00419 	jal	9fc01064 <putchar>
9fc00f28:	2404000d 	li	a0,13
9fc00f2c:	0bf0039b 	j	9fc00e6c <printf+0x6c>
9fc00f30:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:30
9fc00f34:	8e440000 	lw	a0,0(s2)
9fc00f38:	2406000a 	li	a2,10
9fc00f3c:	0ff00454 	jal	9fc01150 <printbase>
9fc00f40:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:31
9fc00f44:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:32
9fc00f48:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc00f4c:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:20
9fc00f50:	8e440000 	lw	a0,0(s2)
9fc00f54:	0ff00424 	jal	9fc01090 <putstring>
9fc00f58:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:21
9fc00f5c:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc00f60:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:56
9fc00f64:	8e440000 	lw	a0,0(s2)
9fc00f68:	24060010 	li	a2,16
9fc00f6c:	0ff00454 	jal	9fc01150 <printbase>
9fc00f70:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:57
9fc00f74:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:58
9fc00f78:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc00f7c:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:45
9fc00f80:	8e440000 	lw	a0,0(s2)
9fc00f84:	24060008 	li	a2,8
9fc00f88:	0ff00454 	jal	9fc01150 <printbase>
9fc00f8c:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:46
9fc00f90:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:47
9fc00f94:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc00f98:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:40
9fc00f9c:	8e440000 	lw	a0,0(s2)
9fc00fa0:	2406000a 	li	a2,10
9fc00fa4:	0ff00454 	jal	9fc01150 <printbase>
9fc00fa8:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:41
9fc00fac:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:42
9fc00fb0:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc00fb4:	26310002 	addiu	s1,s1,2
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:35
9fc00fb8:	8e440000 	lw	a0,0(s2)
9fc00fbc:	2406000a 	li	a2,10
9fc00fc0:	0ff00454 	jal	9fc01150 <printbase>
9fc00fc4:	24070001 	li	a3,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:36
9fc00fc8:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:37
9fc00fcc:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc00fd0:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:25
9fc00fd4:	8e440000 	lw	a0,0(s2)
9fc00fd8:	0ff00419 	jal	9fc01064 <putchar>
9fc00fdc:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:26
9fc00fe0:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc00fe4:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:50
9fc00fe8:	8e440000 	lw	a0,0(s2)
9fc00fec:	24060002 	li	a2,2
9fc00ff0:	0ff00454 	jal	9fc01150 <printbase>
9fc00ff4:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:51
9fc00ff8:	26520004 	addiu	s2,s2,4
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:52
9fc00ffc:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc01000:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:61
9fc01004:	0ff00419 	jal	9fc01064 <putchar>
9fc01008:	24040025 	li	a0,37
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:62
9fc0100c:	0bf0039d 	j	9fc00e74 <printf+0x74>
9fc01010:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:67
9fc01014:	02713021 	addu	a2,s3,s1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:68
9fc01018:	000510c0 	sll	v0,a1,0x3
9fc0101c:	00051840 	sll	v1,a1,0x1
9fc01020:	00621821 	addu	v1,v1,v0
9fc01024:	00641821 	addu	v1,v1,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:67
9fc01028:	80c40002 	lb	a0,2(a2)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:68
9fc0102c:	2465ffd0 	addiu	a1,v1,-48
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:67
9fc01030:	2482ffcf 	addiu	v0,a0,-49
9fc01034:	304200ff 	andi	v0,v0,0xff
9fc01038:	2c420009 	sltiu	v0,v0,9
9fc0103c:	26310001 	addiu	s1,s1,1
9fc01040:	1040ff9f 	beqz	v0,9fc00ec0 <printf+0xc0>
9fc01044:	24c60001 	addiu	a2,a2,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printf.c:68
9fc01048:	0bf00407 	j	9fc0101c <printf+0x21c>
9fc0104c:	000510c0 	sll	v0,a1,0x3

9fc01050 <tgt_putchar>:
tgt_putchar():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/putchar.c:9
9fc01050:	3c19bfb0 	lui	t9,0xbfb0
9fc01054:	03e00008 	jr	ra
9fc01058:	a324fff0 	sb	a0,-16(t9)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/putchar.c:18
9fc0105c:	03e00008 	jr	ra
9fc01060:	00000000 	nop

9fc01064 <putchar>:
putchar():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/putchar.c:2
9fc01064:	27bdffe8 	addiu	sp,sp,-24
9fc01068:	afbf0014 	sw	ra,20(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/putchar.c:3
9fc0106c:	0ff00414 	jal	9fc01050 <tgt_putchar>
9fc01070:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/putchar.c:5
9fc01074:	8fbf0014 	lw	ra,20(sp)
9fc01078:	00001021 	move	v0,zero
9fc0107c:	03e00008 	jr	ra
9fc01080:	27bd0018 	addiu	sp,sp,24
	...

9fc01090 <putstring>:
putstring():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:2
9fc01090:	27bdffe0 	addiu	sp,sp,-32
9fc01094:	afb10014 	sw	s1,20(sp)
9fc01098:	afbf001c 	sw	ra,28(sp)
9fc0109c:	afb20018 	sw	s2,24(sp)
9fc010a0:	afb00010 	sw	s0,16(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:4
9fc010a4:	80900000 	lb	s0,0(a0)
9fc010a8:	00000000 	nop
9fc010ac:	12000013 	beqz	s0,9fc010fc <putstring+0x6c>
9fc010b0:	00808821 	move	s1,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:6
9fc010b4:	0bf00435 	j	9fc010d4 <putstring+0x44>
9fc010b8:	2412000a 	li	s2,10
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:7
9fc010bc:	0ff00419 	jal	9fc01064 <putchar>
9fc010c0:	02002021 	move	a0,s0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:4
9fc010c4:	82300000 	lb	s0,0(s1)
9fc010c8:	00000000 	nop
9fc010cc:	1200000b 	beqz	s0,9fc010fc <putstring+0x6c>
9fc010d0:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:6
9fc010d4:	1612fff9 	bne	s0,s2,9fc010bc <putstring+0x2c>
9fc010d8:	26310001 	addiu	s1,s1,1
9fc010dc:	0ff00419 	jal	9fc01064 <putchar>
9fc010e0:	2404000d 	li	a0,13
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:7
9fc010e4:	0ff00419 	jal	9fc01064 <putchar>
9fc010e8:	02002021 	move	a0,s0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:4
9fc010ec:	82300000 	lb	s0,0(s1)
9fc010f0:	00000000 	nop
9fc010f4:	1600fff7 	bnez	s0,9fc010d4 <putstring+0x44>
9fc010f8:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:11
9fc010fc:	8fbf001c 	lw	ra,28(sp)
9fc01100:	00001021 	move	v0,zero
9fc01104:	8fb20018 	lw	s2,24(sp)
9fc01108:	8fb10014 	lw	s1,20(sp)
9fc0110c:	8fb00010 	lw	s0,16(sp)
9fc01110:	03e00008 	jr	ra
9fc01114:	27bd0020 	addiu	sp,sp,32

9fc01118 <puts>:
puts():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:15
9fc01118:	27bdffe8 	addiu	sp,sp,-24
9fc0111c:	afbf0014 	sw	ra,20(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:16
9fc01120:	0ff00424 	jal	9fc01090 <putstring>
9fc01124:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:17
9fc01128:	0ff00419 	jal	9fc01064 <putchar>
9fc0112c:	2404000d 	li	a0,13
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:18
9fc01130:	0ff00419 	jal	9fc01064 <putchar>
9fc01134:	2404000a 	li	a0,10
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/puts.c:20
9fc01138:	8fbf0014 	lw	ra,20(sp)
9fc0113c:	00001021 	move	v0,zero
9fc01140:	03e00008 	jr	ra
9fc01144:	27bd0018 	addiu	sp,sp,24
	...

9fc01150 <printbase>:
printbase():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:2
9fc01150:	27bdff98 	addiu	sp,sp,-104
9fc01154:	afb30060 	sw	s3,96(sp)
9fc01158:	afb2005c 	sw	s2,92(sp)
9fc0115c:	afbf0064 	sw	ra,100(sp)
9fc01160:	afb10058 	sw	s1,88(sp)
9fc01164:	afb00054 	sw	s0,84(sp)
9fc01168:	00801821 	move	v1,a0
9fc0116c:	00a09821 	move	s3,a1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:7
9fc01170:	10e00003 	beqz	a3,9fc01180 <printbase+0x30>
9fc01174:	00c09021 	move	s2,a2
9fc01178:	0480002f 	bltz	a0,9fc01238 <printbase+0xe8>
9fc0117c:	2404002d 	li	a0,45
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:12
9fc01180:	00608021 	move	s0,v1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:14
9fc01184:	1200000c 	beqz	s0,9fc011b8 <printbase+0x68>
9fc01188:	00008821 	move	s1,zero
9fc0118c:	27a50010 	addiu	a1,sp,16
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:16
9fc01190:	16400002 	bnez	s2,9fc0119c <printbase+0x4c>
9fc01194:	0212001b 	divu	zero,s0,s2
9fc01198:	0007000d 	break	0x7
9fc0119c:	00b12021 	addu	a0,a1,s1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:14
9fc011a0:	26310001 	addiu	s1,s1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:16
9fc011a4:	00001010 	mfhi	v0
9fc011a8:	a0820000 	sb	v0,0(a0)
9fc011ac:	00001812 	mflo	v1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:14
9fc011b0:	1460fff7 	bnez	v1,9fc01190 <printbase+0x40>
9fc011b4:	00608021 	move	s0,v1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:22
9fc011b8:	0233102a 	slt	v0,s1,s3
9fc011bc:	10400002 	beqz	v0,9fc011c8 <printbase+0x78>
9fc011c0:	02201821 	move	v1,s1
9fc011c4:	02601821 	move	v1,s3
9fc011c8:	1060000c 	beqz	v1,9fc011fc <printbase+0xac>
9fc011cc:	2470ffff 	addiu	s0,v1,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:2
9fc011d0:	27a20010 	addiu	v0,sp,16
9fc011d4:	00509021 	addu	s2,v0,s0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:24
9fc011d8:	26020001 	addiu	v0,s0,1
9fc011dc:	0222102a 	slt	v0,s1,v0
9fc011e0:	1040000e 	beqz	v0,9fc0121c <printbase+0xcc>
9fc011e4:	24040030 	li	a0,48
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:25
9fc011e8:	02009821 	move	s3,s0
9fc011ec:	0ff00419 	jal	9fc01064 <putchar>
9fc011f0:	2610ffff 	addiu	s0,s0,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:22
9fc011f4:	1660fff8 	bnez	s3,9fc011d8 <printbase+0x88>
9fc011f8:	2652ffff 	addiu	s2,s2,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:28
9fc011fc:	8fbf0064 	lw	ra,100(sp)
9fc01200:	00001021 	move	v0,zero
9fc01204:	8fb30060 	lw	s3,96(sp)
9fc01208:	8fb2005c 	lw	s2,92(sp)
9fc0120c:	8fb10058 	lw	s1,88(sp)
9fc01210:	8fb00054 	lw	s0,84(sp)
9fc01214:	03e00008 	jr	ra
9fc01218:	27bd0068 	addiu	sp,sp,104
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:24
9fc0121c:	82440000 	lb	a0,0(s2)
9fc01220:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:25
9fc01224:	2882000a 	slti	v0,a0,10
9fc01228:	14400007 	bnez	v0,9fc01248 <printbase+0xf8>
9fc0122c:	02009821 	move	s3,s0
9fc01230:	0bf0047b 	j	9fc011ec <printbase+0x9c>
9fc01234:	24840057 	addiu	a0,a0,87
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:10
9fc01238:	0ff00419 	jal	9fc01064 <putchar>
9fc0123c:	00038023 	negu	s0,v1
9fc01240:	0bf00461 	j	9fc01184 <printbase+0x34>
9fc01244:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/printbase.c:25
9fc01248:	0bf0047a 	j	9fc011e8 <printbase+0x98>
9fc0124c:	24840030 	addiu	a0,a0,48

9fc01250 <strlen>:
strlen():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:14
9fc01250:	80820000 	lb	v0,0(a0)
9fc01254:	00000000 	nop
9fc01258:	10400008 	beqz	v0,9fc0127c <strlen+0x2c>
9fc0125c:	00002821 	move	a1,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:15
9fc01260:	24a50001 	addiu	a1,a1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:14
9fc01264:	00851021 	addu	v0,a0,a1
9fc01268:	80430000 	lb	v1,0(v0)
9fc0126c:	00000000 	nop
9fc01270:	1460fffc 	bnez	v1,9fc01264 <strlen+0x14>
9fc01274:	24a50001 	addiu	a1,a1,1
9fc01278:	24a5ffff 	addiu	a1,a1,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:18
9fc0127c:	03e00008 	jr	ra
9fc01280:	00a01021 	move	v0,a1

9fc01284 <strnlen>:
strnlen():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:36
9fc01284:	10a00010 	beqz	a1,9fc012c8 <strnlen+0x44>
9fc01288:	00001821 	move	v1,zero
9fc0128c:	80820000 	lb	v0,0(a0)
9fc01290:	00000000 	nop
9fc01294:	14400009 	bnez	v0,9fc012bc <strnlen+0x38>
9fc01298:	24630001 	addiu	v1,v1,1
9fc0129c:	2463ffff 	addiu	v1,v1,-1
9fc012a0:	0bf004b2 	j	9fc012c8 <strnlen+0x44>
9fc012a4:	00000000 	nop
9fc012a8:	80c20000 	lb	v0,0(a2)
9fc012ac:	00000000 	nop
9fc012b0:	10400005 	beqz	v0,9fc012c8 <strnlen+0x44>
9fc012b4:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:37
9fc012b8:	24630001 	addiu	v1,v1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:36
9fc012bc:	0065102b 	sltu	v0,v1,a1
9fc012c0:	1440fff9 	bnez	v0,9fc012a8 <strnlen+0x24>
9fc012c4:	00833021 	addu	a2,a0,v1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:40
9fc012c8:	03e00008 	jr	ra
9fc012cc:	00601021 	move	v0,v1

9fc012d0 <strcpy>:
strcpy():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:55
9fc012d0:	00801821 	move	v1,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:60
9fc012d4:	80a20000 	lb	v0,0(a1)
9fc012d8:	24a50001 	addiu	a1,a1,1
9fc012dc:	a0620000 	sb	v0,0(v1)
9fc012e0:	1440fffc 	bnez	v0,9fc012d4 <strcpy+0x4>
9fc012e4:	24630001 	addiu	v1,v1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:64
9fc012e8:	03e00008 	jr	ra
9fc012ec:	00801021 	move	v0,a0

9fc012f0 <strncpy>:
strncpy():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:79
9fc012f0:	10c00009 	beqz	a2,9fc01318 <strncpy+0x28>
9fc012f4:	00801821 	move	v1,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:80
9fc012f8:	80a20000 	lb	v0,0(a1)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:83
9fc012fc:	24c6ffff 	addiu	a2,a2,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:80
9fc01300:	a0620000 	sb	v0,0(v1)
9fc01304:	10400002 	beqz	v0,9fc01310 <strncpy+0x20>
9fc01308:	24630001 	addiu	v1,v1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:81
9fc0130c:	24a50001 	addiu	a1,a1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:79
9fc01310:	14c0fff9 	bnez	a2,9fc012f8 <strncpy+0x8>
9fc01314:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:86
9fc01318:	03e00008 	jr	ra
9fc0131c:	00801021 	move	v0,a0

9fc01320 <strncmp>:
strncmp():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:101
9fc01320:	10c00016 	beqz	a2,9fc0137c <strncmp+0x5c>
9fc01324:	00000000 	nop
9fc01328:	80830000 	lb	v1,0(a0)
9fc0132c:	00000000 	nop
9fc01330:	14600009 	bnez	v1,9fc01358 <strncmp+0x38>
9fc01334:	00000000 	nop
9fc01338:	0bf004e1 	j	9fc01384 <strncmp+0x64>
9fc0133c:	00000000 	nop
9fc01340:	10c0000e 	beqz	a2,9fc0137c <strncmp+0x5c>
9fc01344:	24840001 	addiu	a0,a0,1
9fc01348:	80830000 	lb	v1,0(a0)
9fc0134c:	00000000 	nop
9fc01350:	1060000c 	beqz	v1,9fc01384 <strncmp+0x64>
9fc01354:	24a50001 	addiu	a1,a1,1
9fc01358:	80a20000 	lb	v0,0(a1)
9fc0135c:	00000000 	nop
9fc01360:	1062fff7 	beq	v1,v0,9fc01340 <strncmp+0x20>
9fc01364:	24c6ffff 	addiu	a2,a2,-1
9fc01368:	24c60001 	addiu	a2,a2,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:104
9fc0136c:	306300ff 	andi	v1,v1,0xff
9fc01370:	304200ff 	andi	v0,v0,0xff
9fc01374:	03e00008 	jr	ra
9fc01378:	00621023 	subu	v0,v1,v0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:105
9fc0137c:	03e00008 	jr	ra
9fc01380:	00001021 	move	v0,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:101
9fc01384:	80a20000 	lb	v0,0(a1)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:104
9fc01388:	306300ff 	andi	v1,v1,0xff
9fc0138c:	304200ff 	andi	v0,v0,0xff
9fc01390:	03e00008 	jr	ra
9fc01394:	00621023 	subu	v0,v1,v0

9fc01398 <strchr>:
strchr():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:117
9fc01398:	80830000 	lb	v1,0(a0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:116
9fc0139c:	00052e00 	sll	a1,a1,0x18
9fc013a0:	00801021 	move	v0,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:117
9fc013a4:	1060000c 	beqz	v1,9fc013d8 <strchr+0x40>
9fc013a8:	00052e03 	sra	a1,a1,0x18
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:118
9fc013ac:	14650006 	bne	v1,a1,9fc013c8 <strchr+0x30>
9fc013b0:	24420001 	addiu	v0,v0,1
9fc013b4:	03e00008 	jr	ra
9fc013b8:	2442ffff 	addiu	v0,v0,-1
9fc013bc:	10650008 	beq	v1,a1,9fc013e0 <strchr+0x48>
9fc013c0:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:121
9fc013c4:	24420001 	addiu	v0,v0,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:117
9fc013c8:	80430000 	lb	v1,0(v0)
9fc013cc:	00000000 	nop
9fc013d0:	1460fffa 	bnez	v1,9fc013bc <strchr+0x24>
9fc013d4:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:124
9fc013d8:	03e00008 	jr	ra
9fc013dc:	00001021 	move	v0,zero
9fc013e0:	03e00008 	jr	ra
9fc013e4:	00000000 	nop

9fc013e8 <strfind>:
strfind():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:137
9fc013e8:	80830000 	lb	v1,0(a0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:136
9fc013ec:	00052e00 	sll	a1,a1,0x18
9fc013f0:	00801021 	move	v0,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:137
9fc013f4:	1060000c 	beqz	v1,9fc01428 <strfind+0x40>
9fc013f8:	00052e03 	sra	a1,a1,0x18
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:138
9fc013fc:	14650006 	bne	v1,a1,9fc01418 <strfind+0x30>
9fc01400:	24420001 	addiu	v0,v0,1
9fc01404:	03e00008 	jr	ra
9fc01408:	2442ffff 	addiu	v0,v0,-1
9fc0140c:	10650008 	beq	v1,a1,9fc01430 <strfind+0x48>
9fc01410:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:141
9fc01414:	24420001 	addiu	v0,v0,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:137
9fc01418:	80430000 	lb	v1,0(v0)
9fc0141c:	00000000 	nop
9fc01420:	1460fffa 	bnez	v1,9fc0140c <strfind+0x24>
9fc01424:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:144
9fc01428:	03e00008 	jr	ra
9fc0142c:	00000000 	nop
9fc01430:	03e00008 	jr	ra
9fc01434:	00000000 	nop

9fc01438 <memset>:
memset():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:246
9fc01438:	00052e00 	sll	a1,a1,0x18
9fc0143c:	00801021 	move	v0,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:251
9fc01440:	10c00006 	beqz	a2,9fc0145c <memset+0x24>
9fc01444:	00052e03 	sra	a1,a1,0x18
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:250
9fc01448:	00801821 	move	v1,a0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:252
9fc0144c:	24c6ffff 	addiu	a2,a2,-1
9fc01450:	a0650000 	sb	a1,0(v1)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:251
9fc01454:	14c0fffd 	bnez	a2,9fc0144c <memset+0x14>
9fc01458:	24630001 	addiu	v1,v1,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:256
9fc0145c:	03e00008 	jr	ra
9fc01460:	00000000 	nop

9fc01464 <memcpy>:
memcpy():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:279
9fc01464:	10c00008 	beqz	a2,9fc01488 <memcpy+0x24>
9fc01468:	00804021 	move	t0,a0
9fc0146c:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:280
9fc01470:	00a71021 	addu	v0,a1,a3
9fc01474:	90440000 	lbu	a0,0(v0)
9fc01478:	01071821 	addu	v1,t0,a3
9fc0147c:	24e70001 	addiu	a3,a3,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:279
9fc01480:	14e6fffb 	bne	a3,a2,9fc01470 <memcpy+0xc>
9fc01484:	a0640000 	sb	a0,0(v1)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:284
9fc01488:	03e00008 	jr	ra
9fc0148c:	01001021 	move	v0,t0

9fc01490 <memmove>:
memmove():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:302
9fc01490:	00a4102b 	sltu	v0,a1,a0
9fc01494:	10400005 	beqz	v0,9fc014ac <memmove+0x1c>
9fc01498:	00804021 	move	t0,a0
9fc0149c:	00a62021 	addu	a0,a1,a2
9fc014a0:	0104102b 	sltu	v0,t0,a0
9fc014a4:	1440000b 	bnez	v0,9fc014d4 <memmove+0x44>
9fc014a8:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:308
9fc014ac:	10c00007 	beqz	a2,9fc014cc <memmove+0x3c>
9fc014b0:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:309
9fc014b4:	00a71021 	addu	v0,a1,a3
9fc014b8:	90440000 	lbu	a0,0(v0)
9fc014bc:	01071821 	addu	v1,t0,a3
9fc014c0:	24e70001 	addiu	a3,a3,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:308
9fc014c4:	14c7fffb 	bne	a2,a3,9fc014b4 <memmove+0x24>
9fc014c8:	a0640000 	sb	a0,0(v1)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:314
9fc014cc:	03e00008 	jr	ra
9fc014d0:	01001021 	move	v0,t0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:304
9fc014d4:	10c0fffd 	beqz	a2,9fc014cc <memmove+0x3c>
9fc014d8:	01061821 	addu	v1,t0,a2
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:305
9fc014dc:	2484ffff 	addiu	a0,a0,-1
9fc014e0:	90820000 	lbu	v0,0(a0)
9fc014e4:	2463ffff 	addiu	v1,v1,-1
9fc014e8:	24c6ffff 	addiu	a2,a2,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:304
9fc014ec:	14c0fffb 	bnez	a2,9fc014dc <memmove+0x4c>
9fc014f0:	a0620000 	sb	v0,0(v1)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:314
9fc014f4:	03e00008 	jr	ra
9fc014f8:	01001021 	move	v0,t0

9fc014fc <memcmp>:
memcmp():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:334
9fc014fc:	10c00011 	beqz	a2,9fc01544 <memcmp+0x48>
9fc01500:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:335
9fc01504:	80830000 	lb	v1,0(a0)
9fc01508:	80a20000 	lb	v0,0(a1)
9fc0150c:	00000000 	nop
9fc01510:	1462000e 	bne	v1,v0,9fc0154c <memcmp+0x50>
9fc01514:	24c6ffff 	addiu	a2,a2,-1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:334
9fc01518:	0bf0054d 	j	9fc01534 <memcmp+0x38>
9fc0151c:	00003821 	move	a3,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:335
9fc01520:	80630001 	lb	v1,1(v1)
9fc01524:	80420001 	lb	v0,1(v0)
9fc01528:	00000000 	nop
9fc0152c:	14620007 	bne	v1,v0,9fc0154c <memcmp+0x50>
9fc01530:	24c6ffff 	addiu	a2,a2,-1
9fc01534:	00871821 	addu	v1,a0,a3
9fc01538:	00a71021 	addu	v0,a1,a3
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:334
9fc0153c:	14c0fff8 	bnez	a2,9fc01520 <memcmp+0x24>
9fc01540:	24e70001 	addiu	a3,a3,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:341
9fc01544:	03e00008 	jr	ra
9fc01548:	00001021 	move	v0,zero
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:336
9fc0154c:	306300ff 	andi	v1,v1,0xff
9fc01550:	304200ff 	andi	v0,v0,0xff
9fc01554:	03e00008 	jr	ra
9fc01558:	00621023 	subu	v0,v1,v0

9fc0155c <bzero>:
memset():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:251
9fc0155c:	10a00005 	beqz	a1,9fc01574 <bzero+0x18>
9fc01560:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:252
9fc01564:	24a5ffff 	addiu	a1,a1,-1
9fc01568:	a0800000 	sb	zero,0(a0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/string.c:251
9fc0156c:	14a0fffd 	bnez	a1,9fc01564 <bzero+0x8>
9fc01570:	24840001 	addiu	a0,a0,1
9fc01574:	03e00008 	jr	ra
9fc01578:	00000000 	nop
bzero():
9fc0157c:	00000000 	nop

9fc01580 <_get_count>:
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc01580:	3c039fc0 	lui	v1,0x9fc0
9fc01584:	8c621e38 	lw	v0,7736(v1)
9fc01588:	00000000 	nop
9fc0158c:	24420001 	addiu	v0,v0,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:17
9fc01590:	03e00008 	jr	ra
9fc01594:	ac621e38 	sw	v0,7736(v1)

9fc01598 <get_count>:
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc01598:	3c039fc0 	lui	v1,0x9fc0
9fc0159c:	8c621e38 	lw	v0,7736(v1)
9fc015a0:	00000000 	nop
9fc015a4:	24420001 	addiu	v0,v0,1
get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:22
9fc015a8:	03e00008 	jr	ra
9fc015ac:	ac621e38 	sw	v0,7736(v1)

9fc015b0 <get_count_my>:
get_count_my():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:27
9fc015b0:	3c039fc0 	lui	v1,0x9fc0
9fc015b4:	8c621e34 	lw	v0,7732(v1)
9fc015b8:	00000000 	nop
9fc015bc:	24420001 	addiu	v0,v0,1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:35
9fc015c0:	03e00008 	jr	ra
9fc015c4:	ac621e34 	sw	v0,7732(v1)

9fc015c8 <get_clock>:
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc015c8:	3c039fc0 	lui	v1,0x9fc0
9fc015cc:	8c621e38 	lw	v0,7736(v1)
9fc015d0:	00000000 	nop
9fc015d4:	24420001 	addiu	v0,v0,1
get_clock():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:54
9fc015d8:	03e00008 	jr	ra
9fc015dc:	ac621e38 	sw	v0,7736(v1)

9fc015e0 <get_ns>:
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc015e0:	3c059fc0 	lui	a1,0x9fc0
9fc015e4:	8ca31e38 	lw	v1,7736(a1)
9fc015e8:	00000000 	nop
9fc015ec:	24630001 	addiu	v1,v1,1
9fc015f0:	000320c0 	sll	a0,v1,0x3
9fc015f4:	00031040 	sll	v0,v1,0x1
9fc015f8:	aca31e38 	sw	v1,7736(a1)
get_ns():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:62
9fc015fc:	03e00008 	jr	ra
9fc01600:	00441021 	addu	v0,v0,a0

9fc01604 <get_us>:
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc01604:	3c039fc0 	lui	v1,0x9fc0
9fc01608:	8c621e38 	lw	v0,7736(v1)
9fc0160c:	24040064 	li	a0,100
9fc01610:	24420001 	addiu	v0,v0,1
get_us():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:71
9fc01614:	14800002 	bnez	a0,9fc01620 <get_us+0x1c>
9fc01618:	0044001b 	divu	zero,v0,a0
9fc0161c:	0007000d 	break	0x7
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc01620:	ac621e38 	sw	v0,7736(v1)
get_us():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:71
9fc01624:	00001012 	mflo	v0
9fc01628:	03e00008 	jr	ra
9fc0162c:	00000000 	nop

9fc01630 <clock_gettime>:
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc01630:	3c049fc0 	lui	a0,0x9fc0
9fc01634:	8c861e38 	lw	a2,7736(a0)
clock_gettime():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:43
9fc01638:	3c030001 	lui	v1,0x1
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc0163c:	24c60001 	addiu	a2,a2,1
clock_gettime():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:43
9fc01640:	346386a0 	ori	v1,v1,0x86a0
9fc01644:	14600002 	bnez	v1,9fc01650 <clock_gettime+0x20>
9fc01648:	00c3001b 	divu	zero,a2,v1
9fc0164c:	0007000d 	break	0x7
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:42
9fc01650:	240a0064 	li	t2,100
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:44
9fc01654:	3c074876 	lui	a3,0x4876
9fc01658:	34e7e800 	ori	a3,a3,0xe800
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:41
9fc0165c:	000610c0 	sll	v0,a2,0x3
9fc01660:	00064840 	sll	t1,a2,0x1
9fc01664:	01224821 	addu	t1,t1,v0
9fc01668:	240203e8 	li	v0,1000
_get_count():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:6
9fc0166c:	ac861e38 	sw	a2,7736(a0)
clock_gettime():
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:38
9fc01670:	00a04021 	move	t0,a1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:45
9fc01674:	3c049fc0 	lui	a0,0x9fc0
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:38
9fc01678:	27bdffe8 	addiu	sp,sp,-24
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:45
9fc0167c:	24841df0 	addiu	a0,a0,7664
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:38
9fc01680:	afbf0014 	sw	ra,20(sp)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:43
9fc01684:	00001812 	mflo	v1
	...
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:42
9fc01690:	15400002 	bnez	t2,9fc0169c <clock_gettime+0x6c>
9fc01694:	00ca001b 	divu	zero,a2,t2
9fc01698:	0007000d 	break	0x7
9fc0169c:	00005012 	mflo	t2
	...
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:44
9fc016a8:	14e00002 	bnez	a3,9fc016b4 <clock_gettime+0x84>
9fc016ac:	00c7001b 	divu	zero,a2,a3
9fc016b0:	0007000d 	break	0x7
9fc016b4:	00003012 	mflo	a2
9fc016b8:	aca60000 	sw	a2,0(a1)
9fc016bc:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:43
9fc016c0:	14400002 	bnez	v0,9fc016cc <clock_gettime+0x9c>
9fc016c4:	0062001b 	divu	zero,v1,v0
9fc016c8:	0007000d 	break	0x7
9fc016cc:	00005810 	mfhi	t3
9fc016d0:	ad0b000c 	sw	t3,12(t0)
9fc016d4:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:41
9fc016d8:	14400002 	bnez	v0,9fc016e4 <clock_gettime+0xb4>
9fc016dc:	0122001b 	divu	zero,t1,v0
9fc016e0:	0007000d 	break	0x7
9fc016e4:	00002810 	mfhi	a1
9fc016e8:	ad050004 	sw	a1,4(t0)
9fc016ec:	00000000 	nop
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:42
9fc016f0:	14400002 	bnez	v0,9fc016fc <clock_gettime+0xcc>
9fc016f4:	0142001b 	divu	zero,t2,v0
9fc016f8:	0007000d 	break	0x7
9fc016fc:	00001810 	mfhi	v1
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:45
9fc01700:	0ff00380 	jal	9fc00e00 <printf>
9fc01704:	ad030008 	sw	v1,8(t0)
/home/andy/DiskD/WorkSpaces_Lin/VivadoWorkspace/nscscc-perf-func-debug/lib/time.c:47
9fc01708:	8fbf0014 	lw	ra,20(sp)
9fc0170c:	00001021 	move	v0,zero
9fc01710:	03e00008 	jr	ra
9fc01714:	27bd0018 	addiu	sp,sp,24
	...

Disassembly of section .data:

9fc01720 <crc_32_tab-0x180>:
9fc01720:	33637263 	andi	v1,k1,0x7263
9fc01724:	65742032 	0x65742032
9fc01728:	62207473 	0x62207473
9fc0172c:	6e696765 	0x6e696765
9fc01730:	0000002e 	0x2e
9fc01734:	33637263 	andi	v1,k1,0x7263
9fc01738:	41502032 	0x41502032
9fc0173c:	00215353 	0x215353
9fc01740:	33637263 	andi	v1,k1,0x7263
9fc01744:	52452032 	0x52452032
9fc01748:	21454f52 	addi	a1,t2,20306
9fc0174c:	00002121 	0x2121
9fc01750:	33637263 	andi	v1,k1,0x7263
9fc01754:	54203a32 	0x54203a32
9fc01758:	6c61746f 	0x6c61746f
9fc0175c:	756f4320 	jalx	95bd0c80 <data_size+0x95bd056c>
9fc01760:	5328746e 	0x5328746e
9fc01764:	6320436f 	0x6320436f
9fc01768:	746e756f 	jalx	91b9d5bc <data_size+0x91b9cea8>
9fc0176c:	203d2029 	addi	sp,at,8233
9fc01770:	78257830 	0x78257830
9fc01774:	0000000a 	0xa
9fc01778:	33637263 	andi	v1,k1,0x7263
9fc0177c:	54203a32 	0x54203a32
9fc01780:	6c61746f 	0x6c61746f
9fc01784:	756f4320 	jalx	95bd0c80 <data_size+0x95bd056c>
9fc01788:	4328746e 	c0	0x128746e
9fc0178c:	63205550 	0x63205550
9fc01790:	746e756f 	jalx	91b9d5bc <data_size+0x91b9cea8>
9fc01794:	203d2029 	addi	sp,at,8233
9fc01798:	78257830 	0x78257830
9fc0179c:	0000000a 	0xa
9fc017a0:	ff1b0225 	0xff1b0225
9fc017a4:	ff55028f 	0xff55028f
9fc017a8:	ffd402e5 	0xffd402e5
9fc017ac:	ffc30315 	0xffc30315
9fc017b0:	0116035e 	0x116035e
9fc017b4:	01240398 	0x1240398
9fc017b8:	012a03b0 	0x12a03b0
9fc017bc:	fffe03f4 	0xfffe03f4
9fc017c0:	fffd044f 	0xfffd044f
9fc017c4:	ffc10494 	0xffc10494
9fc017c8:	ff9d04fb 	0xff9d04fb
9fc017cc:	ff690593 	0xff690593
9fc017d0:	ff3f062b 	0xff3f062b
9fc017d4:	ff0406c1 	0xff0406c1
9fc017d8:	fefa0791 	0xfefa0791
9fc017dc:	feb7088b 	0xfeb7088b
9fc017e0:	fe8d0956 	0xfe8d0956
9fc017e4:	fe480a05 	0xfe480a05
9fc017e8:	fe270adf 	0xfe270adf
9fc017ec:	fe040b9c 	0xfe040b9c
9fc017f0:	fde30c0f 	0xfde30c0f
9fc017f4:	fde40c84 	0xfde40c84
9fc017f8:	fe120cf0 	0xfe120cf0
9fc017fc:	fe260d2e 	0xfe260d2e
9fc01800:	fe980d69 	0xfe980d69
9fc01804:	febb0d9a 	0xfebb0d9a
9fc01808:	ff450d9e 	0xff450d9e
9fc0180c:	ff880d81 	0xff880d81
9fc01810:	fff60d45 	0xfff60d45
9fc01814:	016b0ce9 	0x16b0ce9
9fc01818:	01ee0c6d 	0x1ee0c6d
9fc0181c:	017a0bcb 	0x17a0bcb
9fc01820:	02180b35 	0x2180b35
9fc01824:	028a0ab7 	0x28a0ab7
9fc01828:	033e0a3c 	0x33e0a3c
9fc0182c:	039c09de 	0x39c09de
9fc01830:	0448098c 	0x448098c
9fc01834:	04b1092f 	bgezal	a1,9fc03cf4 <_heap+0x1df4>
9fc01838:	05260902 	0x5260902
9fc0183c:	058708f9 	0x58708f9
9fc01840:	05e008e4 	bltz	t7,9fc03bd4 <_heap+0x1cd4>
9fc01844:	05db0905 	0x5db0905
9fc01848:	066b096c 	0x66b096c
9fc0184c:	062009ef 	bltz	s1,9fc0400c <_heap+0x210c>
9fc01850:	06760a9a 	0x6760a9a
9fc01854:	06710b47 	bgezal	s3,9fc04574 <_heap+0x2674>
9fc01858:	06680bdb 	0x6680bdb
9fc0185c:	062e0c89 	0x62e0c89
9fc01860:	06250d32 	0x6250d32
9fc01864:	05f00da1 	bltzal	t7,9fc04eec <_heap+0x2fec>
9fc01868:	00000000 	nop
9fc0186c:	72617473 	0x72617473
9fc01870:	00000074 	0x74
9fc01874:	3a6e656c 	xori	t6,s3,0x656c
9fc01878:	0a752520 	j	99d49480 <data_size+0x99d48d6c>
9fc0187c:	00000000 	nop
9fc01880:	0a646c25 	j	9991b094 <data_size+0x9991a980>
9fc01884:	00000000 	nop
9fc01888:	000a7825 	or	t7,zero,t2
9fc0188c:	00646e65 	0x646e65
9fc01890:	6c383025 	0x6c383025
9fc01894:	25202c58 	addiu	zero,t1,11352
9fc01898:	646c3830 	0x646c3830
9fc0189c:	0000000a 	0xa

9fc018a0 <crc_32_tab>:
9fc018a0:	00000000 	nop
9fc018a4:	77073096 	jalx	9c1cc258 <data_size+0x9c1cbb44>
9fc018a8:	ee0e612c 	swc3	$14,24876(s0)
9fc018ac:	990951ba 	lwr	t1,20922(t0)
9fc018b0:	076dc419 	0x76dc419
9fc018b4:	706af48f 	0x706af48f
9fc018b8:	e963a535 	swc2	$3,-23243(t3)
9fc018bc:	9e6495a3 	0x9e6495a3
9fc018c0:	0edb8832 	jal	9b6e20c8 <data_size+0x9b6e19b4>
9fc018c4:	79dcb8a4 	0x79dcb8a4
9fc018c8:	e0d5e91e 	swc0	$21,-5858(a2)
9fc018cc:	97d2d988 	lhu	s2,-9848(s8)
9fc018d0:	09b64c2b 	j	96d930ac <data_size+0x96d92998>
9fc018d4:	7eb17cbd 	0x7eb17cbd
9fc018d8:	e7b82d07 	swc1	$f24,11527(sp)
9fc018dc:	90bf1d91 	lbu	ra,7569(a1)
9fc018e0:	1db71064 	0x1db71064
9fc018e4:	6ab020f2 	0x6ab020f2
9fc018e8:	f3b97148 	0xf3b97148
9fc018ec:	84be41de 	lh	s8,16862(a1)
9fc018f0:	1adad47d 	0x1adad47d
9fc018f4:	6ddde4eb 	0x6ddde4eb
9fc018f8:	f4d4b551 	0xf4d4b551
9fc018fc:	83d385c7 	lb	s3,-31289(s8)
9fc01900:	136c9856 	beq	k1,t4,9fbe7a5c <data_size+0x9fbe7348>
9fc01904:	646ba8c0 	0x646ba8c0
9fc01908:	fd62f97a 	0xfd62f97a
9fc0190c:	8a65c9ec 	lwl	a1,-13844(s3)
9fc01910:	14015c4f 	bne	zero,at,9fc18a50 <_stack+0x6c54>
9fc01914:	63066cd9 	0x63066cd9
9fc01918:	fa0f3d63 	0xfa0f3d63
9fc0191c:	8d080df5 	lw	t0,3573(t0)
9fc01920:	3b6e20c8 	xori	t6,k1,0x20c8
9fc01924:	4c69105e 	0x4c69105e
9fc01928:	d56041e4 	0xd56041e4
9fc0192c:	a2677172 	sb	a3,29042(s3)
9fc01930:	3c03e4d1 	lui	v1,0xe4d1
9fc01934:	4b04d447 	c2	0x104d447
9fc01938:	d20d85fd 	0xd20d85fd
9fc0193c:	a50ab56b 	sh	t2,-19093(t0)
9fc01940:	35b5a8fa 	ori	s5,t5,0xa8fa
9fc01944:	42b2986c 	c0	0xb2986c
9fc01948:	dbbbc9d6 	0xdbbbc9d6
9fc0194c:	acbcf940 	sw	gp,-1728(a1)
9fc01950:	32d86ce3 	andi	t8,s6,0x6ce3
9fc01954:	45df5c75 	0x45df5c75
9fc01958:	dcd60dcf 	0xdcd60dcf
9fc0195c:	abd13d59 	swl	s1,15705(s8)
9fc01960:	26d930ac 	addiu	t9,s6,12460
9fc01964:	51de003a 	0x51de003a
9fc01968:	c8d75180 	lwc2	$23,20864(a2)
9fc0196c:	bfd06116 	0xbfd06116
9fc01970:	21b4f4b5 	addi	s4,t5,-2891
9fc01974:	56b3c423 	0x56b3c423
9fc01978:	cfba9599 	lwc3	$26,-27239(sp)
9fc0197c:	b8bda50f 	swr	sp,-23281(a1)
9fc01980:	2802b89e 	slti	v0,zero,-18274
9fc01984:	5f058808 	0x5f058808
9fc01988:	c60cd9b2 	lwc1	$f12,-9806(s0)
9fc0198c:	b10be924 	0xb10be924
9fc01990:	2f6f7c87 	sltiu	t7,k1,31879
9fc01994:	58684c11 	0x58684c11
9fc01998:	c1611dab 	lwc0	$1,7595(t3)
9fc0199c:	b6662d3d 	0xb6662d3d
9fc019a0:	76dc4190 	jalx	9b710640 <data_size+0x9b70ff2c>
9fc019a4:	01db7106 	0x1db7106
9fc019a8:	98d220bc 	lwr	s2,8380(a2)
9fc019ac:	efd5102a 	swc3	$21,4138(s8)
9fc019b0:	71b18589 	0x71b18589
9fc019b4:	06b6b51f 	0x6b6b51f
9fc019b8:	9fbfe4a5 	0x9fbfe4a5
9fc019bc:	e8b8d433 	swc2	$24,-11213(a1)
9fc019c0:	7807c9a2 	0x7807c9a2
9fc019c4:	0f00f934 	jal	9c03e4d0 <data_size+0x9c03ddbc>
9fc019c8:	9609a88e 	lhu	t1,-22386(s0)
9fc019cc:	e10e9818 	swc0	$14,-26600(t0)
9fc019d0:	7f6a0dbb 	0x7f6a0dbb
9fc019d4:	086d3d2d 	j	91b4f4b4 <data_size+0x91b4eda0>
9fc019d8:	91646c97 	lbu	a0,27799(t3)
9fc019dc:	e6635c01 	swc1	$f3,23553(s3)
9fc019e0:	6b6b51f4 	0x6b6b51f4
9fc019e4:	1c6c6162 	0x1c6c6162
9fc019e8:	856530d8 	lh	a1,12504(t3)
9fc019ec:	f262004e 	0xf262004e
9fc019f0:	6c0695ed 	0x6c0695ed
9fc019f4:	1b01a57b 	0x1b01a57b
9fc019f8:	8208f4c1 	lb	t0,-2879(s0)
9fc019fc:	f50fc457 	0xf50fc457
9fc01a00:	65b0d9c6 	0x65b0d9c6
9fc01a04:	12b7e950 	beq	s5,s7,9fbfbf48 <data_size+0x9fbfb834>
9fc01a08:	8bbeb8ea 	lwl	s8,-18198(sp)
9fc01a0c:	fcb9887c 	0xfcb9887c
9fc01a10:	62dd1ddf 	0x62dd1ddf
9fc01a14:	15da2d49 	bne	t6,k0,9fc0cf3c <_gp+0x311c>
9fc01a18:	8cd37cf3 	lw	s3,31987(a2)
9fc01a1c:	fbd44c65 	0xfbd44c65
9fc01a20:	4db26158 	0x4db26158
9fc01a24:	3ab551ce 	xori	s5,s5,0x51ce
9fc01a28:	a3bc0074 	sb	gp,116(sp)
9fc01a2c:	d4bb30e2 	0xd4bb30e2
9fc01a30:	4adfa541 	c2	0xdfa541
9fc01a34:	3dd895d7 	0x3dd895d7
9fc01a38:	a4d1c46d 	sh	s1,-15251(a2)
9fc01a3c:	d3d6f4fb 	0xd3d6f4fb
9fc01a40:	4369e96a 	c0	0x169e96a
9fc01a44:	346ed9fc 	ori	t6,v1,0xd9fc
9fc01a48:	ad678846 	sw	a3,-30650(t3)
9fc01a4c:	da60b8d0 	0xda60b8d0
9fc01a50:	44042d73 	0x44042d73
9fc01a54:	33031de5 	andi	v1,t8,0x1de5
9fc01a58:	aa0a4c5f 	swl	t2,19551(s0)
9fc01a5c:	dd0d7cc9 	0xdd0d7cc9
9fc01a60:	5005713c 	0x5005713c
9fc01a64:	270241aa 	addiu	v0,t8,16810
9fc01a68:	be0b1010 	0xbe0b1010
9fc01a6c:	c90c2086 	lwc2	$12,8326(t0)
9fc01a70:	5768b525 	0x5768b525
9fc01a74:	206f85b3 	addi	t7,v1,-31309
9fc01a78:	b966d409 	swr	a2,-11255(t3)
9fc01a7c:	ce61e49f 	lwc3	$1,-7009(s3)
9fc01a80:	5edef90e 	0x5edef90e
9fc01a84:	29d9c998 	slti	t9,t6,-13928
9fc01a88:	b0d09822 	0xb0d09822
9fc01a8c:	c7d7a8b4 	lwc1	$f23,-22348(s8)
9fc01a90:	59b33d17 	0x59b33d17
9fc01a94:	2eb40d81 	sltiu	s4,s5,3457
9fc01a98:	b7bd5c3b 	0xb7bd5c3b
9fc01a9c:	c0ba6cad 	lwc0	$26,27821(a1)
9fc01aa0:	edb88320 	swc3	$24,-31968(t5)
9fc01aa4:	9abfb3b6 	lwr	ra,-19530(s5)
9fc01aa8:	03b6e20c 	syscall	0xedb88
9fc01aac:	74b1d29a 	jalx	92c74a68 <data_size+0x92c74354>
9fc01ab0:	ead54739 	swc2	$21,18233(s6)
9fc01ab4:	9dd277af 	0x9dd277af
9fc01ab8:	04db2615 	0x4db2615
9fc01abc:	73dc1683 	0x73dc1683
9fc01ac0:	e3630b12 	swc0	$3,2834(k1)
9fc01ac4:	94643b84 	lhu	a0,15236(v1)
9fc01ac8:	0d6d6a3e 	jal	95b5a8f8 <data_size+0x95b5a1e4>
9fc01acc:	7a6a5aa8 	0x7a6a5aa8
9fc01ad0:	e40ecf0b 	swc1	$f14,-12533(zero)
9fc01ad4:	9309ff9d 	lbu	t1,-99(t8)
9fc01ad8:	0a00ae27 	j	9802b89c <data_size+0x9802b188>
9fc01adc:	7d079eb1 	0x7d079eb1
9fc01ae0:	f00f9344 	0xf00f9344
9fc01ae4:	8708a3d2 	lh	t0,-23598(t8)
9fc01ae8:	1e01f268 	0x1e01f268
9fc01aec:	6906c2fe 	0x6906c2fe
9fc01af0:	f762575d 	0xf762575d
9fc01af4:	806567cb 	lb	a1,26571(v1)
9fc01af8:	196c3671 	0x196c3671
9fc01afc:	6e6b06e7 	0x6e6b06e7
9fc01b00:	fed41b76 	0xfed41b76
9fc01b04:	89d32be0 	lwl	s3,11232(t6)
9fc01b08:	10da7a5a 	beq	a2,k0,9fc20474 <_stack+0xe678>
9fc01b0c:	67dd4acc 	0x67dd4acc
9fc01b10:	f9b9df6f 	0xf9b9df6f
9fc01b14:	8ebeeff9 	lw	s8,-4103(s5)
9fc01b18:	17b7be43 	bne	sp,s7,9fbf1428 <data_size+0x9fbf0d14>
9fc01b1c:	60b08ed5 	0x60b08ed5
9fc01b20:	d6d6a3e8 	0xd6d6a3e8
9fc01b24:	a1d1937e 	sb	s1,-27778(t6)
9fc01b28:	38d8c2c4 	xori	t8,a2,0xc2c4
9fc01b2c:	4fdff252 	c3	0x1dff252
9fc01b30:	d1bb67f1 	0xd1bb67f1
9fc01b34:	a6bc5767 	sh	gp,22375(s5)
9fc01b38:	3fb506dd 	0x3fb506dd
9fc01b3c:	48b2364b 	0x48b2364b
9fc01b40:	d80d2bda 	0xd80d2bda
9fc01b44:	af0a1b4c 	sw	t2,6988(t8)
9fc01b48:	36034af6 	ori	v1,s0,0x4af6
9fc01b4c:	41047a60 	0x41047a60
9fc01b50:	df60efc3 	0xdf60efc3
9fc01b54:	a867df55 	swl	a3,-8363(v1)
9fc01b58:	316e8eef 	andi	t6,t3,0x8eef
9fc01b5c:	4669be79 	c1	0x69be79
9fc01b60:	cb61b38c 	lwc2	$1,-19572(k1)
9fc01b64:	bc66831a 	0xbc66831a
9fc01b68:	256fd2a0 	addiu	t7,t3,-11616
9fc01b6c:	5268e236 	0x5268e236
9fc01b70:	cc0c7795 	lwc3	$12,30613(zero)
9fc01b74:	bb0b4703 	swr	t3,18179(t8)
9fc01b78:	220216b9 	addi	v0,s0,5817
9fc01b7c:	5505262f 	0x5505262f
9fc01b80:	c5ba3bbe 	lwc1	$f26,15294(t5)
9fc01b84:	b2bd0b28 	0xb2bd0b28
9fc01b88:	2bb45a92 	slti	s4,sp,23186
9fc01b8c:	5cb36a04 	0x5cb36a04
9fc01b90:	c2d7ffa7 	lwc0	$23,-89(s6)
9fc01b94:	b5d0cf31 	0xb5d0cf31
9fc01b98:	2cd99e8b 	sltiu	t9,a2,-24949
9fc01b9c:	5bdeae1d 	0x5bdeae1d
9fc01ba0:	9b64c2b0 	lwr	a0,-15696(k1)
9fc01ba4:	ec63f226 	swc3	$3,-3546(v1)
9fc01ba8:	756aa39c 	jalx	95aa8e70 <data_size+0x95aa875c>
9fc01bac:	026d930a 	0x26d930a
9fc01bb0:	9c0906a9 	0x9c0906a9
9fc01bb4:	eb0e363f 	swc2	$14,13887(t8)
9fc01bb8:	72076785 	0x72076785
9fc01bbc:	05005713 	bltz	t0,9fc1780c <_stack+0x5a10>
9fc01bc0:	95bf4a82 	lhu	ra,19074(t5)
9fc01bc4:	e2b87a14 	swc0	$24,31252(s5)
9fc01bc8:	7bb12bae 	0x7bb12bae
9fc01bcc:	0cb61b38 	jal	92d86ce0 <data_size+0x92d865cc>
9fc01bd0:	92d28e9b 	lbu	s2,-29029(s6)
9fc01bd4:	e5d5be0d 	swc1	$f21,-16883(t6)
9fc01bd8:	7cdcefb7 	0x7cdcefb7
9fc01bdc:	0bdbdf21 	j	9f6f7c84 <data_size+0x9f6f7570>
9fc01be0:	86d3d2d4 	lh	s3,-11564(s6)
9fc01be4:	f1d4e242 	0xf1d4e242
9fc01be8:	68ddb3f8 	0x68ddb3f8
9fc01bec:	1fda836e 	0x1fda836e
9fc01bf0:	81be16cd 	lb	s8,5837(t5)
9fc01bf4:	f6b9265b 	0xf6b9265b
9fc01bf8:	6fb077e1 	0x6fb077e1
9fc01bfc:	18b74777 	0x18b74777
9fc01c00:	88085ae6 	lwl	t0,23270(zero)
9fc01c04:	ff0f6a70 	0xff0f6a70
9fc01c08:	66063bca 	0x66063bca
9fc01c0c:	11010b5c 	beq	t0,at,9fc04980 <_heap+0x2a80>
9fc01c10:	8f659eff 	lw	a1,-24833(k1)
9fc01c14:	f862ae69 	0xf862ae69
9fc01c18:	616bffd3 	0x616bffd3
9fc01c1c:	166ccf45 	bne	s3,t4,9fbf5934 <data_size+0x9fbf5220>
9fc01c20:	a00ae278 	sb	t2,-7560(zero)
9fc01c24:	d70dd2ee 	0xd70dd2ee
9fc01c28:	4e048354 	c3	0x48354
9fc01c2c:	3903b3c2 	xori	v1,t0,0xb3c2
9fc01c30:	a7672661 	sh	a3,9825(k1)
9fc01c34:	d06016f7 	0xd06016f7
9fc01c38:	4969474d 	0x4969474d
9fc01c3c:	3e6e77db 	0x3e6e77db
9fc01c40:	aed16a4a 	sw	s1,27210(s6)
9fc01c44:	d9d65adc 	0xd9d65adc
9fc01c48:	40df0b66 	0x40df0b66
9fc01c4c:	37d83bf0 	ori	t8,s8,0x3bf0
9fc01c50:	a9bcae53 	swl	gp,-20909(t5)
9fc01c54:	debb9ec5 	0xdebb9ec5
9fc01c58:	47b2cf7f 	c1	0x1b2cf7f
9fc01c5c:	30b5ffe9 	andi	s5,a1,0xffe9
9fc01c60:	bdbdf21c 	0xbdbdf21c
9fc01c64:	cabac28a 	lwc2	$26,-15734(s5)
9fc01c68:	53b39330 	0x53b39330
9fc01c6c:	24b4a3a6 	addiu	s4,a1,-23642
9fc01c70:	bad03605 	swr	s0,13829(s6)
9fc01c74:	cdd70693 	lwc3	$23,1683(t6)
9fc01c78:	54de5729 	0x54de5729
9fc01c7c:	23d967bf 	addi	t9,s8,26559
9fc01c80:	b3667a2e 	0xb3667a2e
9fc01c84:	c4614ab8 	lwc1	$f1,19128(v1)
9fc01c88:	5d681b02 	0x5d681b02
9fc01c8c:	2a6f2b94 	slti	t7,s3,11156
9fc01c90:	b40bbe37 	0xb40bbe37
9fc01c94:	c30c8ea1 	lwc0	$12,-29023(t8)
9fc01c98:	5a05df1b 	0x5a05df1b
9fc01c9c:	2d02ef8d 	sltiu	v0,t0,-4211
9fc01ca0:	9fc01004 	0x9fc01004
9fc01ca4:	9fc00ed4 	0x9fc00ed4
9fc01ca8:	9fc00ed4 	0x9fc00ed4
9fc01cac:	9fc00ed4 	0x9fc00ed4
9fc01cb0:	9fc00ed4 	0x9fc00ed4
9fc01cb4:	9fc00ed4 	0x9fc00ed4
9fc01cb8:	9fc00ed4 	0x9fc00ed4
9fc01cbc:	9fc00ed4 	0x9fc00ed4
9fc01cc0:	9fc00ed4 	0x9fc00ed4
9fc01cc4:	9fc00ed4 	0x9fc00ed4
9fc01cc8:	9fc00ed4 	0x9fc00ed4
9fc01ccc:	9fc00ef8 	0x9fc00ef8
9fc01cd0:	9fc00f08 	0x9fc00f08
9fc01cd4:	9fc00f08 	0x9fc00f08
9fc01cd8:	9fc00f08 	0x9fc00f08
9fc01cdc:	9fc00f08 	0x9fc00f08
9fc01ce0:	9fc00f08 	0x9fc00f08
9fc01ce4:	9fc00f08 	0x9fc00f08
9fc01ce8:	9fc00f08 	0x9fc00f08
9fc01cec:	9fc00f08 	0x9fc00f08
9fc01cf0:	9fc00f08 	0x9fc00f08
9fc01cf4:	9fc00ed4 	0x9fc00ed4
9fc01cf8:	9fc00ed4 	0x9fc00ed4
9fc01cfc:	9fc00ed4 	0x9fc00ed4
9fc01d00:	9fc00ed4 	0x9fc00ed4
9fc01d04:	9fc00ed4 	0x9fc00ed4
9fc01d08:	9fc00ed4 	0x9fc00ed4
9fc01d0c:	9fc00ed4 	0x9fc00ed4
9fc01d10:	9fc00ed4 	0x9fc00ed4
9fc01d14:	9fc00ed4 	0x9fc00ed4
9fc01d18:	9fc00ed4 	0x9fc00ed4
9fc01d1c:	9fc00ed4 	0x9fc00ed4
9fc01d20:	9fc00ed4 	0x9fc00ed4
9fc01d24:	9fc00ed4 	0x9fc00ed4
9fc01d28:	9fc00ed4 	0x9fc00ed4
9fc01d2c:	9fc00ed4 	0x9fc00ed4
9fc01d30:	9fc00ed4 	0x9fc00ed4
9fc01d34:	9fc00ed4 	0x9fc00ed4
9fc01d38:	9fc00ed4 	0x9fc00ed4
9fc01d3c:	9fc00ed4 	0x9fc00ed4
9fc01d40:	9fc00ed4 	0x9fc00ed4
9fc01d44:	9fc00ed4 	0x9fc00ed4
9fc01d48:	9fc00ed4 	0x9fc00ed4
9fc01d4c:	9fc00ed4 	0x9fc00ed4
9fc01d50:	9fc00ed4 	0x9fc00ed4
9fc01d54:	9fc00ed4 	0x9fc00ed4
9fc01d58:	9fc00ed4 	0x9fc00ed4
9fc01d5c:	9fc00ed4 	0x9fc00ed4
9fc01d60:	9fc00ed4 	0x9fc00ed4
9fc01d64:	9fc00ed4 	0x9fc00ed4
9fc01d68:	9fc00ed4 	0x9fc00ed4
9fc01d6c:	9fc00ed4 	0x9fc00ed4
9fc01d70:	9fc00ed4 	0x9fc00ed4
9fc01d74:	9fc00ed4 	0x9fc00ed4
9fc01d78:	9fc00ed4 	0x9fc00ed4
9fc01d7c:	9fc00ed4 	0x9fc00ed4
9fc01d80:	9fc00ed4 	0x9fc00ed4
9fc01d84:	9fc00ed4 	0x9fc00ed4
9fc01d88:	9fc00ed4 	0x9fc00ed4
9fc01d8c:	9fc00ed4 	0x9fc00ed4
9fc01d90:	9fc00ed4 	0x9fc00ed4
9fc01d94:	9fc00fe8 	0x9fc00fe8
9fc01d98:	9fc00fd4 	0x9fc00fd4
9fc01d9c:	9fc00fb8 	0x9fc00fb8
9fc01da0:	9fc00ed4 	0x9fc00ed4
9fc01da4:	9fc00ed4 	0x9fc00ed4
9fc01da8:	9fc00ed4 	0x9fc00ed4
9fc01dac:	9fc00ed4 	0x9fc00ed4
9fc01db0:	9fc00ed4 	0x9fc00ed4
9fc01db4:	9fc00ed4 	0x9fc00ed4
9fc01db8:	9fc00ed4 	0x9fc00ed4
9fc01dbc:	9fc00f9c 	0x9fc00f9c
9fc01dc0:	9fc00ed4 	0x9fc00ed4
9fc01dc4:	9fc00ed4 	0x9fc00ed4
9fc01dc8:	9fc00f80 	0x9fc00f80
9fc01dcc:	9fc00f64 	0x9fc00f64
9fc01dd0:	9fc00ed4 	0x9fc00ed4
9fc01dd4:	9fc00ed4 	0x9fc00ed4
9fc01dd8:	9fc00f50 	0x9fc00f50
9fc01ddc:	9fc00ed4 	0x9fc00ed4
9fc01de0:	9fc00f34 	0x9fc00f34
9fc01de4:	9fc00ed4 	0x9fc00ed4
9fc01de8:	9fc00ed4 	0x9fc00ed4
9fc01dec:	9fc00f64 	0x9fc00f64
9fc01df0:	636f6c63 	0x636f6c63
9fc01df4:	736e206b 	0x736e206b
9fc01df8:	2c64253d 	sltiu	a0,v1,9533
9fc01dfc:	3d636573 	0x3d636573
9fc01e00:	000a6425 	0xa6425
9fc01e04:	ba007f00 	swr	zero,32512(s0)
	...

9fc01e1c <_fdata>:
_fdata():
9fc01e1c:	00000000 	nop

9fc01e20 <__CTOR_LIST__>:
	...

9fc01e28 <__CTOR_END__>:
	...

9fc01e30 <__DTOR_END__>:
__DTOR_END__():
9fc01e30:	9fc017a0 	0x9fc017a0

Disassembly of section .sbss:

9fc01e34 <n.817>:
9fc01e34:	00000000 	nop

9fc01e38 <_contval.807>:
9fc01e38:	00000000 	nop

Disassembly of section .bss:

9fc01e40 <files>:
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	0x1c
   4:	00000002 	srl	zero,zero,0x0
   8:	00040000 	sll	zero,a0,0x0
   c:	00000000 	nop
  10:	9fc00b90 	0x9fc00b90
  14:	00000270 	0x270
	...
  20:	0000001c 	0x1c
  24:	027c0002 	0x27c0002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	9fc00e00 	0x9fc00e00
  34:	00000250 	0x250
	...
  40:	0000001c 	0x1c
  44:	03490002 	0x3490002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	9fc01050 	0x9fc01050
  54:	00000034 	0x34
	...
  60:	0000001c 	0x1c
  64:	03d50002 	0x3d50002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	9fc01090 	0x9fc01090
  74:	000000b8 	0xb8
	...
  80:	0000001c 	0x1c
  84:	04840002 	0x4840002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	9fc01150 	0x9fc01150
  94:	00000100 	sll	zero,zero,0x4
	...
  a0:	0000001c 	0x1c
  a4:	057f0002 	0x57f0002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	9fc01250 	0x9fc01250
  b4:	0000032c 	0x32c
	...
  c0:	0000001c 	0x1c
  c4:	09a30002 	j	68c0008 <data_size+0x68bf8f4>
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	9fc01580 	0x9fc01580
  d4:	00000198 	0x198
	...

Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	0000004a 	0x4a
   4:	00000002 	srl	zero,zero,0x0
   8:	027c0000 	0x27c0000
   c:	00810000 	0x810000
  10:	6f660000 	0x6f660000
  14:	006e6570 	0x6e6570
  18:	000000c6 	0xc6
  1c:	6f6c6366 	0x6f6c6366
  20:	f8006573 	0xf8006573
  24:	67000000 	0x67000000
  28:	00637465 	0x637465
  2c:	00000143 	sra	zero,zero,0x5
  30:	74656766 	jalx	1959d98 <data_size+0x1959684>
  34:	01c40073 	0x1c40073
  38:	72660000 	0x72660000
  3c:	00646165 	0x646165
  40:	00000269 	0x269
  44:	656c6966 	0x656c6966
  48:	00000073 	0x73
  4c:	00190000 	sll	zero,t9,0x0
  50:	00020000 	sll	zero,v0,0x0
  54:	0000027c 	0x27c
  58:	000000cd 	break	0x0,0x3
  5c:	00000035 	0x35
  60:	6e697270 	0x6e697270
  64:	00006674 	0x6674
  68:	2a000000 	slti	zero,s0,0
  6c:	02000000 	0x2000000
  70:	00034900 	sll	t1,v1,0x4
  74:	00008c00 	sll	s1,zero,0x10
  78:	00003300 	sll	a2,zero,0xc
  7c:	74677400 	jalx	19dd000 <data_size+0x19dc8ec>
  80:	7475705f 	jalx	1d5c17c <data_size+0x1d5ba68>
  84:	72616863 	0x72616863
  88:	00006000 	sll	t4,zero,0x0
  8c:	74757000 	jalx	1d5c000 <data_size+0x1d5b8ec>
  90:	72616863 	0x72616863
  94:	00000000 	nop
  98:	00002500 	sll	a0,zero,0x14
  9c:	d5000200 	0xd5000200
  a0:	af000003 	sw	zero,3(t8)
  a4:	33000000 	andi	zero,t8,0x0
  a8:	70000000 	0x70000000
  ac:	74737475 	jalx	1cdd1d4 <data_size+0x1cdcac0>
  b0:	676e6972 	0x676e6972
  b4:	00008300 	sll	s0,zero,0xc
  b8:	74757000 	jalx	1d5c000 <data_size+0x1d5b8ec>
  bc:	00000073 	0x73
  c0:	001c0000 	sll	zero,gp,0x0
  c4:	00020000 	sll	zero,v0,0x0
  c8:	00000484 	0x484
  cc:	000000fb 	0xfb
  d0:	00000033 	0x33
  d4:	6e697270 	0x6e697270
  d8:	73616274 	0x73616274
  dc:	00000065 	0x65
  e0:	00960000 	0x960000
  e4:	00020000 	sll	zero,v0,0x0
  e8:	0000057f 	0x57f
  ec:	00000424 	0x424
  f0:	00000084 	0x84
  f4:	6c727473 	0x6c727473
  f8:	c9006e65 	lwc2	$0,28261(t0)
  fc:	73000000 	0x73000000
 100:	6c6e7274 	0x6c6e7274
 104:	10006e65 	b	1ba9c <data_size+0x1b388>
 108:	73000001 	0x73000001
 10c:	70637274 	0x70637274
 110:	01550079 	0x1550079
 114:	74730000 	jalx	1cc0000 <data_size+0x1cbf8ec>
 118:	70636e72 	0x70636e72
 11c:	01a70079 	0x1a70079
 120:	74730000 	jalx	1cc0000 <data_size+0x1cbf8ec>
 124:	6d636e72 	0x6d636e72
 128:	01f10070 	0x1f10070
 12c:	74730000 	jalx	1cc0000 <data_size+0x1cbf8ec>
 130:	72686372 	0x72686372
 134:	00022900 	sll	a1,v0,0x4
 138:	72747300 	0x72747300
 13c:	646e6966 	0x646e6966
 140:	00026100 	sll	t4,v0,0x4
 144:	6d656d00 	0x6d656d00
 148:	00746573 	0x746573
 14c:	00000297 	0x297
 150:	636d656d 	0x636d656d
 154:	fd007970 	0xfd007970
 158:	6d000002 	0x6d000002
 15c:	6f6d6d65 	0x6f6d6d65
 160:	62006576 	0x62006576
 164:	6d000003 	0x6d000003
 168:	6d636d65 	0x6d636d65
 16c:	03bf0070 	0x3bf0070
 170:	7a620000 	0x7a620000
 174:	006f7265 	0x6f7265
 178:	00000000 	nop
 17c:	00000072 	0x72
 180:	09a30002 	j	68c0008 <data_size+0x68bf8f4>
 184:	02100000 	0x2100000
 188:	00a30000 	0xa30000
 18c:	675f0000 	0x675f0000
 190:	635f7465 	0x635f7465
 194:	746e756f 	jalx	1b9d5bc <data_size+0x1b9cea8>
 198:	0000b600 	sll	s6,zero,0x18
 19c:	74656700 	jalx	1959c00 <data_size+0x19594ec>
 1a0:	756f635f 	jalx	5bd8d7c <data_size+0x5bd8668>
 1a4:	e400746e 	swc1	$f0,29806(zero)
 1a8:	67000000 	0x67000000
 1ac:	635f7465 	0x635f7465
 1b0:	746e756f 	jalx	1b9d5bc <data_size+0x1b9cea8>
 1b4:	00796d5f 	0x796d5f
 1b8:	00000112 	0x112
 1bc:	5f746567 	0x5f746567
 1c0:	636f6c63 	0x636f6c63
 1c4:	0149006b 	0x149006b
 1c8:	65670000 	0x65670000
 1cc:	736e5f74 	0x736e5f74
 1d0:	00018100 	sll	s0,at,0x4
 1d4:	74656700 	jalx	1959c00 <data_size+0x19594ec>
 1d8:	0073755f 	0x73755f
 1dc:	000001b5 	0x1b5
 1e0:	636f6c63 	0x636f6c63
 1e4:	65675f6b 	0x65675f6b
 1e8:	6d697474 	0x6d697474
 1ec:	00000065 	0x65
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	9fc003c0 	0x9fc003c0
   4:	c0ff0000 	lwc0	$31,0(a3)
   8:	fffffffc 	0xfffffffc
	...
  14:	00000040 	sll	zero,zero,0x1
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	9fc005e0 	0x9fc005e0
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	9fc00610 	0x9fc00610
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	9fc00790 	0x9fc00790
  64:	80ff0000 	lb	ra,0(a3)
  68:	fffffffc 	0xfffffffc
	...
  74:	00000038 	0x38
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	9fc009a0 	0x9fc009a0
  84:	80ff0000 	lb	ra,0(a3)
  88:	fffffffc 	0xfffffffc
	...
  94:	00000038 	0x38
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	9fc00b90 	0x9fc00b90
	...
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	9fc00bd4 	0x9fc00bd4
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	9fc00c04 	0x9fc00c04
  e4:	80030000 	lb	v1,0(zero)
  e8:	fffffffc 	0xfffffffc
	...
  f4:	00000020 	add	zero,zero,zero
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f
 100:	9fc00c6c 	0x9fc00c6c
 104:	80070000 	lb	a3,0(zero)
 108:	fffffffc 	0xfffffffc
	...
 114:	00000020 	add	zero,zero,zero
 118:	0000001d 	0x1d
 11c:	0000001f 	0x1f
 120:	9fc00d34 	0x9fc00d34
 124:	801f0000 	lb	ra,0(zero)
 128:	fffffffc 	0xfffffffc
	...
 134:	00000028 	0x28
 138:	0000001d 	0x1d
 13c:	0000001f 	0x1f
 140:	9fc00e00 	0x9fc00e00
 144:	807f0000 	lb	ra,0(v1)
 148:	fffffffc 	0xfffffffc
	...
 154:	00000038 	0x38
 158:	0000001d 	0x1d
 15c:	0000001f 	0x1f
 160:	9fc01050 	0x9fc01050
	...
 178:	0000001d 	0x1d
 17c:	0000001f 	0x1f
 180:	9fc01064 	0x9fc01064
 184:	80000000 	lb	zero,0(zero)
 188:	fffffffc 	0xfffffffc
	...
 194:	00000018 	mult	zero,zero
 198:	0000001d 	0x1d
 19c:	0000001f 	0x1f
 1a0:	9fc01090 	0x9fc01090
 1a4:	80070000 	lb	a3,0(zero)
 1a8:	fffffffc 	0xfffffffc
	...
 1b4:	00000020 	add	zero,zero,zero
 1b8:	0000001d 	0x1d
 1bc:	0000001f 	0x1f
 1c0:	9fc01118 	0x9fc01118
 1c4:	80000000 	lb	zero,0(zero)
 1c8:	fffffffc 	0xfffffffc
	...
 1d4:	00000018 	mult	zero,zero
 1d8:	0000001d 	0x1d
 1dc:	0000001f 	0x1f
 1e0:	9fc01150 	0x9fc01150
 1e4:	800f0000 	lb	t7,0(zero)
 1e8:	fffffffc 	0xfffffffc
	...
 1f4:	00000068 	0x68
 1f8:	0000001d 	0x1d
 1fc:	0000001f 	0x1f
 200:	9fc01250 	0x9fc01250
	...
 218:	0000001d 	0x1d
 21c:	0000001f 	0x1f
 220:	9fc01284 	0x9fc01284
	...
 238:	0000001d 	0x1d
 23c:	0000001f 	0x1f
 240:	9fc012d0 	0x9fc012d0
	...
 258:	0000001d 	0x1d
 25c:	0000001f 	0x1f
 260:	9fc012f0 	0x9fc012f0
	...
 278:	0000001d 	0x1d
 27c:	0000001f 	0x1f
 280:	9fc01320 	0x9fc01320
	...
 298:	0000001d 	0x1d
 29c:	0000001f 	0x1f
 2a0:	9fc01398 	0x9fc01398
	...
 2b8:	0000001d 	0x1d
 2bc:	0000001f 	0x1f
 2c0:	9fc013e8 	0x9fc013e8
	...
 2d8:	0000001d 	0x1d
 2dc:	0000001f 	0x1f
 2e0:	9fc01438 	0x9fc01438
	...
 2f8:	0000001d 	0x1d
 2fc:	0000001f 	0x1f
 300:	9fc01464 	0x9fc01464
	...
 318:	0000001d 	0x1d
 31c:	0000001f 	0x1f
 320:	9fc01490 	0x9fc01490
	...
 338:	0000001d 	0x1d
 33c:	0000001f 	0x1f
 340:	9fc014fc 	0x9fc014fc
	...
 358:	0000001d 	0x1d
 35c:	0000001f 	0x1f
 360:	9fc0155c 	0x9fc0155c
	...
 378:	0000001d 	0x1d
 37c:	0000001f 	0x1f
 380:	9fc01580 	0x9fc01580
	...
 398:	0000001d 	0x1d
 39c:	0000001f 	0x1f
 3a0:	9fc01598 	0x9fc01598
	...
 3b8:	0000001d 	0x1d
 3bc:	0000001f 	0x1f
 3c0:	9fc015b0 	0x9fc015b0
	...
 3d8:	0000001d 	0x1d
 3dc:	0000001f 	0x1f
 3e0:	9fc015c8 	0x9fc015c8
	...
 3f8:	0000001d 	0x1d
 3fc:	0000001f 	0x1f
 400:	9fc015e0 	0x9fc015e0
	...
 418:	0000001d 	0x1d
 41c:	0000001f 	0x1f
 420:	9fc01604 	0x9fc01604
	...
 438:	0000001d 	0x1d
 43c:	0000001f 	0x1f
 440:	9fc01630 	0x9fc01630
 444:	80000000 	lb	zero,0(zero)
 448:	fffffffc 	0xfffffffc
	...
 454:	00000018 	mult	zero,zero
 458:	0000001d 	0x1d
 45c:	0000001f 	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	43434700 	c0	0x1434700
   4:	4728203a 	c1	0x128203a
   8:	2029554e 	addi	t1,at,21838
   c:	2e332e34 	sltiu	s3,s1,11828
  10:	47000030 	c1	0x1000030
  14:	203a4343 	addi	k0,at,17219
  18:	554e4728 	0x554e4728
  1c:	2e342029 	sltiu	s4,s1,8233
  20:	00302e33 	0x302e33
  24:	43434700 	c0	0x1434700
  28:	4728203a 	c1	0x128203a
  2c:	2029554e 	addi	t1,at,21838
  30:	2e332e34 	sltiu	s3,s1,11828
  34:	47000030 	c1	0x1000030
  38:	203a4343 	addi	k0,at,17219
  3c:	554e4728 	0x554e4728
  40:	2e342029 	sltiu	s4,s1,8233
  44:	00302e33 	0x302e33
  48:	43434700 	c0	0x1434700
  4c:	4728203a 	c1	0x128203a
  50:	2029554e 	addi	t1,at,21838
  54:	2e332e34 	sltiu	s3,s1,11828
  58:	47000030 	c1	0x1000030
  5c:	203a4343 	addi	k0,at,17219
  60:	554e4728 	0x554e4728
  64:	2e342029 	sltiu	s4,s1,8233
  68:	00302e33 	0x302e33
  6c:	43434700 	c0	0x1434700
  70:	4728203a 	c1	0x128203a
  74:	2029554e 	addi	t1,at,21838
  78:	2e332e34 	sltiu	s3,s1,11828
  7c:	47000030 	c1	0x1000030
  80:	203a4343 	addi	k0,at,17219
  84:	554e4728 	0x554e4728
  88:	2e342029 	sltiu	s4,s1,8233
  8c:	00302e33 	0x302e33
  90:	43434700 	c0	0x1434700
  94:	4728203a 	c1	0x128203a
  98:	2029554e 	addi	t1,at,21838
  9c:	2e332e34 	sltiu	s3,s1,11828
  a0:	Address 0x00000000000000a0 is out of bounds.


Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <data_size+0x5b994ec>
   8:	00070100 	sll	zero,a3,0x4
   c:	03040000 	0x3040000

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	addiu	at,t0,4353
   4:	030b130e 	0x30b130e
   8:	110e1b0e 	beq	t0,t6,6c44 <data_size+0x6530>
   c:	10011201 	beq	zero,at,4814 <data_size+0x4100>
  10:	02000006 	srlv	zero,zero,s0
  14:	0b0b000f 	j	c2c003c <data_size+0xc2bf928>
  18:	24030000 	li	v1,0
  1c:	3e0b0b00 	0x3e0b0b00
  20:	000e030b 	0xe030b
  24:	00160400 	sll	zero,s6,0x10
  28:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
  2c:	13490b3b 	beq	k0,t1,2d1c <data_size+0x2608>
  30:	13050000 	beq	t8,a1,34 <data_size-0x6e0>
  34:	0b0e0301 	j	c380c04 <data_size+0xc3804f0>
  38:	3b0b3a0b 	xori	t3,t8,0x3a0b
  3c:	0013010b 	0x13010b
  40:	000d0600 	sll	zero,t5,0x18
  44:	0b3a0803 	j	ce8200c <data_size+0xce818f8>
  48:	13490b3b 	beq	k0,t1,2d38 <data_size+0x2624>
  4c:	00000a38 	0xa38
  50:	0b000f07 	j	c003c1c <data_size+0xc003508>
  54:	0013490b 	0x13490b
  58:	012e0800 	0x12e0800
  5c:	0e030c3f 	jal	80c30fc <data_size+0x80c29e8>
  60:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
  64:	13490c27 	beq	k0,t1,3104 <data_size+0x29f0>
  68:	01120111 	0x1120111
  6c:	40064081 	0x40064081
  70:	0013010a 	0x13010a
  74:	00050900 	sll	at,a1,0x4
  78:	0b3a0803 	j	ce8200c <data_size+0xce818f8>
  7c:	13490b3b 	beq	k0,t1,2d6c <data_size+0x2658>
  80:	00000a02 	srl	at,zero,0x8
  84:	0300340a 	0x300340a
  88:	3b0b3a08 	xori	t3,t8,0x3a08
  8c:	0213490b 	0x213490b
  90:	0b00000a 	j	c000028 <data_size+0xbfff914>
  94:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
  98:	08030b3e 	j	c2cf8 <data_size+0xc25e4>
  9c:	2e0c0000 	sltiu	t4,s0,0
  a0:	030c3f01 	0x30c3f01
  a4:	3b0b3a0e 	xori	t3,t8,0x3a0e
  a8:	110c270b 	beq	t0,t4,9cd8 <data_size+0x95c4>
  ac:	81011201 	lb	at,4609(t0)
  b0:	0a400640 	j	9001900 <data_size+0x90011ec>
  b4:	00001301 	0x1301
  b8:	0300050d 	break	0x300,0x14
  bc:	3b0b3a0e 	xori	t3,t8,0x3a0e
  c0:	0213490b 	0x213490b
  c4:	0e00000a 	jal	8000028 <data_size+0x7fff914>
  c8:	08030034 	j	c00d0 <data_size+0xbf9bc>
  cc:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
  d0:	00001349 	0x1349
  d4:	3f012e0f 	0x3f012e0f
  d8:	3a0e030c 	xori	t6,s0,0x30c
  dc:	270b3b0b 	addiu	t3,t8,15115
  e0:	1113490c 	beq	t0,s3,12514 <data_size+0x11e00>
  e4:	81011201 	lb	at,4609(t0)
  e8:	06400640 	bltz	s2,19ec <data_size+0x12d8>
  ec:	00001301 	0x1301
  f0:	03000510 	0x3000510
  f4:	3b0b3a0e 	xori	t3,t8,0x3a0e
  f8:	0213490b 	0x213490b
  fc:	11000006 	beqz	t0,118 <data_size-0x5fc>
 100:	08030034 	j	c00d0 <data_size+0xbf9bc>
 104:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 108:	06021349 	0x6021349
 10c:	34120000 	li	s2,0x0
 110:	3a0e0300 	xori	t6,s0,0x300
 114:	490b3b0b 	0x490b3b0b
 118:	13000013 	beqz	t8,168 <data_size-0x5ac>
 11c:	08030005 	j	c0014 <data_size+0xbf900>
 120:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 124:	06021349 	0x6021349
 128:	34140000 	li	s4,0x0
 12c:	3a0e0300 	xori	t6,s0,0x300
 130:	490b3b0b 	0x490b3b0b
 134:	00060213 	0x60213
 138:	00341500 	0x341500
 13c:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
 140:	13490b3b 	beq	k0,t1,2e30 <data_size+0x271c>
 144:	00000a02 	srl	at,zero,0x8
 148:	49010116 	bc2t	5a4 <data_size-0x170>
 14c:	00130113 	0x130113
 150:	00211700 	0x211700
 154:	0b2f1349 	j	cbc4d24 <data_size+0xcbc4610>
 158:	24180000 	li	t8,0
 15c:	3e0b0b00 	0x3e0b0b00
 160:	1900000b 	blez	t0,190 <data_size-0x584>
 164:	0e030034 	jal	80c00d0 <data_size+0x80bf9bc>
 168:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 16c:	0c3f1349 	jal	fc4d24 <data_size+0xfc4610>
 170:	00000a02 	srl	at,zero,0x8
 174:	01110100 	0x1110100
 178:	0b130e25 	j	c4c3894 <data_size+0xc4c3180>
 17c:	0e1b0e03 	jal	86c380c <data_size+0x86c30f8>
 180:	01120111 	0x1120111
 184:	00000610 	0x610
 188:	0b000f02 	j	c003c08 <data_size+0xc0034f4>
 18c:	0300000b 	0x300000b
 190:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
 194:	0e030b3e 	jal	80c2cf8 <data_size+0x80c25e4>
 198:	2e040000 	sltiu	a0,s0,0
 19c:	030c3f01 	0x30c3f01
 1a0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 1a4:	490c270b 	0x490c270b
 1a8:	12011113 	beq	s0,at,45f8 <data_size+0x3ee4>
 1ac:	06408101 	bltz	s2,fffe05b4 <_stack+0x603ce7b8>
 1b0:	13010640 	beq	t8,at,1ab4 <data_size+0x13a0>
 1b4:	05050000 	0x5050000
 1b8:	3a080300 	xori	t0,s0,0x300
 1bc:	490b3b0b 	0x490b3b0b
 1c0:	00060213 	0x60213
 1c4:	00180600 	sll	zero,t8,0x18
 1c8:	34070000 	li	a3,0x0
 1cc:	3a080300 	xori	t0,s0,0x300
 1d0:	490b3b0b 	0x490b3b0b
 1d4:	00060213 	0x60213
 1d8:	00340800 	0x340800
 1dc:	0b3a0803 	j	ce8200c <data_size+0xce818f8>
 1e0:	13490b3b 	beq	k0,t1,2ed0 <data_size+0x27bc>
 1e4:	34090000 	li	t1,0x0
 1e8:	3a080300 	xori	t0,s0,0x300
 1ec:	490b3b0b 	0x490b3b0b
 1f0:	000a0213 	0xa0213
 1f4:	000a0a00 	sll	at,t2,0x8
 1f8:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
 1fc:	00000b3b 	0xb3b
 200:	0b00240b 	j	c00902c <data_size+0xc008918>
 204:	030b3e0b 	0x30b3e0b
 208:	0c000008 	jal	20 <data_size-0x6f4>
 20c:	0b0b000f 	j	c2c003c <data_size+0xc2bf928>
 210:	00001349 	0x1349
 214:	4900260d 	bc2f	9a4c <data_size+0x9338>
 218:	00000013 	mtlo	zero
 21c:	25011101 	addiu	at,t0,4353
 220:	030b130e 	0x30b130e
 224:	110e1b0e 	beq	t0,t6,6e60 <data_size+0x674c>
 228:	10011201 	beq	zero,at,4a30 <data_size+0x431c>
 22c:	02000006 	srlv	zero,zero,s0
 230:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
 234:	0e030b3e 	jal	80c2cf8 <data_size+0x80c25e4>
 238:	2e030000 	sltiu	v1,s0,0
 23c:	030c3f01 	0x30c3f01
 240:	3b0b3a0e 	xori	t3,t8,0x3a0e
 244:	1201110b 	beq	s0,at,4674 <data_size+0x3f60>
 248:	06408101 	bltz	s2,fffe0650 <_stack+0x603ce854>
 24c:	13010a40 	beq	t8,at,2b50 <data_size+0x243c>
 250:	05040000 	0x5040000
 254:	3a080300 	xori	t0,s0,0x300
 258:	490b3b0b 	0x490b3b0b
 25c:	000a0213 	0xa0213
 260:	00240500 	0x240500
 264:	0b3e0b0b 	j	cf82c2c <data_size+0xcf82518>
 268:	00000803 	sra	at,zero,0x0
 26c:	3f012e06 	0x3f012e06
 270:	3a0e030c 	xori	t6,s0,0x30c
 274:	270b3b0b 	addiu	t3,t8,15115
 278:	1113490c 	beq	t0,s3,126ac <data_size+0x11f98>
 27c:	81011201 	lb	at,4609(t0)
 280:	06400640 	bltz	s2,1b84 <data_size+0x1470>
 284:	05070000 	0x5070000
 288:	3a080300 	xori	t0,s0,0x300
 28c:	490b3b0b 	0x490b3b0b
 290:	00060213 	0x60213
 294:	11010000 	beq	t0,at,298 <data_size-0x47c>
 298:	130e2501 	beq	t8,t6,96a0 <data_size+0x8f8c>
 29c:	1b0e030b 	0x1b0e030b
 2a0:	1201110e 	beq	s0,at,46dc <data_size+0x3fc8>
 2a4:	00061001 	0x61001
 2a8:	00240200 	0x240200
 2ac:	0b3e0b0b 	j	cf82c2c <data_size+0xcf82518>
 2b0:	00000e03 	sra	at,zero,0x18
 2b4:	3f012e03 	0x3f012e03
 2b8:	3a0e030c 	xori	t6,s0,0x30c
 2bc:	270b3b0b 	addiu	t3,t8,15115
 2c0:	1113490c 	beq	t0,s3,126f4 <data_size+0x11fe0>
 2c4:	81011201 	lb	at,4609(t0)
 2c8:	06400640 	bltz	s2,1bcc <data_size+0x14b8>
 2cc:	00001301 	0x1301
 2d0:	03000504 	0x3000504
 2d4:	3b0b3a08 	xori	t3,t8,0x3a08
 2d8:	0213490b 	0x213490b
 2dc:	05000006 	bltz	t0,2f8 <data_size-0x41c>
 2e0:	08030034 	j	c00d0 <data_size+0xbf9bc>
 2e4:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 2e8:	06021349 	0x6021349
 2ec:	24060000 	li	a2,0
 2f0:	3e0b0b00 	0x3e0b0b00
 2f4:	0008030b 	0x8030b
 2f8:	000f0700 	sll	zero,t7,0x1c
 2fc:	13490b0b 	beq	k0,t1,2f2c <data_size+0x2818>
 300:	2e080000 	sltiu	t0,s0,0
 304:	030c3f01 	0x30c3f01
 308:	3b0b3a0e 	xori	t3,t8,0x3a0e
 30c:	490c270b 	0x490c270b
 310:	12011113 	beq	s0,at,4760 <data_size+0x404c>
 314:	06408101 	bltz	s2,fffe071c <_stack+0x603ce920>
 318:	00000640 	sll	zero,zero,0x19
 31c:	01110100 	0x1110100
 320:	0b130e25 	j	c4c3894 <data_size+0xc4c3180>
 324:	0e1b0e03 	jal	86c380c <data_size+0x86c30f8>
 328:	01120111 	0x1120111
 32c:	00000610 	0x610
 330:	0b002402 	j	c009008 <data_size+0xc0088f4>
 334:	030b3e0b 	0x30b3e0b
 338:	0300000e 	0x300000e
 33c:	0c3f012e 	jal	fc04b8 <data_size+0xfbfda4>
 340:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
 344:	0c270b3b 	jal	9c2cec <data_size+0x9c25d8>
 348:	01111349 	0x1111349
 34c:	40810112 	0x40810112
 350:	01064006 	srlv	t0,a2,t0
 354:	04000013 	bltz	zero,3a4 <data_size-0x370>
 358:	08030005 	j	c0014 <data_size+0xbf900>
 35c:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 360:	06021349 	0x6021349
 364:	05050000 	0x5050000
 368:	3a0e0300 	xori	t6,s0,0x300
 36c:	490b3b0b 	0x490b3b0b
 370:	00060213 	0x60213
 374:	00340600 	0x340600
 378:	0b3a0803 	j	ce8200c <data_size+0xce818f8>
 37c:	13490b3b 	beq	k0,t1,306c <data_size+0x2958>
 380:	00000602 	srl	zero,zero,0x18
 384:	03003407 	0x3003407
 388:	3b0b3a08 	xori	t3,t8,0x3a08
 38c:	0213490b 	0x213490b
 390:	0800000a 	j	28 <data_size-0x6ec>
 394:	0e030034 	jal	80c00d0 <data_size+0x80bf9bc>
 398:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 39c:	06021349 	0x6021349
 3a0:	24090000 	li	t1,0
 3a4:	3e0b0b00 	0x3e0b0b00
 3a8:	0008030b 	0x8030b
 3ac:	01010a00 	0x1010a00
 3b0:	13011349 	beq	t8,at,50d8 <data_size+0x49c4>
 3b4:	210b0000 	addi	t3,t0,0
 3b8:	2f134900 	sltiu	s3,t8,18688
 3bc:	0c00000b 	jal	2c <data_size-0x6e8>
 3c0:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
 3c4:	00000b3e 	0xb3e
 3c8:	01110100 	0x1110100
 3cc:	0b130e25 	j	c4c3894 <data_size+0xc4c3180>
 3d0:	0e1b0e03 	jal	86c380c <data_size+0x86c30f8>
 3d4:	01120111 	0x1120111
 3d8:	00000610 	0x610
 3dc:	0b000f02 	j	c003c08 <data_size+0xc0034f4>
 3e0:	0300000b 	0x300000b
 3e4:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
 3e8:	0e030b3e 	jal	80c2cf8 <data_size+0x80c25e4>
 3ec:	16040000 	bne	s0,a0,3f0 <data_size-0x324>
 3f0:	3a0e0300 	xori	t6,s0,0x300
 3f4:	490b3b0b 	0x490b3b0b
 3f8:	05000013 	bltz	t0,448 <data_size-0x2cc>
 3fc:	0c3f012e 	jal	fc04b8 <data_size+0xfbfda4>
 400:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
 404:	0c270b3b 	jal	9c2cec <data_size+0x9c25d8>
 408:	0b201349 	j	c804d24 <data_size+0xc804610>
 40c:	00001301 	0x1301
 410:	03000506 	0x3000506
 414:	3b0b3a08 	xori	t3,t8,0x3a08
 418:	0013490b 	0x13490b
 41c:	00340700 	0x340700
 420:	0b3a0803 	j	ce8200c <data_size+0xce818f8>
 424:	13490b3b 	beq	k0,t1,3114 <data_size+0x2a00>
 428:	0f080000 	jal	c200000 <data_size+0xc1ff8ec>
 42c:	490b0b00 	0x490b0b00
 430:	09000013 	j	400004c <data_size+0x3fff938>
 434:	0c3f012e 	jal	fc04b8 <data_size+0xfbfda4>
 438:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
 43c:	0c270b3b 	jal	9c2cec <data_size+0x9c25d8>
 440:	01111349 	0x1111349
 444:	40810112 	0x40810112
 448:	010a4006 	srlv	t0,t2,t0
 44c:	0a000013 	j	800004c <data_size+0x7fff938>
 450:	08030005 	j	c0014 <data_size+0xbf900>
 454:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 458:	0a021349 	j	8084d24 <data_size+0x8084610>
 45c:	340b0000 	li	t3,0x0
 460:	3a080300 	xori	t0,s0,0x300
 464:	490b3b0b 	0x490b3b0b
 468:	00060213 	0x60213
 46c:	00260c00 	0x260c00
 470:	00001349 	0x1349
 474:	0300340d 	break	0x300,0xd0
 478:	3b0b3a08 	xori	t3,t8,0x3a08
 47c:	0213490b 	0x213490b
 480:	0e00000a 	jal	8000028 <data_size+0x7fff914>
 484:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
 488:	08030b3e 	j	c2cf8 <data_size+0xc25e4>
 48c:	050f0000 	0x50f0000
 490:	3a080300 	xori	t0,s0,0x300
 494:	490b3b0b 	0x490b3b0b
 498:	00060213 	0x60213
 49c:	012e1000 	0x12e1000
 4a0:	01111331 	0x1111331
 4a4:	40810112 	0x40810112
 4a8:	010a4006 	srlv	t0,t2,t0
 4ac:	11000013 	beqz	t0,4fc <data_size-0x218>
 4b0:	13310005 	beq	t9,s1,4c8 <data_size-0x24c>
 4b4:	00000602 	srl	zero,zero,0x18
 4b8:	31000512 	andi	zero,t0,0x512
 4bc:	000a0213 	0xa0213
 4c0:	00341300 	0x341300
 4c4:	0a021331 	j	8084cc4 <data_size+0x80845b0>
 4c8:	2e140000 	sltiu	s4,s0,0
 4cc:	030c3f01 	0x30c3f01
 4d0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 4d4:	490c2705 	0x490c2705
 4d8:	12011113 	beq	s0,at,4928 <data_size+0x4214>
 4dc:	06408101 	bltz	s2,fffe08e4 <_stack+0x603ceae8>
 4e0:	13010a40 	beq	t8,at,2de4 <data_size+0x26d0>
 4e4:	05150000 	0x5150000
 4e8:	3a080300 	xori	t0,s0,0x300
 4ec:	49053b0b 	0x49053b0b
 4f0:	00060213 	0x60213
 4f4:	00051600 	sll	v0,a1,0x18
 4f8:	0b3a0803 	j	ce8200c <data_size+0xce818f8>
 4fc:	1349053b 	beq	k0,t1,19ec <data_size+0x12d8>
 500:	00000a02 	srl	at,zero,0x8
 504:	03003417 	0x3003417
 508:	3b0b3a08 	xori	t3,t8,0x3a08
 50c:	00134905 	0x134905
 510:	00261800 	0x261800
 514:	34190000 	li	t9,0x0
 518:	3a080300 	xori	t0,s0,0x300
 51c:	49053b0b 	0x49053b0b
 520:	00060213 	0x60213
 524:	00341a00 	0x341a00
 528:	0b3a0803 	j	ce8200c <data_size+0xce818f8>
 52c:	1349053b 	beq	k0,t1,1a1c <data_size+0x1308>
 530:	00000a02 	srl	at,zero,0x8
 534:	3f012e1b 	0x3f012e1b
 538:	3a0e030c 	xori	t6,s0,0x30c
 53c:	27053b0b 	addiu	a1,t8,15115
 540:	1201110c 	beq	s0,at,4974 <data_size+0x4260>
 544:	06408101 	bltz	s2,fffe094c <_stack+0x603ceb50>
 548:	00000a40 	sll	at,zero,0x9
 54c:	31011d1c 	andi	at,t0,0x1d1c
 550:	12011113 	beq	s0,at,49a0 <data_size+0x428c>
 554:	590b5801 	0x590b5801
 558:	1d000005 	bgtz	t0,570 <data_size-0x1a4>
 55c:	13310005 	beq	t9,s1,574 <data_size-0x1a0>
 560:	0b1e0000 	j	c780000 <data_size+0xc77f8ec>
 564:	12011101 	beq	s0,at,496c <data_size+0x4258>
 568:	00000001 	0x1
 56c:	25011101 	addiu	at,t0,4353
 570:	030b130e 	0x30b130e
 574:	110e1b0e 	beq	t0,t6,71b0 <data_size+0x6a9c>
 578:	10011201 	beq	zero,at,4d80 <data_size+0x466c>
 57c:	02000006 	srlv	zero,zero,s0
 580:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
 584:	0e030b3e 	jal	80c2cf8 <data_size+0x80c25e4>
 588:	16030000 	bne	s0,v1,58c <data_size-0x188>
 58c:	3a0e0300 	xori	t6,s0,0x300
 590:	490b3b0b 	0x490b3b0b
 594:	04000013 	bltz	zero,5e4 <data_size-0x130>
 598:	0b0b0024 	j	c2c0090 <data_size+0xc2bf97c>
 59c:	08030b3e 	j	c2cf8 <data_size+0xc25e4>
 5a0:	13050000 	beq	t8,a1,5a4 <data_size-0x170>
 5a4:	0b0e0301 	j	c380c04 <data_size+0xc3804f0>
 5a8:	3b0b3a0b 	xori	t3,t8,0x3a0b
 5ac:	0013010b 	0x13010b
 5b0:	000d0600 	sll	zero,t5,0x18
 5b4:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
 5b8:	13490b3b 	beq	k0,t1,32a8 <data_size+0x2b94>
 5bc:	00000a38 	0xa38
 5c0:	3f012e07 	0x3f012e07
 5c4:	3a0e030c 	xori	t6,s0,0x30c
 5c8:	490b3b0b 	0x490b3b0b
 5cc:	010b2013 	0x10b2013
 5d0:	08000013 	j	4c <data_size-0x6c8>
 5d4:	0a020034 	j	80800d0 <data_size+0x807f9bc>
 5d8:	2e090000 	sltiu	t1,s0,0
 5dc:	11133100 	beq	t0,s3,c9e0 <data_size+0xc2cc>
 5e0:	81011201 	lb	at,4609(t0)
 5e4:	0a400640 	j	9001900 <data_size+0x90011ec>
 5e8:	2e0a0000 	sltiu	t2,s0,0
 5ec:	030c3f01 	0x30c3f01
 5f0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 5f4:	1113490b 	beq	t0,s3,12a24 <data_size+0x12310>
 5f8:	81011201 	lb	at,4609(t0)
 5fc:	0a400640 	j	9001900 <data_size+0x90011ec>
 600:	00001301 	0x1301
 604:	31001d0b 	andi	zero,t0,0x1d0b
 608:	12011113 	beq	s0,at,4a58 <data_size+0x4344>
 60c:	590b5801 	0x590b5801
 610:	0c00000b 	jal	2c <data_size-0x6e8>
 614:	08030034 	j	c00d0 <data_size+0xbf9bc>
 618:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec25d4>
 61c:	0a021349 	j	8084d24 <data_size+0x8084610>
 620:	340d0000 	li	t5,0x0
 624:	3a080300 	xori	t0,s0,0x300
 628:	490b3b0b 	0x490b3b0b
 62c:	0e000013 	jal	800004c <data_size+0x7fff938>
 630:	0c3f012e 	jal	fc04b8 <data_size+0xfbfda4>
 634:	0b3a0e03 	j	ce8380c <data_size+0xce830f8>
 638:	0c270b3b 	jal	9c2cec <data_size+0x9c25d8>
 63c:	01111349 	0x1111349
 640:	40810112 	0x40810112
 644:	010a4006 	srlv	t0,t2,t0
 648:	0f000013 	jal	c00004c <data_size+0xbfff938>
 64c:	1331001d 	beq	t9,s1,6c4 <data_size-0x50>
 650:	0b580655 	j	d601954 <data_size+0xd601240>
 654:	00000b59 	0xb59
 658:	3f012e10 	0x3f012e10
 65c:	3a0e030c 	xori	t6,s0,0x30c
 660:	270b3b0b 	addiu	t3,t8,15115
 664:	1113490c 	beq	t0,s3,12a98 <data_size+0x12384>
 668:	81011201 	lb	at,4609(t0)
 66c:	06400640 	bltz	s2,1f70 <data_size+0x185c>
 670:	00001301 	0x1301
 674:	03000511 	0x3000511
 678:	3b0b3a08 	xori	t3,t8,0x3a08
 67c:	0213490b 	0x213490b
 680:	12000006 	beqz	s0,69c <data_size-0x78>
 684:	0b0b000f 	j	c2c003c <data_size+0xc2bf928>
 688:	00001349 	0x1349
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000278 	0x278
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000055 	0x55
  10:	00002b01 	0x2b01
  14:	00006400 	sll	t4,zero,0x10
  18:	c00b9000 	lwc0	$11,-28672(zero)
  1c:	c00e009f 	lwc0	$14,159(zero)
  20:	0000009f 	0x9f
  24:	03040200 	0x3040200
  28:	00120704 	0x120704
  2c:	04030000 	0x4030000
  30:	00000d07 	0xd07
  34:	00060400 	sll	zero,a2,0x10
  38:	13030000 	beq	t8,v1,3c <data_size-0x6d8>
  3c:	00000027 	nor	zero,zero,zero
  40:	00004605 	0x4605
  44:	09020800 	j	4082000 <data_size+0x40818ec>
  48:	00000069 	0x69
  4c:	72747306 	0x72747306
  50:	690a0200 	0x690a0200
  54:	02000000 	0x2000000
  58:	70060010 	0x70060010
  5c:	0200736f 	0x200736f
  60:	0000350b 	0x350b
  64:	04100200 	bltzal	zero,868 <data_size+0x154>
  68:	6f040700 	0x6f040700
  6c:	03000000 	0x3000000
  70:	00d90601 	0xd90601
  74:	46040000 	add.s	$f0,$f0,$f4
  78:	02000000 	0x2000000
  7c:	0000400e 	0x400e
  80:	25010800 	addiu	at,t0,2048
  84:	01000000 	0x1000000
  88:	00b90114 	0xb90114
  8c:	0b900000 	j	e400000 <data_size+0xe3ff8ec>
  90:	0bd49fc0 	j	f527f00 <data_size+0xf5277ec>
  94:	00109fc0 	sll	s3,s0,0x1f
  98:	6d010000 	0x6d010000
  9c:	000000b9 	0xb9
  a0:	72747309 	0x72747309
  a4:	69140100 	0x69140100
  a8:	01000000 	0x1000000
  ac:	00690a54 	0x690a54
  b0:	00bf1501 	0xbf1501
  b4:	53010000 	0x53010000
  b8:	76040700 	jalx	8101c00 <data_size+0x81014ec>
  bc:	0b000000 	j	c000000 <data_size+0xbfff8ec>
  c0:	6e690504 	0x6e690504
  c4:	010c0074 	0x10c0074
  c8:	000000b5 	0xb5
  cc:	d4013d01 	0xd4013d01
  d0:	049fc00b 	0x49fc00b
  d4:	209fc00c 	addi	ra,a0,-16372
  d8:	01000000 	0x1000000
  dc:	0000f86d 	0xf86d
  e0:	00330d00 	0x330d00
  e4:	3d010000 	0x3d010000
  e8:	000000b9 	0xb9
  ec:	690e5401 	0x690e5401
  f0:	bf3e0100 	0xbf3e0100
  f4:	00000000 	nop
  f8:	0050010f 	0x50010f
  fc:	58010000 	0x58010000
 100:	0000bf01 	0xbf01
 104:	c00c0400 	lwc0	$12,1024(zero)
 108:	c00c6c9f 	lwc0	$12,27807(zero)
 10c:	0000309f 	0x309f
 110:	00000000 	nop
 114:	00014300 	sll	t0,at,0xc
 118:	00331000 	0x331000
 11c:	58010000 	0x58010000
 120:	000000b9 	0xb9
 124:	0000001f 	0x1f
 128:	72747311 	0x72747311
 12c:	69590100 	0x69590100
 130:	48000000 	mfc2	zero,$0
 134:	12000000 	beqz	s0,138 <data_size-0x5dc>
 138:	00000040 	sll	zero,zero,0x1
 13c:	00355a01 	0x355a01
 140:	0f000000 	jal	c000000 <data_size+0xbfff8ec>
 144:	00000001 	0x1
 148:	01480100 	0x1480100
 14c:	00000069 	0x69
 150:	9fc00c6c 	0x9fc00c6c
 154:	9fc00d34 	0x9fc00d34
 158:	0000004c 	syscall	0x1
 15c:	00000066 	0x66
 160:	000001c4 	0x1c4
 164:	01007313 	0x1007313
 168:	00006948 	0x6948
 16c:	00008500 	sll	s0,zero,0x14
 170:	004b1000 	0x4b1000
 174:	48010000 	mfc2	at,$0
 178:	000000bf 	0xbf
 17c:	000000ae 	0xae
 180:	00003310 	0x3310
 184:	b9480100 	swr	t0,256(t2)
 188:	c1000000 	lwc0	$0,0(t0)
 18c:	11000000 	beqz	t0,190 <data_size-0x584>
 190:	00727473 	0x727473
 194:	00694901 	0x694901
 198:	00ea0000 	0xea0000
 19c:	40140000 	mfc0	s4,c0_index
 1a0:	01000000 	0x1000000
 1a4:	0000354a 	0x354a
 1a8:	00010800 	sll	at,at,0x0
 1ac:	00631100 	0x631100
 1b0:	00354b01 	0x354b01
 1b4:	01310000 	0x1310000
 1b8:	720e0000 	0x720e0000
 1bc:	694c0100 	0x694c0100
 1c0:	00000000 	nop
 1c4:	00af010f 	0xaf010f
 1c8:	20010000 	addi	at,zero,0
 1cc:	00003501 	0x3501
 1d0:	c00d3400 	lwc0	$13,13312(zero)
 1d4:	c00e009f 	lwc0	$14,159(zero)
 1d8:	00006c9f 	0x6c9f
 1dc:	00014f00 	sll	t1,at,0x1c
 1e0:	00025600 	sll	t2,v0,0x18
 1e4:	74701300 	jalx	1c04c00 <data_size+0x1c044ec>
 1e8:	20010072 	addi	at,zero,114
 1ec:	00000025 	move	zero,zero
 1f0:	0000016e 	0x16e
 1f4:	00004b10 	0x4b10
 1f8:	35200100 	ori	zero,t1,0x100
 1fc:	97000000 	lhu	zero,0(t8)
 200:	10000001 	b	208 <data_size-0x50c>
 204:	0000001f 	0x1f
 208:	00352001 	0x352001
 20c:	01c00000 	0x1c00000
 210:	33100000 	andi	s0,t8,0x0
 214:	01000000 	0x1000000
 218:	0000b920 	0xb920
 21c:	0001e900 	sll	sp,at,0x4
 220:	756f0e00 	jalx	5bc3800 <data_size+0x5bc30ec>
 224:	21010074 	addi	at,t0,116
 228:	00000069 	0x69
 22c:	72747311 	0x72747311
 230:	69220100 	0x69220100
 234:	12000000 	beqz	s0,238 <data_size-0x4dc>
 238:	15000002 	bnez	t0,244 <data_size-0x4d0>
 23c:	00000040 	sll	zero,zero,0x1
 240:	00352301 	0x352301
 244:	59010000 	0x59010000
 248:	01006311 	0x1006311
 24c:	00003527 	0x3527
 250:	00023000 	sll	a2,v0,0x0
 254:	76160000 	jalx	8580000 <data_size+0x857f8ec>
 258:	66000000 	0x66000000
 25c:	17000002 	bnez	t8,268 <data_size-0x4ac>
 260:	00000266 	0x266
 264:	04180009 	0x4180009
 268:	003a1907 	0x3a1907
 26c:	05010000 	bgez	t0,270 <data_size-0x4a4>
 270:	00000256 	0x256
 274:	40030501 	0x40030501
 278:	009fc01e 	0x9fc01e
 27c:	000000c9 	0xc9
 280:	01750002 	0x1750002
 284:	01040000 	0x1040000
 288:	00000055 	0x55
 28c:	0000c201 	0xc201
 290:	00006400 	sll	t4,zero,0x10
 294:	c00e0000 	lwc0	$14,0(zero)
 298:	c010509f 	lwc0	$16,20639(zero)
 29c:	0000ac9f 	0xac9f
 2a0:	03040200 	0x3040200
 2a4:	00120704 	0x120704
 2a8:	04030000 	0x4030000
 2ac:	00000d07 	0xd07
 2b0:	cb010400 	lwc2	$1,1024(t8)
 2b4:	01000000 	0x1000000
 2b8:	00ad0102 	0xad0102
 2bc:	0e000000 	jal	8000000 <data_size+0x7fff8ec>
 2c0:	10509fc0 	beq	v0,s0,fffe81c4 <_stack+0x603d63c8>
 2c4:	00a09fc0 	0xa09fc0
 2c8:	024e0000 	0x24e0000
 2cc:	00ad0000 	0xad0000
 2d0:	66050000 	0x66050000
 2d4:	0100746d 	0x100746d
 2d8:	0000b401 	0xb401
 2dc:	00026d00 	sll	t5,v0,0x14
 2e0:	69070600 	0x69070600
 2e4:	ad030100 	sw	v1,256(t0)
 2e8:	96000000 	lhu	zero,0(s0)
 2ec:	08000002 	j	8 <data_size-0x70c>
 2f0:	04010063 	b	480 <data_size-0x294>
 2f4:	000000bf 	0xbf
 2f8:	67726107 	0x67726107
 2fc:	c6050100 	lwc1	$f5,256(s0)
 300:	b4000000 	0xb4000000
 304:	09000002 	j	4000008 <data_size+0x3fff8f4>
 308:	01007061 	0x1007061
 30c:	00002506 	0x2506
 310:	108d0200 	beq	a0,t5,b14 <data_size+0x400>
 314:	01007707 	0x1007707
 318:	0000ad07 	0xad07
 31c:	0002d200 	sll	k0,v0,0x8
 320:	00bc0a00 	0xbc0a00
 324:	45010000 	bc1t	328 <data_size-0x3ec>
 328:	05040b00 	0x5040b00
 32c:	00746e69 	0x746e69
 330:	00ba040c 	syscall	0x2e810
 334:	bf0d0000 	0xbf0d0000
 338:	03000000 	0x3000000
 33c:	00d90601 	0xd90601
 340:	040c0000 	0x40c0000
 344:	00000025 	move	zero,zero
 348:	00008800 	sll	s1,zero,0x0
 34c:	1c000200 	bgtz	zero,b50 <data_size+0x43c>
 350:	04000002 	bltz	zero,35c <data_size-0x3b8>
 354:	00005501 	0x5501
 358:	00de0100 	0xde0100
 35c:	00640000 	0x640000
 360:	10500000 	beq	v0,s0,364 <data_size-0x3b0>
 364:	10849fc0 	beq	a0,a0,fffe8268 <_stack+0x603d646c>
 368:	01589fc0 	0x1589fc0
 36c:	04020000 	0x4020000
 370:	00001207 	0x1207
 374:	07040200 	0x7040200
 378:	0000000d 	break
 37c:	00d20103 	0xd20103
 380:	08010000 	j	40000 <data_size+0x3f8ec>
 384:	9fc01050 	0x9fc01050
 388:	9fc01064 	0x9fc01064
 38c:	000000d4 	0xd4
 390:	00596d01 	0x596d01
 394:	63040000 	0x63040000
 398:	59080100 	0x59080100
 39c:	01000000 	0x1000000
 3a0:	04050054 	0x4050054
 3a4:	746e6905 	jalx	1b9a414 <data_size+0x1b99d00>
 3a8:	d6010600 	0xd6010600
 3ac:	01000000 	0x1000000
 3b0:	00590102 	0x590102
 3b4:	10640000 	beq	v1,a0,3b8 <data_size-0x35c>
 3b8:	10849fc0 	beq	a0,a0,fffe82bc <_stack+0x603d64c0>
 3bc:	00e49fc0 	0xe49fc0
 3c0:	035e0000 	0x35e0000
 3c4:	63070000 	0x63070000
 3c8:	59010100 	0x59010100
 3cc:	7d000000 	0x7d000000
 3d0:	00000003 	sra	zero,zero,0x0
 3d4:	0000ab00 	sll	s5,zero,0xc
 3d8:	96000200 	lhu	zero,512(s0)
 3dc:	04000002 	bltz	zero,3e8 <data_size-0x32c>
 3e0:	00005501 	0x5501
 3e4:	00e80100 	0xe80100
 3e8:	00640000 	0x640000
 3ec:	10900000 	beq	a0,s0,3f0 <data_size-0x324>
 3f0:	11489fc0 	beq	t2,t0,fffe82f4 <_stack+0x603d64f8>
 3f4:	01989fc0 	0x1989fc0
 3f8:	04020000 	0x4020000
 3fc:	00001207 	0x1207
 400:	07040200 	0x7040200
 404:	0000000d 	break
 408:	00f40103 	0xf40103
 40c:	02010000 	0x2010000
 410:	00006f01 	0x6f01
 414:	c0109000 	lwc0	$16,-28672(zero)
 418:	c011189f 	lwc0	$17,6303(zero)
 41c:	00010c9f 	0x10c9f
 420:	00039000 	sll	s2,v1,0x0
 424:	00006f00 	sll	t5,zero,0x1c
 428:	00730400 	0x730400
 42c:	00760101 	0x760101
 430:	03af0000 	0x3af0000
 434:	63050000 	0x63050000
 438:	7c030100 	0x7c030100
 43c:	d8000000 	0xd8000000
 440:	00000003 	sra	zero,zero,0x0
 444:	69050406 	0x69050406
 448:	0700746e 	bltz	t8,1d604 <data_size+0x1cef0>
 44c:	00007c04 	0x7c04
 450:	06010200 	bgez	s0,c54 <data_size+0x540>
 454:	000000d9 	0xd9
 458:	00ef0108 	0xef0108
 45c:	0f010000 	jal	c040000 <data_size+0xc03f8ec>
 460:	00006f01 	0x6f01
 464:	c0111800 	lwc0	$17,6144(zero)
 468:	c011489f 	lwc0	$17,18591(zero)
 46c:	0001289f 	0x1289f
 470:	0003eb00 	sll	sp,v1,0xc
 474:	00730400 	0x730400
 478:	00760e01 	0x760e01
 47c:	040a0000 	0x40a0000
 480:	00000000 	nop
 484:	000000f7 	0xf7
 488:	031d0002 	0x31d0002
 48c:	01040000 	0x1040000
 490:	00000055 	0x55
 494:	0000fe01 	0xfe01
 498:	00006400 	sll	t4,zero,0x10
 49c:	c0115000 	lwc0	$17,20480(zero)
 4a0:	c012509f 	lwc0	$18,20639(zero)
 4a4:	0001db9f 	0x1db9f
 4a8:	07040200 	0x7040200
 4ac:	00000012 	mflo	zero
 4b0:	0d070402 	jal	41c1008 <data_size+0x41c08f4>
 4b4:	03000000 	0x3000000
 4b8:	00011e01 	0x11e01
 4bc:	01020100 	0x1020100
 4c0:	000000d2 	0xd2
 4c4:	9fc01150 	0x9fc01150
 4c8:	9fc01250 	0x9fc01250
 4cc:	00000150 	0x150
 4d0:	0000041d 	0x41d
 4d4:	000000d2 	0xd2
 4d8:	01007604 	0x1007604
 4dc:	0000d901 	0xd901
 4e0:	00043d00 	sll	a3,a0,0x14
 4e4:	00770400 	0x770400
 4e8:	00d20101 	0xd20101
 4ec:	049d0000 	0x49d0000
 4f0:	23050000 	addi	a1,t8,0
 4f4:	01000001 	0x1000001
 4f8:	0000d201 	0xd201
 4fc:	00050800 	sll	at,a1,0x0
 500:	01190500 	0x1190500
 504:	01010000 	0x1010000
 508:	000000d2 	0xd2
 50c:	0000055d 	0x55d
 510:	01006906 	0x1006906
 514:	0000d203 	sra	k0,zero,0x8
 518:	00058600 	sll	s0,a1,0x18
 51c:	006a0600 	0x6a0600
 520:	00d20301 	0xd20301
 524:	05af0000 	0x5af0000
 528:	63060000 	0x63060000
 52c:	d2040100 	0xd2040100
 530:	d8000000 	0xd8000000
 534:	07000005 	bltz	t8,54c <data_size-0x1c8>
 538:	00667562 	0x667562
 53c:	00e00501 	0xe00501
 540:	91030000 	lbu	v1,0(t0)
 544:	0a087fa8 	j	821fea0 <data_size+0x821f78c>
 548:	01000001 	0x1000001
 54c:	00002c06 	0x2c06
 550:	0005f600 	sll	s8,a1,0x18
 554:	04090000 	0x4090000
 558:	746e6905 	jalx	1b9a414 <data_size+0x1b99d00>
 55c:	05040200 	0x5040200
 560:	00000110 	0x110
 564:	0000f30a 	0xf30a
 568:	0000f000 	sll	s8,zero,0x0
 56c:	00f00b00 	0xf00b00
 570:	003f0000 	0x3f0000
 574:	0207040c 	syscall	0x81c10
 578:	00d90601 	0xd90601
 57c:	20000000 	addi	zero,zero,0
 580:	02000004 	sllv	zero,zero,s0
 584:	0003c900 	sll	t9,v1,0x4
 588:	55010400 	0x55010400
 58c:	01000000 	0x1000000
 590:	0000013e 	0x13e
 594:	00000064 	0x64
 598:	9fc01250 	0x9fc01250
 59c:	9fc0157c 	0x9fc0157c
 5a0:	00000232 	0x232
 5a4:	04030402 	0x4030402
 5a8:	00001207 	0x1207
 5ac:	07040300 	0x7040300
 5b0:	0000000d 	break
 5b4:	00000604 	0x604
 5b8:	27130200 	addiu	s3,t8,512
 5bc:	05000000 	bltz	t0,5c0 <data_size-0x154>
 5c0:	00018201 	0x18201
 5c4:	01f60100 	0x1f60100
 5c8:	00000025 	move	zero,zero
 5cc:	00007700 	sll	t6,zero,0x1c
 5d0:	00730600 	0x730600
 5d4:	0025f601 	0x25f601
 5d8:	63060000 	0x63060000
 5dc:	77f60100 	jalx	fd80400 <data_size+0xfd7fcec>
 5e0:	06000000 	bltz	s0,5e4 <data_size-0x130>
 5e4:	f601006e 	0xf601006e
 5e8:	00000035 	0x35
 5ec:	01007007 	srav	t6,zero,t0
 5f0:	00007efa 	0x7efa
 5f4:	01030000 	0x1030000
 5f8:	0000d906 	0xd906
 5fc:	77040800 	jalx	c102000 <data_size+0xc1018ec>
 600:	09000000 	j	4000000 <data_size+0x3fff8ec>
 604:	00016d01 	0x16d01
 608:	010c0100 	0x10c0100
 60c:	00000035 	0x35
 610:	9fc01250 	0x9fc01250
 614:	9fc01284 	0x9fc01284
 618:	00000180 	sll	zero,zero,0x6
 61c:	00be6d01 	0xbe6d01
 620:	730a0000 	0x730a0000
 624:	be0c0100 	0xbe0c0100
 628:	01000000 	0x1000000
 62c:	6e630b54 	0x6e630b54
 630:	0d010074 	jal	40401d0 <data_size+0x403fabc>
 634:	00000035 	0x35
 638:	0000061f 	0x61f
 63c:	c4040800 	lwc1	$f4,2048(zero)
 640:	0c000000 	jal	0 <data_size-0x714>
 644:	00000077 	0x77
 648:	01560109 	0x1560109
 64c:	22010000 	addi	at,s0,0
 650:	00003501 	0x3501
 654:	c0128400 	lwc0	$18,-31744(zero)
 658:	c012d09f 	lwc0	$18,-12129(zero)
 65c:	0001909f 	0x1909f
 660:	106d0100 	beq	v1,t5,a64 <data_size+0x350>
 664:	0a000001 	j	8000004 <data_size+0x7fff8f0>
 668:	22010073 	addi	at,s0,115
 66c:	000000be 	0xbe
 670:	6c0a5401 	0x6c0a5401
 674:	01006e65 	0x1006e65
 678:	00003522 	0x3522
 67c:	0b550100 	j	d540400 <data_size+0xd53fcec>
 680:	00746e63 	0x746e63
 684:	00352301 	0x352301
 688:	063d0000 	0x63d0000
 68c:	09000000 	j	4000000 <data_size+0x3fff8ec>
 690:	00012801 	0x12801
 694:	01370100 	0x1370100
 698:	0000007e 	0x7e
 69c:	9fc012d0 	0x9fc012d0
 6a0:	9fc012f0 	0x9fc012f0
 6a4:	000001a0 	0x1a0
 6a8:	01556d01 	0x1556d01
 6ac:	640a0000 	0x640a0000
 6b0:	01007473 	0x1007473
 6b4:	00007e37 	0x7e37
 6b8:	0a540100 	j	9500400 <data_size+0x94ffcec>
 6bc:	00637273 	0x637273
 6c0:	00be3701 	0xbe3701
 6c4:	55010000 	0x55010000
 6c8:	0100700d 	break	0x100,0x1c0
 6cc:	00007e3b 	0x7e3b
 6d0:	00530100 	0x530100
 6d4:	014e0109 	0x14e0109
 6d8:	4d010000 	bc3t	6dc <data_size-0x38>
 6dc:	00007e01 	0x7e01
 6e0:	c012f000 	lwc0	$18,-4096(zero)
 6e4:	c013209f 	lwc0	$19,8351(zero)
 6e8:	0001b09f 	0x1b09f
 6ec:	a76d0100 	sh	t5,256(k1)
 6f0:	0a000001 	j	8000004 <data_size+0x7fff8f0>
 6f4:	00747364 	0x747364
 6f8:	007e4d01 	0x7e4d01
 6fc:	54010000 	0x54010000
 700:	6372730a 	0x6372730a
 704:	be4d0100 	0xbe4d0100
 708:	01000000 	0x1000000
 70c:	656c0a55 	0x656c0a55
 710:	4d01006e 	bc3t	8cc <data_size+0x1b8>
 714:	00000035 	0x35
 718:	700d5601 	0x700d5601
 71c:	7e4e0100 	0x7e4e0100
 720:	01000000 	0x1000000
 724:	01090053 	0x1090053
 728:	00000165 	0x165
 72c:	ea016401 	swc2	$1,25601(s0)
 730:	20000001 	addi	zero,zero,1
 734:	989fc013 	lwr	ra,-16365(a0)
 738:	c09fc013 	lwc0	$31,-16365(a0)
 73c:	01000001 	0x1000001
 740:	0001ea6d 	0x1ea6d
 744:	31730a00 	andi	s3,t3,0xa00
 748:	be640100 	0xbe640100
 74c:	01000000 	0x1000000
 750:	32730a54 	andi	s3,s3,0xa54
 754:	be640100 	0xbe640100
 758:	01000000 	0x1000000
 75c:	006e0a55 	0x6e0a55
 760:	00356401 	0x356401
 764:	56010000 	0x56010000
 768:	05040e00 	0x5040e00
 76c:	00746e69 	0x746e69
 770:	01370109 	0x1370109
 774:	74010000 	jalx	40000 <data_size+0x3f8ec>
 778:	00007e01 	0x7e01
 77c:	c0139800 	lwc0	$19,-26624(zero)
 780:	c013e89f 	lwc0	$19,-5985(zero)
 784:	0001d09f 	0x1d09f
 788:	296d0100 	slti	t5,t3,256
 78c:	0f000002 	jal	c000008 <data_size+0xbfff8f4>
 790:	74010073 	jalx	401cc <data_size+0x3fab8>
 794:	000000be 	0xbe
 798:	0000065b 	0x65b
 79c:	0100630a 	0x100630a
 7a0:	00007774 	0x7774
 7a4:	00550100 	0x550100
 7a8:	012f0109 	0x12f0109
 7ac:	88010000 	lwl	at,0(zero)
 7b0:	00007e01 	0x7e01
 7b4:	c013e800 	lwc0	$19,-6144(zero)
 7b8:	c014389f 	lwc0	$20,14495(zero)
 7bc:	0001e09f 	0x1e09f
 7c0:	616d0100 	0x616d0100
 7c4:	0f000002 	jal	c000008 <data_size+0xbfff8f4>
 7c8:	88010073 	lwl	at,115(zero)
 7cc:	000000be 	0xbe
 7d0:	0000068f 	0x68f
 7d4:	0100630a 	0x100630a
 7d8:	00007788 	0x7788
 7dc:	00550100 	0x550100
 7e0:	00004010 	mfhi	t0
 7e4:	c0143800 	lwc0	$20,14336(zero)
 7e8:	c014649f 	lwc0	$20,25759(zero)
 7ec:	0001f09f 	0x1f09f
 7f0:	976d0100 	lhu	t5,256(k1)
 7f4:	11000002 	beqz	t0,800 <data_size+0xec>
 7f8:	00000052 	0x52
 7fc:	000006c3 	sra	zero,zero,0x1b
 800:	00005b12 	0x5b12
 804:	12550100 	beq	s2,s5,c08 <data_size+0x4f4>
 808:	00000064 	0x64
 80c:	6d135601 	0x6d135601
 810:	01000000 	0x1000000
 814:	01140053 	0x1140053
 818:	0000015e 	0x15e
 81c:	01011101 	0x1011101
 820:	00000025 	move	zero,zero
 824:	9fc01464 	0x9fc01464
 828:	9fc01490 	0x9fc01490
 82c:	00000200 	sll	zero,zero,0x8
 830:	02f66d01 	0x2f66d01
 834:	64150000 	0x64150000
 838:	01007473 	0x1007473
 83c:	00250111 	0x250111
 840:	06ec0000 	0x6ec0000
 844:	73160000 	0x73160000
 848:	01006372 	0x1006372
 84c:	02f60111 	0x2f60111
 850:	55010000 	0x55010000
 854:	01006e16 	0x1006e16
 858:	00350111 	0x350111
 85c:	56010000 	0x56010000
 860:	01007317 	0x1007317
 864:	00be0115 	0xbe0115
 868:	64170000 	0x64170000
 86c:	01160100 	0x1160100
 870:	0000007e 	0x7e
 874:	fc040800 	0xfc040800
 878:	18000002 	blez	zero,884 <data_size+0x170>
 87c:	01740114 	0x1740114
 880:	28010000 	slti	at,zero,0
 884:	00250101 	0x250101
 888:	14900000 	bne	a0,s0,88c <data_size+0x178>
 88c:	14fc9fc0 	bne	a3,gp,fffe8790 <_stack+0x603d6994>
 890:	02109fc0 	0x2109fc0
 894:	6d010000 	0x6d010000
 898:	00000362 	0x362
 89c:	74736415 	jalx	1cd9054 <data_size+0x1cd8940>
 8a0:	01280100 	0x1280100
 8a4:	00000025 	move	zero,zero
 8a8:	0000070a 	0x70a
 8ac:	63727316 	0x63727316
 8b0:	01280100 	0x1280100
 8b4:	000002f6 	0x2f6
 8b8:	6e165501 	0x6e165501
 8bc:	01280100 	0x1280100
 8c0:	00000035 	0x35
 8c4:	73195601 	0x73195601
 8c8:	012c0100 	0x12c0100
 8cc:	000000be 	0xbe
 8d0:	00000728 	0x728
 8d4:	0100641a 	0x100641a
 8d8:	007e012d 	0x7e012d
 8dc:	53010000 	0x53010000
 8e0:	47011400 	c1	0x1011400
 8e4:	01000001 	0x1000001
 8e8:	ea01014b 	swc2	$1,331(s0)
 8ec:	fc000001 	0xfc000001
 8f0:	5c9fc014 	0x5c9fc014
 8f4:	209fc015 	addi	ra,a0,-16363
 8f8:	01000002 	0x1000002
 8fc:	0003bf6d 	0x3bf6d
 900:	31761600 	andi	s6,t3,0x1600
 904:	014b0100 	0x14b0100
 908:	000002f6 	0x2f6
 90c:	76165401 	jalx	8595004 <data_size+0x85948f0>
 910:	4b010032 	c2	0x1010032
 914:	0002f601 	0x2f601
 918:	16550100 	bne	s2,s5,d1c <data_size+0x608>
 91c:	4b01006e 	c2	0x101006e
 920:	00003501 	0x3501
 924:	17560100 	bne	k0,s6,d28 <data_size+0x614>
 928:	01003173 	0x1003173
 92c:	00be014c 	syscall	0x2f805
 930:	73170000 	0x73170000
 934:	4d010032 	bc3t	a00 <data_size+0x2ec>
 938:	0000be01 	0xbe01
 93c:	011b0000 	0x11b0000
 940:	0000017c 	0x17c
 944:	01015701 	0x1015701
 948:	9fc0155c 	0x9fc0155c
 94c:	9fc0157c 	0x9fc0157c
 950:	00000230 	0x230
 954:	73156d01 	0x73156d01
 958:	01570100 	0x1570100
 95c:	00000025 	move	zero,zero
 960:	00000746 	0x746
 964:	01006e16 	0x1006e16
 968:	00350157 	0x350157
 96c:	55010000 	0x55010000
 970:	0000401c 	0x401c
 974:	c0155c00 	lwc0	$21,23552(zero)
 978:	c0157c9f 	lwc0	$21,31903(zero)
 97c:	0158019f 	0x158019f
 980:	0002881d 	0x2881d
 984:	02811d00 	0x2811d00
 988:	781d0000 	0x781d0000
 98c:	1e000002 	bgtz	s0,998 <data_size+0x284>
 990:	9fc0155c 	0x9fc0155c
 994:	9fc0157c 	0x9fc0157c
 998:	00006d13 	0x6d13
 99c:	00540100 	0x540100
 9a0:	0c000000 	jal	0 <data_size-0x714>
 9a4:	02000002 	0x2000002
 9a8:	00056c00 	sll	t5,a1,0x10
 9ac:	55010400 	0x55010400
 9b0:	01000000 	0x1000000
 9b4:	000001c2 	srl	zero,zero,0x7
 9b8:	00000064 	0x64
 9bc:	9fc01580 	0x9fc01580
 9c0:	9fc01718 	0x9fc01718
 9c4:	000002f5 	0x2f5
 9c8:	12070402 	beq	s0,a3,19d4 <data_size+0x12c0>
 9cc:	02000000 	0x2000000
 9d0:	000d0704 	0xd0704
 9d4:	aa030000 	swl	v1,0(s0)
 9d8:	02000001 	0x2000001
 9dc:	00002c03 	sra	a1,zero,0x10
 9e0:	05040400 	0x5040400
 9e4:	00746e69 	0x746e69
 9e8:	0001a105 	0x1a105
 9ec:	1f021000 	0x1f021000
 9f0:	0000008a 	0x8a
 9f4:	0001ea06 	0x1ea06
 9f8:	33200200 	andi	zero,t9,0x200
 9fc:	02000000 	0x2000000
 a00:	d0060010 	0xd0060010
 a04:	02000001 	0x2000001
 a08:	00003321 	0x3321
 a0c:	04100200 	bltzal	zero,1210 <data_size+0xafc>
 a10:	0001e206 	0x1e206
 a14:	33220200 	andi	v0,t9,0x200
 a18:	02000000 	0x2000000
 a1c:	b3060810 	0xb3060810
 a20:	02000001 	0x2000001
 a24:	00003323 	0x3323
 a28:	0c100200 	jal	400800 <data_size+0x4000ec>
 a2c:	96010700 	lhu	at,1792(s0)
 a30:	01000001 	0x1000001
 a34:	00002c04 	0x2c04
 a38:	00a30000 	0xa30000
 a3c:	05080000 	0x5080000
 a40:	c01e3803 	lwc0	$30,14339(zero)
 a44:	8a09009f 	lwl	t1,159(s0)
 a48:	80000000 	lb	zero,0(zero)
 a4c:	989fc015 	lwr	ra,-16363(a0)
 a50:	509fc015 	0x509fc015
 a54:	01000002 	0x1000002
 a58:	97010a6d 	lhu	at,2669(t8)
 a5c:	01000001 	0x1000001
 a60:	00002c14 	0x2c14
 a64:	c0159800 	lwc0	$21,-26624(zero)
 a68:	c015b09f 	lwc0	$21,-20321(zero)
 a6c:	0002609f 	0x2609f
 a70:	e46d0100 	swc1	$f13,256(v1)
 a74:	0b000000 	j	c000000 <data_size+0xbfff8ec>
 a78:	0000008a 	0x8a
 a7c:	9fc01598 	0x9fc01598
 a80:	9fc015a8 	0x9fc015a8
 a84:	0a001501 	j	8005404 <data_size+0x8004cf0>
 a88:	00018901 	0x18901
 a8c:	2c190100 	sltiu	t9,zero,256
 a90:	b0000000 	0xb0000000
 a94:	c89fc015 	lwc2	$31,-16363(a0)
 a98:	709fc015 	0x709fc015
 a9c:	01000002 	0x1000002
 aa0:	0001126d 	0x1126d
 aa4:	006e0c00 	0x6e0c00
 aa8:	002c1a01 	0x2c1a01
 aac:	03050000 	0x3050000
 ab0:	9fc01e34 	0x9fc01e34
 ab4:	d8010a00 	0xd8010a00
 ab8:	01000001 	0x1000001
 abc:	00002c32 	0x2c32
 ac0:	c015c800 	lwc0	$21,-14336(zero)
 ac4:	c015e09f 	lwc0	$21,-8033(zero)
 ac8:	0002809f 	0x2809f
 acc:	496d0100 	0x496d0100
 ad0:	0d000001 	jal	4000004 <data_size+0x3fff8f0>
 ad4:	3301006e 	andi	at,t8,0x6e
 ad8:	0000002c 	0x2c
 adc:	00008a0b 	0x8a0b
 ae0:	c015c800 	lwc0	$21,-14336(zero)
 ae4:	c015d89f 	lwc0	$21,-10081(zero)
 ae8:	0034019f 	0x34019f
 aec:	01bb010e 	0x1bb010e
 af0:	39010000 	xori	at,t0,0x0
 af4:	00002c01 	0x2c01
 af8:	c015e000 	lwc0	$21,-8192(zero)
 afc:	c016049f 	lwc0	$22,1183(zero)
 b00:	0002909f 	0x2909f
 b04:	816d0100 	lb	t5,256(t3)
 b08:	0d000001 	jal	4000004 <data_size+0x3fff8f0>
 b0c:	3a01006e 	xori	at,s0,0x6e
 b10:	0000002c 	0x2c
 b14:	00008a0b 	0x8a0b
 b18:	c015e000 	lwc0	$21,-8192(zero)
 b1c:	c015fc9f 	lwc0	$21,-865(zero)
 b20:	003b019f 	0x3b019f
 b24:	01c9010e 	0x1c9010e
 b28:	42010000 	c0	0x10000
 b2c:	00002c01 	0x2c01
 b30:	c0160400 	lwc0	$22,1024(zero)
 b34:	c016309f 	lwc0	$22,12447(zero)
 b38:	0002a09f 	0x2a09f
 b3c:	b56d0100 	0xb56d0100
 b40:	0d000001 	jal	4000004 <data_size+0x3fff8f0>
 b44:	4301006e 	c0	0x101006e
 b48:	0000002c 	0x2c
 b4c:	00008a0f 	0x8a0f
 b50:	00000000 	nop
 b54:	00440100 	0x440100
 b58:	01f10110 	0x1f10110
 b5c:	26010000 	addiu	at,s0,0
 b60:	00002c01 	0x2c01
 b64:	c0163000 	lwc0	$22,12288(zero)
 b68:	c017189f 	lwc0	$23,6303(zero)
 b6c:	0002b09f 	0x2b09f
 b70:	00076400 	sll	t4,a3,0x10
 b74:	00020900 	sll	at,v0,0x4
 b78:	65731100 	0x65731100
 b7c:	2501006c 	addiu	at,t0,108
 b80:	0000003e 	0x3e
 b84:	00000783 	sra	zero,zero,0x1e
 b88:	706d7411 	0x706d7411
 b8c:	09250100 	j	4940400 <data_size+0x493fcec>
 b90:	96000002 	lhu	zero,2(s0)
 b94:	0d000007 	jal	400001c <data_size+0x3fff908>
 b98:	2701006e 	addiu	at,t8,110
 b9c:	0000002c 	0x2c
 ba0:	00008a0f 	0x8a0f
 ba4:	00001800 	sll	v1,zero,0x0
 ba8:	00280100 	0x280100
 bac:	00450412 	0x450412
 bb0:	Address 0x0000000000000bb0 is out of bounds.


Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000000a8 	0xa8
   4:	00400002 	0x400002
   8:	01010000 	0x1010000
   c:	000d0efb 	0xd0efb
  10:	01010101 	0x1010101
  14:	01000000 	0x1000000
  18:	2e010000 	sltiu	at,s0,0
  1c:	6e692f2e 	0x6e692f2e
  20:	64756c63 	0x64756c63
  24:	73000065 	0x73000065
  28:	6f696474 	0x6f696474
  2c:	0000632e 	0x632e
  30:	74730000 	jalx	1cc0000 <data_size+0x1cbf8ec>
  34:	2e6f6964 	sltiu	t7,s3,26980
  38:	00010068 	0x10068
  3c:	6d6f6300 	0x6d6f6300
  40:	2e6e6f6d 	sltiu	t6,s3,28525
  44:	00010068 	0x10068
  48:	05000000 	bltz	t0,4c <data_size-0x6c8>
  4c:	c00b9002 	lwc0	$11,-28670(zero)
  50:	0113039f 	0x113039f
  54:	f14bf401 	0xf14bf401
  58:	1f03bdbf 	0x1f03bdbf
  5c:	484c0182 	0x484c0182
  60:	48834b4c 	0x48834b4c
  64:	12034b88 	beq	s0,v1,12e88 <data_size+0x12774>
  68:	bc498382 	0xbc498382
  6c:	bd47f883 	0xbd47f883
  70:	3c087a03 	lui	t0,0x7a03
  74:	f2670350 	0xf2670350
  78:	3e084983 	0x3e084983
  7c:	2c02f385 	sltiu	v0,zero,-3195
  80:	0903ed16 	j	40fb458 <data_size+0x40fad44>
  84:	08790382 	j	1e40e08 <data_size+0x1e406f4>
  88:	7903c1ac 	0x7903c1ac
  8c:	4a03894a 	c2	0x3894a
  90:	48847408 	0x48847408
  94:	85f24785 	lh	s2,18309(t7)
  98:	bb7808bb 	swr	t8,2235(k1)
  9c:	03877508 	0x3877508
  a0:	01280275 	0x1280275
  a4:	024a0b03 	0x24a0b03
  a8:	01010020 	add	zero,t0,at
  ac:	000000a8 	0xa8
  b0:	001f0002 	srl	zero,ra,0x0
  b4:	01010000 	0x1010000
  b8:	000d0efb 	0xd0efb
  bc:	01010101 	0x1010101
  c0:	01000000 	0x1000000
  c4:	00010000 	sll	zero,at,0x0
  c8:	6e697270 	0x6e697270
  cc:	632e6674 	0x632e6674
  d0:	00000000 	nop
  d4:	02050000 	0x2050000
  d8:	9fc00e00 	0x9fc00e00
  dc:	1a240213 	0x1a240213
  e0:	504a7803 	0x504a7803
  e4:	c24a7a03 	lwc0	$10,31235(s2)
  e8:	4a780389 	c2	0x780389
  ec:	4a780352 	c2	0x780352
  f0:	00c2034e 	0xc2034e
  f4:	7fbe034a 	0x7fbe034a
  f8:	00c2034a 	0xc2034a
  fc:	ba038382 	swr	v1,-31870(s0)
 100:	ca03827f 	lwc2	$3,-32129(s0)
 104:	03740800 	0x3740800
 108:	2c027fb9 	sltiu	v0,zero,32697
 10c:	38038601 	xori	v1,zero,0x8601
 110:	41033c08 	0x41033c08
 114:	30038982 	andi	v1,zero,0x8982
 118:	03f43c08 	0x3f43c08
 11c:	033c084e 	0x33c084e
 120:	4f03823e 	c3	0x103823e
 124:	034bf3f2 	0x34bf3f2
 128:	03bb8274 	0x3bb8274
 12c:	4bf38223 	c2	0x1f38223
 130:	f3827303 	0xf3827303
 134:	8279034b 	lb	t9,843(s3)
 138:	79034bf3 	0x79034bf3
 13c:	034bf382 	0x34bf382
 140:	03bb8274 	0x3bb8274
 144:	4bf38218 	c2	0x1f38218
 148:	83820903 	lb	v0,2307(gp)
 14c:	4bf14b87 	c2	0x1f14b87
 150:	02750849 	0x2750849
 154:	01010008 	0x1010008
 158:	0000003c 	0x3c
 15c:	00200002 	0x200002
 160:	01010000 	0x1010000
 164:	000d0efb 	0xd0efb
 168:	01010101 	0x1010101
 16c:	01000000 	0x1000000
 170:	00010000 	sll	zero,at,0x0
 174:	63747570 	0x63747570
 178:	2e726168 	sltiu	s2,s3,24936
 17c:	00000063 	0x63
 180:	05000000 	bltz	t0,184 <data_size-0x590>
 184:	c0105002 	lwc0	$16,20482(zero)
 188:	0313199f 	0x313199f
 18c:	7003ba09 	0x7003ba09
 190:	02848382 	0x2848382
 194:	01010010 	0x1010010
 198:	0000003f 	0x3f
 19c:	001d0002 	srl	zero,sp,0x0
 1a0:	01010000 	0x1010000
 1a4:	000d0efb 	0xd0efb
 1a8:	01010101 	0x1010101
 1ac:	01000000 	0x1000000
 1b0:	00010000 	sll	zero,at,0x0
 1b4:	73747570 	0x73747570
 1b8:	0000632e 	0x632e
 1bc:	00000000 	nop
 1c0:	10900205 	beq	a0,s0,9d8 <data_size+0x2c4>
 1c4:	08139fc0 	j	4e7f00 <data_size+0x4e77ec>
 1c8:	7f83f43e 	0x7f83f43e
 1cc:	f97ff3f4 	0xf97ff3f4
 1d0:	8383b008 	lb	v1,-20472(gp)
 1d4:	10028483 	beq	zero,v0,fffe13e4 <_stack+0x603cf5e8>
 1d8:	53010100 	0x53010100
 1dc:	02000000 	0x2000000
 1e0:	00002200 	sll	a0,zero,0x8
 1e4:	fb010100 	0xfb010100
 1e8:	01000d0e 	0x1000d0e
 1ec:	00010101 	0x10101
 1f0:	00010000 	sll	zero,at,0x0
 1f4:	70000100 	0x70000100
 1f8:	746e6972 	jalx	1b9a5c8 <data_size+0x1b99eb4>
 1fc:	65736162 	0x65736162
 200:	0000632e 	0x632e
 204:	00000000 	nop
 208:	11500205 	beq	t2,s0,a20 <data_size+0x30c>
 20c:	08139fc0 	j	4e7f00 <data_size+0x4e77ec>
 210:	4cf78774 	0x4cf78774
 214:	b84cf0bc 	swr	t4,-3908(v0)
 218:	086c038a 	j	1b00e28 <data_size+0x1b00714>
 21c:	82160374 	lb	s6,884(s0)
 220:	0888b7f3 	j	222dfcc <data_size+0x222d8b8>
 224:	710383e0 	0x710383e0
 228:	0f033c08 	jal	c0cf020 <data_size+0xc0ce90c>
 22c:	000802f2 	0x802f2
 230:	00bf0101 	0xbf0101
 234:	00020000 	sll	zero,v0,0x0
 238:	00000036 	0x36
 23c:	0efb0101 	jal	bec0404 <data_size+0xbebfcf0>
 240:	0101000d 	break	0x101
 244:	00000101 	0x101
 248:	00000100 	sll	zero,zero,0x4
 24c:	2f2e2e01 	sltiu	t6,t9,11777
 250:	6c636e69 	0x6c636e69
 254:	00656475 	0x656475
 258:	72747300 	0x72747300
 25c:	2e676e69 	sltiu	a3,s3,28265
 260:	00000063 	0x63
 264:	6d6f6300 	0x6d6f6300
 268:	2e6e6f6d 	sltiu	t6,s3,28525
 26c:	00010068 	0x10068
 270:	05000000 	bltz	t0,274 <data_size-0x4a0>
 274:	c0125002 	lwc0	$18,20482(zero)
 278:	010b039f 	0x10b039f
 27c:	0849f314 	j	127cc50 <data_size+0x127c53c>
 280:	82100378 	lb	s0,888(s0)
 284:	13340214 	beq	t9,s4,ad8 <data_size+0x3c4>
 288:	0f03be49 	jal	c0ef924 <data_size+0xc0ef210>
 28c:	084f0182 	j	13c0608 <data_size+0x13bfef4>
 290:	820d0340 	lb	t5,832(s0)
 294:	474d8314 	c1	0x14d8314
 298:	038948bb 	0x38948bb
 29c:	0213820e 	0x213820e
 2a0:	7ef3154c 	0x7ef3154c
 2a4:	f20c034d 	0xf20c034d
 2a8:	83834913 	lb	v1,18707(gp)
 2ac:	f9467708 	0xf9467708
 2b0:	13f20c03 	beq	ra,s2,32c0 <data_size+0x2bac>
 2b4:	08838349 	j	20e0d24 <data_size+0x20e0610>
 2b8:	03f94677 	0x3f94677
 2bc:	01f200e6 	0x1f200e6
 2c0:	814c8187 	lb	t4,-32377(t2)
 2c4:	82110387 	lb	s1,903(s0)
 2c8:	87f1bb18 	lh	s1,-17640(ra)
 2cc:	18820c03 	0x18820c03
 2d0:	f183b208 	0xf183b208
 2d4:	82760388 	lb	s6,904(s3)
 2d8:	0a03f183 	j	80fc60c <data_size+0x80fbef8>
 2dc:	82110382 	lb	s1,898(s0)
 2e0:	3b088315 	xori	t0,t8,0x8315
 2e4:	89ab0883 	lwl	t3,2179(t5)
 2e8:	a403f97d 	sh	v1,-1667(zero)
 2ec:	8183017f 	lb	v1,383(t4)
 2f0:	01001002 	0x1001002
 2f4:	0000a001 	0xa001
 2f8:	32000200 	andi	zero,s0,0x200
 2fc:	01000000 	0x1000000
 300:	0d0efb01 	jal	43bec04 <data_size+0x43be4f0>
 304:	01010100 	0x1010100
 308:	00000001 	0x1
 30c:	01000001 	0x1000001
 310:	692f2e2e 	0x692f2e2e
 314:	756c636e 	jalx	5b18db8 <data_size+0x5b186a4>
 318:	00006564 	0x6564
 31c:	656d6974 	0x656d6974
 320:	0000632e 	0x632e
 324:	69740000 	0x69740000
 328:	682e656d 	0x682e656d
 32c:	00000100 	sll	zero,zero,0x4
 330:	02050000 	0x2050000
 334:	9fc01580 	0x9fc01580
 338:	0b031415 	j	c0c5054 <data_size+0xc0c4940>
 33c:	720385f2 	0x720385f2
 340:	f2100301 	0xf2100301
 344:	03fa1485 	0x3fa1485
 348:	5403820f 	0x5403820f
 34c:	f2300301 	0xf2300301
 350:	014d0385 	0x14d0385
 354:	ac083803 	sw	t0,14339(zero)
 358:	01440386 	0x1440386
 35c:	f200c103 	0xf200c103
 360:	ba7fbf03 	swr	ra,-16637(s3)
 364:	4a00c103 	c2	0xc103
 368:	03ba5f03 	0x3ba5f03
 36c:	25030160 	addiu	v1,t0,352
 370:	4a5b0382 	c2	0x5b0382
 374:	f14a2503 	0xf14a2503
 378:	5d037f4c 	0x5d037f4c
 37c:	4a2003f2 	c2	0x2003f2
 380:	4a790351 	c2	0x790351
 384:	4a790351 	c2	0x790351
 388:	7608b94f 	jalx	822e53c <data_size+0x822de28>
 38c:	72087308 	0x72087308
 390:	84f57508 	lh	s5,29960(a3)
 394:	01001002 	0x1001002
 398:	Address 0x0000000000000398 is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	syscall
   4:	ffffffff 	0xffffffff
   8:	7c010001 	0x7c010001
   c:	001d0c1f 	0x1d0c1f
  10:	0000000c 	syscall
  14:	00000000 	nop
  18:	9fc00b90 	0x9fc00b90
  1c:	00000044 	0x44
  20:	0000000c 	syscall
  24:	00000000 	nop
  28:	9fc00bd4 	0x9fc00bd4
  2c:	00000030 	0x30
  30:	00000018 	mult	zero,zero
  34:	00000000 	nop
  38:	9fc00c04 	0x9fc00c04
  3c:	00000068 	0x68
  40:	44200e44 	0x44200e44
  44:	91480390 	lbu	t0,912(t2)
  48:	019f4802 	0x19f4802
  4c:	0000001c 	0x1c
  50:	00000000 	nop
  54:	9fc00c6c 	0x9fc00c6c
  58:	000000c8 	0xc8
  5c:	44200e44 	0x44200e44
  60:	904c0391 	lbu	t4,913(v0)
  64:	4c029204 	0x4c029204
  68:	0000019f 	0x19f
  6c:	00000020 	add	zero,zero,zero
  70:	00000000 	nop
  74:	9fc00d34 	0x9fc00d34
  78:	000000cc 	syscall	0x3
  7c:	44280e44 	0x44280e44
  80:	94480591 	lhu	t0,1425(v0)
  84:	019f5802 	0x19f5802
  88:	04920690 	0x4920690
  8c:	00000393 	0x393
  90:	0000000c 	syscall
  94:	ffffffff 	0xffffffff
  98:	7c010001 	0x7c010001
  9c:	001d0c1f 	0x1d0c1f
  a0:	00000020 	add	zero,zero,zero
  a4:	00000090 	0x90
  a8:	9fc00e00 	0x9fc00e00
  ac:	00000250 	0x250
  b0:	60380e44 	0x60380e44
  b4:	07910890 	bgezal	gp,22f8 <data_size+0x1be4>
  b8:	04940692 	0x4940692
  bc:	02960395 	0x2960395
  c0:	0593019f 	0x593019f
  c4:	0000000c 	syscall
  c8:	ffffffff 	0xffffffff
  cc:	7c010001 	0x7c010001
  d0:	001d0c1f 	0x1d0c1f
  d4:	0000000c 	syscall
  d8:	000000c4 	0xc4
  dc:	9fc01050 	0x9fc01050
  e0:	00000014 	0x14
  e4:	00000014 	0x14
  e8:	000000c4 	0xc4
  ec:	9fc01064 	0x9fc01064
  f0:	00000020 	add	zero,zero,zero
  f4:	44180e44 	0x44180e44
  f8:	0000019f 	0x19f
  fc:	0000000c 	syscall
 100:	ffffffff 	0xffffffff
 104:	7c010001 	0x7c010001
 108:	001d0c1f 	0x1d0c1f
 10c:	00000018 	mult	zero,zero
 110:	000000fc 	0xfc
 114:	9fc01090 	0x9fc01090
 118:	00000088 	0x88
 11c:	50200e44 	0x50200e44
 120:	02920490 	0x2920490
 124:	0391019f 	0x391019f
 128:	00000014 	0x14
 12c:	000000fc 	0xfc
 130:	9fc01118 	0x9fc01118
 134:	00000030 	0x30
 138:	44180e44 	0x44180e44
 13c:	0000019f 	0x19f
 140:	0000000c 	syscall
 144:	ffffffff 	0xffffffff
 148:	7c010001 	0x7c010001
 14c:	001d0c1f 	0x1d0c1f
 150:	0000001c 	0x1c
 154:	00000140 	sll	zero,zero,0x5
 158:	9fc01150 	0x9fc01150
 15c:	00000100 	sll	zero,zero,0x4
 160:	54680e44 	0x54680e44
 164:	04910590 	bgezal	a0,17a8 <data_size+0x1094>
 168:	0392019f 	0x392019f
 16c:	00000293 	0x293
 170:	0000000c 	syscall
 174:	ffffffff 	0xffffffff
 178:	7c010001 	0x7c010001
 17c:	001d0c1f 	0x1d0c1f
 180:	0000000c 	syscall
 184:	00000170 	0x170
 188:	9fc01250 	0x9fc01250
 18c:	00000034 	0x34
 190:	0000000c 	syscall
 194:	00000170 	0x170
 198:	9fc01284 	0x9fc01284
 19c:	0000004c 	syscall	0x1
 1a0:	0000000c 	syscall
 1a4:	00000170 	0x170
 1a8:	9fc012d0 	0x9fc012d0
 1ac:	00000020 	add	zero,zero,zero
 1b0:	0000000c 	syscall
 1b4:	00000170 	0x170
 1b8:	9fc012f0 	0x9fc012f0
 1bc:	00000030 	0x30
 1c0:	0000000c 	syscall
 1c4:	00000170 	0x170
 1c8:	9fc01320 	0x9fc01320
 1cc:	00000078 	0x78
 1d0:	0000000c 	syscall
 1d4:	00000170 	0x170
 1d8:	9fc01398 	0x9fc01398
 1dc:	00000050 	0x50
 1e0:	0000000c 	syscall
 1e4:	00000170 	0x170
 1e8:	9fc013e8 	0x9fc013e8
 1ec:	00000050 	0x50
 1f0:	0000000c 	syscall
 1f4:	00000170 	0x170
 1f8:	9fc01438 	0x9fc01438
 1fc:	0000002c 	0x2c
 200:	0000000c 	syscall
 204:	00000170 	0x170
 208:	9fc01464 	0x9fc01464
 20c:	0000002c 	0x2c
 210:	0000000c 	syscall
 214:	00000170 	0x170
 218:	9fc01490 	0x9fc01490
 21c:	0000006c 	0x6c
 220:	0000000c 	syscall
 224:	00000170 	0x170
 228:	9fc014fc 	0x9fc014fc
 22c:	00000060 	0x60
 230:	0000000c 	syscall
 234:	00000170 	0x170
 238:	9fc0155c 	0x9fc0155c
 23c:	00000020 	add	zero,zero,zero
 240:	0000000c 	syscall
 244:	ffffffff 	0xffffffff
 248:	7c010001 	0x7c010001
 24c:	001d0c1f 	0x1d0c1f
 250:	0000000c 	syscall
 254:	00000240 	sll	zero,zero,0x9
 258:	9fc01580 	0x9fc01580
 25c:	00000018 	mult	zero,zero
 260:	0000000c 	syscall
 264:	00000240 	sll	zero,zero,0x9
 268:	9fc01598 	0x9fc01598
 26c:	00000018 	mult	zero,zero
 270:	0000000c 	syscall
 274:	00000240 	sll	zero,zero,0x9
 278:	9fc015b0 	0x9fc015b0
 27c:	00000018 	mult	zero,zero
 280:	0000000c 	syscall
 284:	00000240 	sll	zero,zero,0x9
 288:	9fc015c8 	0x9fc015c8
 28c:	00000018 	mult	zero,zero
 290:	0000000c 	syscall
 294:	00000240 	sll	zero,zero,0x9
 298:	9fc015e0 	0x9fc015e0
 29c:	00000024 	and	zero,zero,zero
 2a0:	0000000c 	syscall
 2a4:	00000240 	sll	zero,zero,0x9
 2a8:	9fc01604 	0x9fc01604
 2ac:	0000002c 	0x2c
 2b0:	00000014 	0x14
 2b4:	00000240 	sll	zero,zero,0x9
 2b8:	9fc01630 	0x9fc01630
 2bc:	000000e8 	0xe8
 2c0:	180e4c02 	0x180e4c02
 2c4:	00019f48 	0x19f48

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000074 	0x74
   4:	00000078 	0x78
   8:	786d0001 	0x786d0001
   c:	dc000000 	0xdc000000
  10:	02000000 	0x2000000
  14:	00208d00 	0x208d00
  18:	00000000 	nop
  1c:	74000000 	jalx	0 <data_size-0x714>
  20:	88000000 	lwl	zero,0(zero)
  24:	01000000 	0x1000000
  28:	00885400 	0x885400
  2c:	00bc0000 	0xbc0000
  30:	00010000 	sll	zero,at,0x0
  34:	0000c461 	0xc461
  38:	0000d000 	sll	k0,zero,0x0
  3c:	61000100 	0x61000100
	...
  48:	00000080 	sll	zero,zero,0x2
  4c:	000000b8 	0xb8
  50:	c4600001 	lwc1	$f0,1(v1)
  54:	d4000000 	0xd4000000
  58:	01000000 	0x1000000
  5c:	00006000 	sll	t4,zero,0x0
  60:	00000000 	nop
  64:	00dc0000 	0xdc0000
  68:	00e00000 	0xe00000
  6c:	00010000 	sll	zero,at,0x0
  70:	0000e06d 	0xe06d
  74:	0001a400 	sll	s4,at,0x10
  78:	8d000200 	lw	zero,512(t0)
  7c:	00000020 	add	zero,zero,zero
  80:	00000000 	nop
  84:	0000dc00 	sll	k1,zero,0x10
  88:	0000f800 	sll	ra,zero,0x0
  8c:	54000100 	0x54000100
  90:	000000f8 	0xf8
  94:	00000164 	0x164
  98:	74620001 	jalx	1880004 <data_size+0x187f8f0>
  9c:	94000001 	lhu	zero,1(zero)
  a0:	01000001 	0x1000001
  a4:	00006200 	sll	t4,zero,0x8
  a8:	00000000 	nop
  ac:	00dc0000 	0xdc0000
  b0:	01040000 	0x1040000
  b4:	00010000 	sll	zero,at,0x0
  b8:	00000055 	0x55
  bc:	00000000 	nop
  c0:	0000dc00 	sll	k1,zero,0x10
  c4:	00010400 	sll	zero,at,0x10
  c8:	56000100 	0x56000100
  cc:	00000104 	0x104
  d0:	0000016c 	0x16c
  d4:	74600001 	jalx	1800004 <data_size+0x17ff8f0>
  d8:	9c000001 	0x9c000001
  dc:	01000001 	0x1000001
  e0:	00006000 	sll	t4,zero,0x0
  e4:	00000000 	nop
  e8:	00e80000 	0xe80000
  ec:	01680000 	0x1680000
  f0:	00010000 	sll	zero,at,0x0
  f4:	00017461 	0x17461
  f8:	00019800 	sll	s3,at,0x0
  fc:	61000100 	0x61000100
	...
 108:	0000010c 	syscall	0x4
 10c:	00000114 	0x114
 110:	14570001 	bne	v0,s7,118 <data_size-0x5fc>
 114:	20000001 	addi	zero,zero,1
 118:	01000001 	0x1000001
 11c:	01205200 	0x1205200
 120:	01a40000 	0x1a40000
 124:	00010000 	sll	zero,at,0x0
 128:	00000057 	0x57
 12c:	00000000 	nop
 130:	00012800 	sll	a1,at,0x0
 134:	00017400 	sll	t6,at,0x10
 138:	56000100 	0x56000100
 13c:	00000174 	0x174
 140:	000001a4 	0x1a4
 144:	00560001 	0x560001
 148:	00000000 	nop
 14c:	a4000000 	sh	zero,0(zero)
 150:	a8000001 	swl	zero,1(zero)
 154:	01000001 	0x1000001
 158:	01a86d00 	0x1a86d00
 15c:	02700000 	0x2700000
 160:	00020000 	sll	zero,v0,0x0
 164:	0000288d 	break	0x0,0xa2
 168:	00000000 	nop
 16c:	01a40000 	0x1a40000
 170:	01bc0000 	0x1bc0000
 174:	00010000 	sll	zero,at,0x0
 178:	0001bc54 	0x1bc54
 17c:	00023000 	sll	a2,v0,0x0
 180:	64000100 	0x64000100
 184:	00000248 	0x248
 188:	00000258 	0x258
 18c:	00640001 	0x640001
 190:	00000000 	nop
 194:	a4000000 	sh	zero,0(zero)
 198:	dc000001 	0xdc000001
 19c:	01000001 	0x1000001
 1a0:	01dc5500 	0x1dc5500
 1a4:	02340000 	0x2340000
 1a8:	00010000 	sll	zero,at,0x0
 1ac:	00024863 	0x24863
 1b0:	00025c00 	sll	t3,v0,0x10
 1b4:	63000100 	0x63000100
	...
 1c0:	000001a4 	0x1a4
 1c4:	000001dc 	0x1dc
 1c8:	dc560001 	0xdc560001
 1cc:	38000001 	xori	zero,zero,0x1
 1d0:	01000002 	0x1000002
 1d4:	02486200 	0x2486200
 1d8:	02600000 	0x2600000
 1dc:	00010000 	sll	zero,at,0x0
 1e0:	00000062 	0x62
 1e4:	00000000 	nop
 1e8:	0001a400 	sll	s4,at,0x10
 1ec:	0001dc00 	sll	k1,at,0x10
 1f0:	57000100 	0x57000100
 1f4:	000001dc 	0x1dc
 1f8:	00000240 	sll	zero,zero,0x9
 1fc:	48600001 	0x48600001
 200:	68000002 	0x68000002
 204:	01000002 	0x1000002
 208:	00006000 	sll	t4,zero,0x0
 20c:	00000000 	nop
 210:	01b00000 	0x1b00000
 214:	023c0000 	0x23c0000
 218:	00010000 	sll	zero,at,0x0
 21c:	00024861 	0x24861
 220:	00026400 	sll	t4,v0,0x10
 224:	61000100 	0x61000100
	...
 230:	000001f4 	0x1f4
 234:	00000248 	0x248
 238:	50570001 	0x50570001
 23c:	70000002 	0x70000002
 240:	01000002 	0x1000002
 244:	00005700 	sll	t2,zero,0x1c
	...
 250:	00040000 	sll	zero,a0,0x0
 254:	00010000 	sll	zero,at,0x0
 258:	0000046d 	0x46d
 25c:	00025000 	sll	t2,v0,0x0
 260:	8d000200 	lw	zero,512(t0)
 264:	00000038 	0x38
	...
 270:	00003000 	sll	a2,zero,0x0
 274:	54000100 	0x54000100
 278:	00000030 	0x30
 27c:	000000a4 	0xa4
 280:	b8630001 	swr	v1,1(v1)
 284:	50000000 	0x50000000
 288:	01000002 	0x1000002
 28c:	00006300 	sll	t4,zero,0xc
 290:	00000000 	nop
 294:	00540000 	0x540000
 298:	00ac0000 	0xac0000
 29c:	00010000 	sll	zero,at,0x0
 2a0:	0000b861 	0xb861
 2a4:	00025000 	sll	t2,v0,0x0
 2a8:	61000100 	0x61000100
	...
 2b4:	0000004c 	syscall	0x1
 2b8:	000000a8 	0xa8
 2bc:	b8620001 	swr	v0,1(v1)
 2c0:	50000000 	0x50000000
 2c4:	01000002 	0x1000002
 2c8:	00006200 	sll	t4,zero,0x8
 2cc:	00000000 	nop
 2d0:	00c00000 	0xc00000
 2d4:	00dc0000 	0xdc0000
 2d8:	00010000 	sll	zero,at,0x0
 2dc:	0000e455 	0xe455
 2e0:	00012400 	sll	a0,at,0x10
 2e4:	55000100 	0x55000100
 2e8:	00000134 	0x134
 2ec:	00000144 	0x144
 2f0:	50550001 	0x50550001
 2f4:	5c000001 	0x5c000001
 2f8:	01000001 	0x1000001
 2fc:	01645500 	0x1645500
 300:	01740000 	0x1740000
 304:	00010000 	sll	zero,at,0x0
 308:	00018055 	0x18055
 30c:	00019000 	sll	s2,at,0x0
 310:	55000100 	0x55000100
 314:	0000019c 	0x19c
 318:	000001ac 	0x1ac
 31c:	b8550001 	swr	s5,1(v0)
 320:	c8000001 	lwc2	$0,1(zero)
 324:	01000001 	0x1000001
 328:	01d45500 	0x1d45500
 32c:	01e00000 	0x1e00000
 330:	00010000 	sll	zero,at,0x0
 334:	0001e855 	0x1e855
 338:	0001f800 	sll	ra,at,0x0
 33c:	55000100 	0x55000100
 340:	00000204 	0x204
 344:	0000020c 	syscall	0x8
 348:	14550001 	bne	v0,s5,350 <data_size-0x3c4>
 34c:	50000002 	0x50000002
 350:	01000002 	0x1000002
 354:	00005500 	sll	t2,zero,0x14
 358:	00000000 	nop
 35c:	00140000 	sll	zero,s4,0x0
 360:	00180000 	sll	zero,t8,0x0
 364:	00010000 	sll	zero,at,0x0
 368:	0000186d 	0x186d
 36c:	00003400 	sll	a2,zero,0x10
 370:	8d000200 	lw	zero,512(t0)
 374:	00000018 	mult	zero,zero
 378:	00000000 	nop
 37c:	00001400 	sll	v0,zero,0x10
 380:	00002400 	sll	a0,zero,0x10
 384:	54000100 	0x54000100
	...
 394:	00000004 	sllv	zero,zero,zero
 398:	046d0001 	0x46d0001
 39c:	88000000 	lwl	zero,0(zero)
 3a0:	02000000 	0x2000000
 3a4:	00208d00 	0x208d00
	...
 3b0:	24000000 	li	zero,0
 3b4:	01000000 	0x1000000
 3b8:	00245400 	0x245400
 3bc:	007c0000 	0x7c0000
 3c0:	00010000 	sll	zero,at,0x0
 3c4:	00007c61 	0x7c61
 3c8:	00008800 	sll	s1,zero,0x0
 3cc:	54000100 	0x54000100
	...
 3d8:	0000001c 	0x1c
 3dc:	00000080 	sll	zero,zero,0x2
 3e0:	00600001 	0x600001
 3e4:	00000000 	nop
 3e8:	88000000 	lwl	zero,0(zero)
 3ec:	8c000000 	lw	zero,0(zero)
 3f0:	01000000 	0x1000000
 3f4:	008c6d00 	0x8c6d00
 3f8:	00b80000 	0xb80000
 3fc:	00020000 	sll	zero,v0,0x0
 400:	0000188d 	break	0x0,0x62
 404:	00000000 	nop
 408:	00880000 	0x880000
 40c:	00980000 	0x980000
 410:	00010000 	sll	zero,at,0x0
 414:	00000054 	0x54
	...
 420:	00000400 	sll	zero,zero,0x10
 424:	6d000100 	0x6d000100
 428:	00000004 	sllv	zero,zero,zero
 42c:	00000100 	sll	zero,zero,0x4
 430:	e88d0003 	swc2	$13,3(a0)
	...
 440:	00002800 	sll	a1,zero,0x0
 444:	54000100 	0x54000100
 448:	00000028 	0x28
 44c:	00000060 	0x60
 450:	68530001 	0x68530001
 454:	6c000000 	0x6c000000
 458:	01000000 	0x1000000
 45c:	006c5300 	0x6c5300
 460:	00980000 	0x980000
 464:	00010000 	sll	zero,at,0x0
 468:	0000ac54 	0xac54
 46c:	0000d400 	sll	k0,zero,0x10
 470:	54000100 	0x54000100
 474:	000000e8 	0xe8
 478:	000000e8 	0xe8
 47c:	e8540001 	swc2	$20,1(v0)
 480:	f0000000 	0xf0000000
 484:	01000000 	0x1000000
 488:	00f85300 	0xf85300
 48c:	00f80000 	0xf80000
 490:	00010000 	sll	zero,at,0x0
 494:	00000053 	0x53
	...
 4a0:	00002800 	sll	a1,zero,0x0
 4a4:	55000100 	0x55000100
 4a8:	00000028 	0x28
 4ac:	00000098 	0x98
 4b0:	98630001 	lwr	v1,1(v1)
 4b4:	a4000000 	sh	zero,0(zero)
 4b8:	01000000 	0x1000000
 4bc:	00ac5500 	0xac5500
 4c0:	00b80000 	0xb80000
 4c4:	00010000 	sll	zero,at,0x0
 4c8:	0000b863 	0xb863
 4cc:	0000cc00 	sll	t9,zero,0x10
 4d0:	55000100 	0x55000100
 4d4:	000000cc 	syscall	0x3
 4d8:	000000d4 	0xd4
 4dc:	d4630001 	0xd4630001
 4e0:	e8000000 	swc2	$0,0(zero)
 4e4:	01000000 	0x1000000
 4e8:	00e85500 	0xe85500
 4ec:	00f80000 	0xf80000
 4f0:	00010000 	sll	zero,at,0x0
 4f4:	0000f863 	0xf863
 4f8:	00010000 	sll	zero,at,0x0
 4fc:	55000100 	0x55000100
	...
 50c:	00000028 	0x28
 510:	28560001 	slti	s6,v0,1
 514:	88000000 	lwl	zero,0(zero)
 518:	01000000 	0x1000000
 51c:	00886200 	0x886200
 520:	00a40000 	0xa40000
 524:	00010000 	sll	zero,at,0x0
 528:	0000ac56 	0xac56
 52c:	0000bc00 	sll	s7,zero,0x10
 530:	62000100 	0x62000100
 534:	000000bc 	0xbc
 538:	000000e8 	0xe8
 53c:	e8560001 	swc2	$22,1(v0)
 540:	f8000000 	0xf8000000
 544:	01000000 	0x1000000
 548:	00f86200 	0xf86200
 54c:	01000000 	0x1000000
 550:	00010000 	sll	zero,at,0x0
 554:	00000056 	0x56
	...
 560:	0000a400 	sll	s4,zero,0x10
 564:	57000100 	0x57000100
 568:	000000ac 	0xac
 56c:	000000f0 	0xf0
 570:	f8570001 	0xf8570001
 574:	00000000 	nop
 578:	01000001 	0x1000001
 57c:	00005700 	sll	t2,zero,0x1c
 580:	00000000 	nop
 584:	003c0000 	0x3c0000
 588:	00c00000 	0xc00000
 58c:	00010000 	sll	zero,at,0x0
 590:	0000cc61 	0xcc61
 594:	0000e800 	sll	sp,zero,0x0
 598:	61000100 	0x61000100
 59c:	000000f8 	0xf8
 5a0:	00000100 	sll	zero,zero,0x4
 5a4:	00610001 	0x610001
 5a8:	00000000 	nop
 5ac:	6c000000 	0x6c000000
 5b0:	a4000000 	sh	zero,0(zero)
 5b4:	01000000 	0x1000000
 5b8:	00ac5300 	0xac5300
 5bc:	00e80000 	0xe80000
 5c0:	00010000 	sll	zero,at,0x0
 5c4:	0000f853 	0xf853
 5c8:	00010000 	sll	zero,at,0x0
 5cc:	53000100 	0x53000100
	...
 5d8:	000000d4 	0xd4
 5dc:	000000e0 	0xe0
 5e0:	f8540001 	0xf8540001
 5e4:	f8000000 	0xf8000000
 5e8:	01000000 	0x1000000
 5ec:	00005400 	sll	t2,zero,0x10
 5f0:	00000000 	nop
 5f4:	00340000 	0x340000
 5f8:	00800000 	0x800000
 5fc:	00010000 	sll	zero,at,0x0
 600:	0000ac60 	0xac60
 604:	0000c400 	sll	t8,zero,0x10
 608:	60000100 	0x60000100
 60c:	000000e8 	0xe8
 610:	000000f8 	0xf8
 614:	00600001 	0x600001
 618:	00000000 	nop
 61c:	10000000 	b	620 <data_size-0xf4>
 620:	34000000 	li	zero,0x0
 624:	01000000 	0x1000000
 628:	00345500 	0x345500
 62c:	00340000 	0x340000
 630:	00010000 	sll	zero,at,0x0
 634:	00000055 	0x55
 638:	00000000 	nop
 63c:	00005000 	sll	t2,zero,0x0
 640:	00008000 	sll	s0,zero,0x0
 644:	53000100 	0x53000100
 648:	00000080 	sll	zero,zero,0x2
 64c:	00000080 	sll	zero,zero,0x2
 650:	00530001 	0x530001
 654:	00000000 	nop
 658:	48000000 	mfc2	zero,$0
 65c:	5c000001 	0x5c000001
 660:	01000001 	0x1000001
 664:	015c5400 	0x15c5400
 668:	01880000 	0x1880000
 66c:	00010000 	sll	zero,at,0x0
 670:	00018852 	0x18852
 674:	00019000 	sll	s2,at,0x0
 678:	54000100 	0x54000100
 67c:	00000190 	0x190
 680:	00000198 	0x198
 684:	00520001 	0x520001
 688:	00000000 	nop
 68c:	98000000 	lwr	zero,0(zero)
 690:	ac000001 	sw	zero,1(zero)
 694:	01000001 	0x1000001
 698:	01ac5400 	0x1ac5400
 69c:	01d80000 	0x1d80000
 6a0:	00010000 	sll	zero,at,0x0
 6a4:	0001d852 	0x1d852
 6a8:	0001e000 	sll	gp,at,0x0
 6ac:	54000100 	0x54000100
 6b0:	000001e0 	0x1e0
 6b4:	000001e8 	0x1e8
 6b8:	00520001 	0x520001
 6bc:	00000000 	nop
 6c0:	e8000000 	swc2	$0,0(zero)
 6c4:	f8000001 	0xf8000001
 6c8:	01000001 	0x1000001
 6cc:	01f85400 	0x1f85400
 6d0:	01fc0000 	0x1fc0000
 6d4:	00010000 	sll	zero,at,0x0
 6d8:	0001fc52 	0x1fc52
 6dc:	00021400 	sll	v0,v0,0x10
 6e0:	54000100 	0x54000100
	...
 6ec:	00000214 	0x214
 6f0:	0000021c 	0x21c
 6f4:	1c540001 	0x1c540001
 6f8:	40000002 	0x40000002
 6fc:	01000002 	0x1000002
 700:	00005800 	sll	t3,zero,0x0
 704:	00000000 	nop
 708:	02400000 	0x2400000
 70c:	024c0000 	0x24c0000
 710:	00010000 	sll	zero,at,0x0
 714:	00024c54 	0x24c54
 718:	0002ac00 	sll	s5,v0,0x10
 71c:	58000100 	0x58000100
	...
 728:	00000250 	0x250
 72c:	0000026c 	0x26c
 730:	7c540001 	0x7c540001
 734:	ac000002 	sw	zero,2(zero)
 738:	01000002 	0x1000002
 73c:	00005400 	sll	t2,zero,0x10
 740:	00000000 	nop
 744:	030c0000 	0x30c0000
 748:	031c0000 	0x31c0000
 74c:	00010000 	sll	zero,at,0x0
 750:	00032454 	0x32454
 754:	00032c00 	sll	a1,v1,0x10
 758:	54000100 	0x54000100
	...
 764:	000000b0 	0xb0
 768:	000000fc 	0xfc
 76c:	fc6d0001 	0xfc6d0001
 770:	98000000 	lwr	zero,0(zero)
 774:	02000001 	0x2000001
 778:	00188d00 	sll	s1,t8,0x14
 77c:	00000000 	nop
 780:	b0000000 	0xb0000000
 784:	b4000000 	0xb4000000
 788:	01000000 	0x1000000
 78c:	00005400 	sll	t2,zero,0x10
 790:	00000000 	nop
 794:	00b00000 	0xb00000
 798:	01680000 	0x1680000
 79c:	00010000 	sll	zero,at,0x0
 7a0:	00016855 	0x16855
 7a4:	00018800 	sll	s1,at,0x0
 7a8:	58000100 	0x58000100
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	74656766 	jalx	1959d98 <data_size+0x1959684>
   4:	69730073 	0x69730073
   8:	745f657a 	jalx	17d95e8 <data_size+0x17d8ed4>
   c:	6e6f6c00 	0x6e6f6c00
  10:	6e752067 	0x6e752067
  14:	6e676973 	0x6e676973
  18:	69206465 	0x69206465
  1c:	6e00746e 	0x6e00746e
  20:	626d656d 	0x626d656d
  24:	706f6600 	0x706f6600
  28:	73006e65 	0x73006e65
  2c:	6f696474 	0x6f696474
  30:	7300632e 	0x7300632e
  34:	61657274 	0x61657274
  38:	6966006d 	0x6966006d
  3c:	0073656c 	0x73656c
  40:	61746f74 	0x61746f74
  44:	4946006c 	0x4946006c
  48:	7300454c 	0x7300454c
  4c:	00657a69 	0x657a69
  50:	63746567 	0x63746567
  54:	554e4700 	0x554e4700
  58:	34204320 	ori	zero,at,0x4320
  5c:	302e332e 	andi	t6,at,0x332e
  60:	00672d20 	0x672d20
  64:	6d6f682f 	0x6d6f682f
  68:	6e612f65 	0x6e612f65
  6c:	442f7964 	0x442f7964
  70:	446b7369 	0x446b7369
  74:	726f572f 	0x726f572f
  78:	6170536b 	0x6170536b
  7c:	5f736563 	0x5f736563
  80:	2f6e694c 	sltiu	t6,k1,26956
  84:	61766956 	0x61766956
  88:	6f576f64 	0x6f576f64
  8c:	70736b72 	0x70736b72
  90:	2f656361 	sltiu	a1,k1,25441
  94:	7363736e 	0x7363736e
  98:	702d6363 	0x702d6363
  9c:	2d667265 	sltiu	a2,t3,29285
  a0:	636e7566 	0x636e7566
  a4:	6265642d 	0x6265642d
  a8:	6c2f6775 	0x6c2f6775
  ac:	66006269 	0x66006269
  b0:	64616572 	0x64616572
  b4:	6c636600 	0x6c636600
  b8:	0065736f 	0x65736f
  bc:	69616761 	0x69616761
  c0:	7270006e 	0x7270006e
  c4:	66746e69 	0x66746e69
  c8:	7000632e 	0x7000632e
  cc:	746e6972 	jalx	1b9a5c8 <data_size+0x1b99eb4>
  d0:	67740066 	0x67740066
  d4:	75705f74 	jalx	5c17dd0 <data_size+0x5c176bc>
  d8:	61686374 	0x61686374
  dc:	75700072 	jalx	5c001c8 <data_size+0x5bffab4>
  e0:	61686374 	0x61686374
  e4:	00632e72 	0x632e72
  e8:	73747570 	0x73747570
  ec:	7000632e 	0x7000632e
  f0:	00737475 	0x737475
  f4:	73747570 	0x73747570
  f8:	6e697274 	0x6e697274
  fc:	72700067 	0x72700067
 100:	62746e69 	0x62746e69
 104:	2e657361 	sltiu	a1,s3,29537
 108:	61760063 	0x61760063
 10c:	0065756c 	0x65756c
 110:	676e6f6c 	0x676e6f6c
 114:	746e6920 	jalx	1b9a480 <data_size+0x1b99d6c>
 118:	67697300 	0x67697300
 11c:	7270006e 	0x7270006e
 120:	62746e69 	0x62746e69
 124:	00657361 	0x657361
 128:	63727473 	0x63727473
 12c:	73007970 	0x73007970
 130:	69667274 	0x69667274
 134:	7300646e 	0x7300646e
 138:	68637274 	0x68637274
 13c:	74730072 	jalx	1cc01c8 <data_size+0x1cbfab4>
 140:	676e6972 	0x676e6972
 144:	6d00632e 	0x6d00632e
 148:	6d636d65 	0x6d636d65
 14c:	74730070 	jalx	1cc01c0 <data_size+0x1cbfaac>
 150:	70636e72 	0x70636e72
 154:	74730079 	jalx	1cc01e4 <data_size+0x1cbfad0>
 158:	656c6e72 	0x656c6e72
 15c:	656d006e 	0x656d006e
 160:	7970636d 	0x7970636d
 164:	72747300 	0x72747300
 168:	706d636e 	0x706d636e
 16c:	72747300 	0x72747300
 170:	006e656c 	0x6e656c
 174:	6d6d656d 	0x6d6d656d
 178:	0065766f 	0x65766f
 17c:	72657a62 	0x72657a62
 180:	656d006f 	0x656d006f
 184:	7465736d 	jalx	195cdb4 <data_size+0x195c6a0>
 188:	74656700 	jalx	1959c00 <data_size+0x19594ec>
 18c:	756f635f 	jalx	5bd8d7c <data_size+0x5bd8668>
 190:	6d5f746e 	0x6d5f746e
 194:	675f0079 	0x675f0079
 198:	635f7465 	0x635f7465
 19c:	746e756f 	jalx	1b9d5bc <data_size+0x1b9cea8>
 1a0:	6d697400 	0x6d697400
 1a4:	65707365 	0x65707365
 1a8:	635f0063 	0x635f0063
 1ac:	6b636f6c 	0x6b636f6c
 1b0:	7400745f 	jalx	1d17c <data_size+0x1ca68>
 1b4:	736d5f76 	0x736d5f76
 1b8:	67006365 	0x67006365
 1bc:	6e5f7465 	0x6e5f7465
 1c0:	69740073 	0x69740073
 1c4:	632e656d 	0x632e656d
 1c8:	74656700 	jalx	1959c00 <data_size+0x19594ec>
 1cc:	0073755f 	0x73755f
 1d0:	6e5f7674 	0x6e5f7674
 1d4:	00636573 	0x636573
 1d8:	5f746567 	0x5f746567
 1dc:	636f6c63 	0x636f6c63
 1e0:	7674006b 	jalx	9d001ac <data_size+0x9cffa98>
 1e4:	6573755f 	0x6573755f
 1e8:	76740063 	jalx	9d0018c <data_size+0x9cffa78>
 1ec:	6365735f 	0x6365735f
 1f0:	6f6c6300 	0x6f6c6300
 1f4:	675f6b63 	0x675f6b63
 1f8:	69747465 	0x69747465
 1fc:	Address 0x00000000000001fc is out of bounds.


Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	00000084 	0x84
   4:	00000094 	0x94
   8:	000000a0 	0xa0
   c:	000000a4 	0xa4
	...
  18:	000000b0 	0xb0
  1c:	000000b8 	0xb8
  20:	000000ec 	0xec
  24:	000000f0 	0xf0
  28:	000000bc 	0xbc
  2c:	000000c0 	sll	zero,zero,0x3
	...
