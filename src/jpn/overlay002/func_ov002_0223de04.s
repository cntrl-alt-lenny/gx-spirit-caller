; func_ov002_0223de04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce640
        .global func_ov002_0223de04
        .arm
func_ov002_0223de04:
    cmp r1, #0x5
    addlt r0, r0, #0x8
    addlt r0, r0, r1, lsl #0x1
    blt .L_30
    ldrh r0, [r0, #0x12]
    ldr r2, _LIT0
    add r0, r0, r1
    sub r0, r0, #0x5
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x19
    add r0, r1, r0, ror #0x19
    add r0, r2, r0, lsl #0x1
.L_30:
    ldrh r0, [r0]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x17
    bx lr
_LIT0: .word data_ov002_022ce640
