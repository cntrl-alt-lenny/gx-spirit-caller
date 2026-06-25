; func_ov002_0220b0ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0220b0ec
        .arm
func_ov002_0220b0ec:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0x3f8
    add r0, r0, #0xfc00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
