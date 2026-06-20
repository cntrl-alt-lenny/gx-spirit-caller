; func_ov002_0229a98c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3e48
        .extern data_02103da0
        .extern data_021040ac
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d0f7c
        .extern data_ov002_022d0f98
        .extern data_ov002_022d1014
        .extern data_ov002_022d11bc
        .extern data_ov002_022d1400
        .extern data_ov002_022d1410
        .extern data_ov002_022d1a48
        .extern data_ov002_022d1a9c
        .extern data_ov002_022d1ae4
        .extern data_ov002_022d1af8
        .extern data_ov002_022d1b64
        .extern data_ov002_022d1b7c
        .extern data_ov002_022d28fc
        .extern func_020056a4
        .extern func_02005f2c
        .extern func_0200ddc4
        .extern func_0200e9c4
        .extern func_0202111c
        .extern func_02021158
        .extern func_02037b34
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_ov002_021b0a30
        .extern func_ov002_0229a49c
        .extern func_ov002_0229d154
        .extern func_ov002_022a215c
        .extern func_ov002_022a2f58
        .extern func_ov002_022a5984
        .extern func_ov002_022a59ec
        .extern func_ov002_022a86ec
        .extern func_ov002_022a8c90
        .extern func_ov002_022a8ca8
        .extern func_ov002_022ab3e0
        .extern func_ov002_022ab3e4
        .extern func_ov002_022aed20
        .extern func_ov002_022af304
        .extern func_ov002_022b0198
        .extern func_ov002_022b02d4
        .extern func_ov002_022b394c
        .extern func_ov002_022b50a4
        .extern func_ov002_022b53c4
        .extern func_ov002_022b540c
        .extern func_ov002_022b595c
        .extern func_ov002_022b8098
        .extern func_ov002_022bdb44
        .extern func_ov002_022bdb84
        .global func_ov002_0229a98c
        .arm
func_ov002_0229a98c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bl func_ov002_0229a49c
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
    bl func_020056a4
    bl func_02005f2c
    ldr r0, [r5, #0x38]
    add r0, r0, #0x1
    str r0, [r5, #0x38]
.L_44:
    ldr r0, [r4, #0xd4]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0xd4]
    mov r0, r8
    bl func_ov002_0229d154
    mov r0, r7
    bl func_ov002_022a5984
    mov r0, r6
    bl func_ov002_022a215c
    mov r0, fp
    bl func_ov002_022b0198
    ldr r0, _LIT6
    bl func_ov002_022a86ec
    ldr r0, _LIT7
    bl func_ov002_022aed20
    ldr r0, _LIT8
    bl func_ov002_022ab3e0
    ldr r0, _LIT9
    bl func_ov002_022b394c
    ldr r0, _LIT10
    bl func_ov002_022b53c4
    ldr r0, _LIT11
    bl func_ov002_022b595c
    ldr r0, _LIT12
    bl func_ov002_022bdb44
    bl func_0202111c
    bl func_0200ddc4
    bl func_ov002_021b0a30
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
    bl func_ov002_022a8c90
    ldr r0, _LIT1
    bl func_ov002_022a59ec
    ldr r0, _LIT2
    bl func_ov002_022a2f58
    ldr r0, _LIT7
    bl func_ov002_022af304
    ldr r0, _LIT6
    bl func_ov002_022a8ca8
    ldr r0, _LIT3
    bl func_ov002_022b02d4
    ldr r0, _LIT8
    bl func_ov002_022ab3e4
    ldr r0, _LIT9
    bl func_ov002_022b50a4
    ldr r0, _LIT10
    bl func_ov002_022b540c
    ldr r0, _LIT11
    bl func_ov002_022b8098
    ldr r0, _LIT12
    bl func_ov002_022bdb84
    bl func_02021158
    bl func_0200e9c4
    ldr r0, _LIT13
    bl func_0207ed94
    ldr r0, _LIT14
    bl func_0207ed94
    ldr r0, _LIT13
    bl func_0207ec68
    ldr r0, _LIT14
    bl func_0207ec68
    cmp r9, #0x0
    ldr r1, _LIT15
    ldr r0, _LIT16
    ldr r2, [r1]
    ldr r1, [r0]
    ldr r0, _LIT17
    orr r1, r1, r2, lsl #0x1
    str r1, [r0]
    beq .L_190
    bl func_02037b34
    cmp r0, #0x2a
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_190:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d1014
_LIT1: .word data_ov002_022d1400
_LIT2: .word data_ov002_022d11bc
_LIT3: .word data_ov002_022d1ae4
_LIT4: .word data_021040ac
_LIT5: .word data_ov002_022d0f2c
_LIT6: .word data_ov002_022d1410
_LIT7: .word data_ov002_022d1a9c
_LIT8: .word data_ov002_022d1a48
_LIT9: .word data_ov002_022d1af8
_LIT10: .word data_ov002_022d1b64
_LIT11: .word data_ov002_022d1b7c
_LIT12: .word data_ov002_022d28fc
_LIT13: .word data_ov002_022d0f7c
_LIT14: .word data_ov002_022d0f98
_LIT15: .word data_020c3e48
_LIT16: .word data_02103da0
_LIT17: .word 0x04000540
