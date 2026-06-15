; func_ov004_021d43a0 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_022915e8
        .extern func_0202c0c0
        .extern func_ov004_021d8798
        .global func_ov004_021d43a0
        .arm
func_ov004_021d43a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_160
    ldr r0, _LIT0
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x2
    bl func_ov004_021d8798
.L_160:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, #0x7
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000669
_LIT1: .word data_ov004_022915e8
