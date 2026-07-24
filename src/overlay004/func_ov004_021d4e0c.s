; func_ov004_021d4e0c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_0210594c
        .extern data_ov004_02209ec0
        .extern data_ov004_02209f88
        .extern data_ov004_0220a010
        .extern data_ov004_0220a01c
        .extern data_ov004_0220a028
        .extern data_ov004_0220a034
        .extern data_ov004_0220a040
        .extern data_ov004_0220a054
        .extern data_ov004_0220a068
        .extern data_ov004_0220a07c
        .extern data_ov004_0220a094
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern data_ov004_022915e8
        .extern func_0202c0c0
        .extern func_0203268c
        .extern func_02033718
        .extern func_02033828
        .extern func_02033d3c
        .extern func_02033d78
        .extern OS_SPrintf
        .extern func_020aaf10
        .extern func_ov004_021cded0
        .extern func_ov004_021d3f44
        .extern func_ov004_021d8798
        .global func_ov004_021d4e0c
        .arm
func_ov004_021d4e0c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    mov r5, r0
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r5, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_e4
    ldr r0, _LIT0
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x3
    bl func_ov004_021d8798
    mov r0, #0x0
    bl func_ov004_021cded0
    bl func_0203268c
    ldr r2, _LIT2
    mov r1, #0x2
    bl func_02033828
    add r0, r5, #0x27c
    ldr r1, _LIT3
    ldr r2, _LIT4
    ldr r2, [r2, #0xc94]
    add r2, r2, #0x3e8
    bl func_02033d3c
    add r0, r5, #0x2a4
    ldr r1, _LIT5
    ldr r2, _LIT6
    ldr r2, [r2, #0x34]
    bl func_02033d3c
    add r0, r5, #0x2cc
    ldr r1, _LIT7
    ldr r3, _LIT4
    mov r2, #0x3e8
    ldr r4, [r3, #0xc9c]
    ldr r3, _LIT8
    ldrh r3, [r3, #0x58]
    mla r2, r4, r2, r3
    bl func_02033d3c
    add r0, r5, #0x2f4
    ldr r1, _LIT9
    ldr r2, _LIT4
    ldr r2, [r2, #0xcc8]
    bl func_02033d3c
    add r0, r5, #0x31c
    ldr r1, _LIT10
    ldr r2, _LIT4
    ldr r2, [r2, #0xc98]
    bl func_02033d3c
    add r0, r5, #0x27c
    mov r1, #0x5
    bl func_02033d78
    mov r0, #0x0
    str r0, [r5, #0x258]
.L_e4:
    ldr r0, [r5, #0x258]
    cmp r0, #0x0
    bne .L_1a0
    ldr r1, _LIT4
    add r0, sp, #0x0
    ldr r2, [r1, #0xc94]
    ldr r1, _LIT11
    add r2, r2, #0x3e8
    ldr r4, _LIT12
    bl OS_SPrintf
    ldr r0, _LIT4
    ldr r0, [r0, #0xc98]
    cmp r0, #0x0
    add r0, sp, #0x0
    bne .L_144
    ldr r1, _LIT13
    bl func_020aaf10
    ldr r0, _LIT6
    ldr r1, _LIT14
    ldr r2, [r0, #0x34]
    add r0, sp, #0x0
    ldr r1, [r1, r2, lsl #0x2]
    bl func_020aaf10
    b .L_170
.L_144:
    ldr r1, _LIT15
    bl func_020aaf10
    ldr r0, _LIT6
    ldr r1, _LIT14
    ldr r2, [r0, #0x34]
    add r0, sp, #0x0
    ldr r1, [r1, r2, lsl #0x2]
    bl func_020aaf10
    ldr r1, _LIT16
    add r0, sp, #0x0
    bl func_020aaf10
.L_170:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xca0]
    cmp r0, #0x0
    bne .L_18c
    ldr r1, _LIT17
    add r0, sp, #0x0
    bl func_020aaf10
.L_18c:
    bl func_0203268c
    add r2, sp, #0x0
    mov r1, #0x2
    bl func_02033718
    str r0, [r5, #0x258]
.L_1a0:
    mov r0, r5
    bl func_ov004_021d3f44
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000066c
_LIT1: .word data_ov004_022915e8
_LIT2: .word 0x00007530
_LIT3: .word data_ov004_0220a010
_LIT4: .word data_ov004_0220e500
_LIT5: .word data_ov004_0220a01c
_LIT6: .word data_021040ac
_LIT7: .word data_ov004_02209f88
_LIT8: .word data_0210594c
_LIT9: .word data_ov004_0220a028
_LIT10: .word data_ov004_0220a034
_LIT11: .word data_ov004_0220a040
_LIT12: .word data_ov004_0220b500
_LIT13: .word data_ov004_0220a054
_LIT14: .word data_ov004_02209ec0
_LIT15: .word data_ov004_0220a068
_LIT16: .word data_ov004_0220a07c
_LIT17: .word data_ov004_0220a094
