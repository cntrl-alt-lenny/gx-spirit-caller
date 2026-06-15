; func_0207ec28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207ec28
        .arm
func_0207ec28:
    ldrh r3, [r0, #0x6]
    ldrh r2, [r0, #0x8]
    mov ip, #0x0
    add r1, r3, #0x1
    cmp r2, r1
    bgt .L_168
    ldrh r0, [r0, #0x4]
    cmp r0, r3
    movls ip, #0x1
.L_168:
    cmp ip, #0x0
    subne r0, r3, r2
    addne r0, r0, #0x1
    movne r0, r0, lsl #0x10
    movne r0, r0, lsr #0x10
    moveq r0, #0x0
    bx lr
