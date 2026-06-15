; func_ov004_021d44cc - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_ov004_021c9d60
        .extern func_ov004_021d8798
        .global func_ov004_021d44cc
        .arm
func_ov004_021d44cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_29c
    ldr r2, _LIT0
    mov r3, #0x1
    mov r0, #0x0
    mov r1, #0xe
    str r3, [r2, #0x48]
    bl func_ov004_021c9d60
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x4
    bl func_ov004_021d8798
.L_29c:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x8]
    rsbs r0, r0, #0x1
    beq .L_2e4
    mov r0, #0x9
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_2e4:
    mov r0, #0x29
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
