; func_ov002_02223d78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021d6c98
        .extern func_ov002_021d8840
        .global func_ov002_02223d78
        .arm
func_ov002_02223d78:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_3c
    cmp r1, #0x80
    bne .L_58
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021d6c98
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_3c:
    ldrh r0, [r0, #0x2]
    mov r1, #0x1f
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8840
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_58:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
