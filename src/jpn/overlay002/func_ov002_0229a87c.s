; func_ov002_0229a87c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3d68
        .extern data_02103cc0
        .extern data_02103fcc
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d0e9c
        .extern data_ov002_022d0eb8
        .extern data_ov002_022d0f34
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1320
        .extern data_ov002_022d1330
        .extern data_ov002_022d1968
        .extern data_ov002_022d19bc
        .extern data_ov002_022d1a04
        .extern data_ov002_022d1a18
        .extern data_ov002_022d1a84
        .extern data_ov002_022d1a9c
        .extern data_ov002_022d281c
        .extern func_02005688
        .extern func_02005f10
        .extern func_0200dda8
        .extern func_0200e9a8
        .extern func_020210c8
        .extern func_02021104
        .extern func_02037ae4
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_ov002_021b0950
        .extern func_ov002_0229a38c
        .extern func_ov002_0229d044
        .extern func_ov002_022a204c
        .extern func_ov002_022a2e48
        .extern func_ov002_022a5848
        .extern func_ov002_022a58b0
        .extern func_ov002_022a85b0
        .extern func_ov002_022a8b54
        .extern func_ov002_022a8b6c
        .extern func_ov002_022ab2a4
        .extern func_ov002_022ab2a8
        .extern func_ov002_022aebe4
        .extern func_ov002_022af1c8
        .extern func_ov002_022b005c
        .extern func_ov002_022b0198
        .extern func_ov002_022b3808
        .extern func_ov002_022b4f94
        .extern func_ov002_022b52b4
        .extern func_ov002_022b52fc
        .extern func_ov002_022b584c
        .extern func_ov002_022b7f88
        .extern func_ov002_022bda34
        .extern func_ov002_022bda74
        .global func_ov002_0229a87c
        .arm
func_ov002_0229a87c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bl func_ov002_0229a38c
    mov sl, #0x0
    ldr r8, _LIT0
    ldr r7, _LIT1
    ldr r6, _LIT2
    ldr fp, _LIT3
    ldr r5, _LIT4
    ldr r4, _LIT5
    b .L_c4
.L_28:
    cmp sl, #0x0
    ble .L_44
    bl func_02005688
    bl func_02005f10
    ldr r0, [r5, #0x38]
    add r0, r0, #0x1
    str r0, [r5, #0x38]
.L_44:
    ldr r0, [r4, #0xd4]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0xd4]
    mov r0, r8
    bl func_ov002_0229d044
    mov r0, r7
    bl func_ov002_022a5848
    mov r0, r6
    bl func_ov002_022a204c
    mov r0, fp
    bl func_ov002_022b005c
    ldr r0, _LIT6
    bl func_ov002_022a85b0
    ldr r0, _LIT7
    bl func_ov002_022aebe4
    ldr r0, _LIT8
    bl func_ov002_022ab2a4
    ldr r0, _LIT9
    bl func_ov002_022b3808
    ldr r0, _LIT10
    bl func_ov002_022b52b4
    ldr r0, _LIT11
    bl func_ov002_022b584c
    ldr r0, _LIT12
    bl func_ov002_022bda34
    bl func_020210c8
    bl func_0200dda8
    bl func_ov002_021b0950
    movs r9, r0
    bne .L_d8
    add sl, sl, #0x1
.L_c4:
    ldr r0, [r5, #0x30]
    cmp r0, #0x4
    movge r0, #0x4
    cmp sl, r0
    ble .L_28
.L_d8:
    ldr r0, _LIT6
    bl func_ov002_022a8b54
    ldr r0, _LIT1
    bl func_ov002_022a58b0
    ldr r0, _LIT2
    bl func_ov002_022a2e48
    ldr r0, _LIT7
    bl func_ov002_022af1c8
    ldr r0, _LIT6
    bl func_ov002_022a8b6c
    ldr r0, _LIT3
    bl func_ov002_022b0198
    ldr r0, _LIT8
    bl func_ov002_022ab2a8
    ldr r0, _LIT9
    bl func_ov002_022b4f94
    ldr r0, _LIT10
    bl func_ov002_022b52fc
    ldr r0, _LIT11
    bl func_ov002_022b7f88
    ldr r0, _LIT12
    bl func_ov002_022bda74
    bl func_02021104
    bl func_0200e9a8
    ldr r0, _LIT13
    bl func_0207ecac
    ldr r0, _LIT14
    bl func_0207ecac
    ldr r0, _LIT13
    bl func_0207eb80
    ldr r0, _LIT14
    bl func_0207eb80
    cmp r9, #0x0
    ldr r1, _LIT15
    ldr r0, _LIT16
    ldr r2, [r1]
    ldr r1, [r0]
    ldr r0, _LIT17
    orr r1, r1, r2, lsl #0x1
    str r1, [r0]
    beq .L_190
    bl func_02037ae4
    cmp r0, #0x2a
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_190:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0f34
_LIT1: .word data_ov002_022d1320
_LIT2: .word data_ov002_022d10dc
_LIT3: .word data_ov002_022d1a04
_LIT4: .word data_02103fcc
_LIT5: .word data_ov002_022d0e4c
_LIT6: .word data_ov002_022d1330
_LIT7: .word data_ov002_022d19bc
_LIT8: .word data_ov002_022d1968
_LIT9: .word data_ov002_022d1a18
_LIT10: .word data_ov002_022d1a84
_LIT11: .word data_ov002_022d1a9c
_LIT12: .word data_ov002_022d281c
_LIT13: .word data_ov002_022d0e9c
_LIT14: .word data_ov002_022d0eb8
_LIT15: .word data_020c3d68
_LIT16: .word data_02103cc0
_LIT17: .word 0x04000540
