; func_ov011_021d20e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov011_021d20e8
        .arm
func_ov011_021d20e8:
    ldr ip, [r0, #0xc]
    ldr r3, [r0]
    mov r0, ip, lsr #0x10
    mla r1, r0, r2, r1
    ldr r0, [r3, r1, lsl #0x2]
    mov r1, ip, lsl #0x10
    mov r0, r0, lsl #0x1c
    mov r1, r1, lsr #0x10
    mov r0, r0, lsr #0x1c
    mov r0, r1, lsr r0
    and r0, r0, #0x1
    bx lr
