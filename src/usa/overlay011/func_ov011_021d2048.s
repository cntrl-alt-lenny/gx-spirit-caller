; func_ov011_021d2048 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov011_021d2048
        .arm
func_ov011_021d2048:
    mov r2, #0x10000
    ldr r3, [r0, #0xc]
    rsb r2, r2, #0x0
    and r2, r3, r2
    mov r1, r1, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0xc]
    bx lr
