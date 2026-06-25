; func_ov002_0223d9e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0223d9e0
        .arm
func_ov002_0223d9e0:
    ldrh r3, [r0, #0x6]
    mov r2, r3, lsl #0x10
    mov ip, r2, lsr #0x18
    add r2, ip, #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0xff00
    mov r2, r2, lsl #0x18
    orr r2, r3, r2, lsr #0x10
    strh r2, [r0, #0x6]
    add r0, r0, ip, lsl #0x1
    strh r1, [r0, #0x8]
    bx lr
