; func_ov004_021d49b4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220e500
        .extern data_ov004_022915e8
        .extern func_0203268c
        .extern func_02033488
        .extern func_ov004_021c9d60
        .extern func_ov004_021d8798
        .global func_ov004_021d49b4
        .arm
func_ov004_021d49b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_40
    mov r0, #0x0
    mov r1, #0x15
    bl func_ov004_021c9d60
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_ov004_021d8798
.L_40:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xccc]
    bl func_0203268c
    bl func_02033488
    mov r0, #0x22
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_022915e8
_LIT1: .word data_ov004_0220e500
