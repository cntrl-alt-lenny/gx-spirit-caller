; func_ov004_021d40bc - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov004_02209f94
        .extern data_ov004_022915e8
        .extern func_02001d68
        .extern func_0203268c
        .extern func_0203320c
        .extern func_ov004_021d8798
        .global func_ov004_021d40bc
        .arm
func_ov004_021d40bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_d8
    ldr r0, _LIT0
    ldr r0, [r0, #0x34]
    cmp r0, #0x1
    bne .L_d8
    mov r0, #0x1
    bl func_02001d68
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, #0x12
    bl func_ov004_021d8798
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
.L_d8:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_0203268c
    bl func_0203320c
    cmp r0, #0x1
    bne .L_120
    mov r0, #0x3
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_120:
    mov r0, #0x2
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov004_022915e8
_LIT2: .word data_ov004_02209f94
_LIT3: .word data_02104f4c
