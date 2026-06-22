; func_02064430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02064430
        .arm
func_02064430:
    ldrb r2, [r0, r1]
    add r1, r1, #0x1
    ldrb r1, [r0, r1]
    mov r0, r2, lsl #0x8
    and r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    bx lr
