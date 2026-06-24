; func_0200a3f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02106730
        .global func_0200a3f0
        .arm
func_0200a3f0:
    mov r0, #0x0
    ldr r2, _LIT0
    mov r3, r0
.L_60:
    ldrh r1, [r2]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_84
    ldrh r1, [r2, #0x4]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    moveq r0, #0x1
    bxeq lr
.L_84:
    add r3, r3, #0x1
    cmp r3, #0x50
    add r2, r2, #0x6
    blt .L_60
    bx lr
_LIT0: .word data_02106730
