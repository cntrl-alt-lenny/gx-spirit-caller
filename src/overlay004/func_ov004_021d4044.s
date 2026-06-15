; func_ov004_021d4044 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_022915e8
        .extern func_ov004_021c9d60
        .extern func_ov004_021d8798
        .global func_ov004_021d4044
        .arm
func_ov004_021d4044:
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
    mov r1, #0xd
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
    mov r0, #0x1
    str r0, [r4, #0x30]
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_022915e8
