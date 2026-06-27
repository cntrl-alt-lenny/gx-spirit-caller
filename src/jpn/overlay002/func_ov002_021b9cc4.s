; func_ov002_021b9cc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b9cc4
        .arm
func_ov002_021b9cc4:
    ldrh r3, [r0]
    ldr r2, _LIT0
    cmp r3, r2
    bne .L_24
    ldrh r0, [r0, #0x4]
    ldr r2, [r1]
    cmp r2, r0
    movge r2, r0
    str r2, [r1]
.L_24:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001130
