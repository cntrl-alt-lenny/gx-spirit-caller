; func_0203ed30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203ed30
        .arm
func_0203ed30:
    ldrb r1, [r0]
    ldrb r2, [r0, #0x1]
    mov r3, #0x0
    orr r3, r3, r1, lsl #0x18
    ldrb r1, [r0, #0x2]
    orr r2, r3, r2, lsl #0x10
    ldrb r0, [r0, #0x3]
    orr r1, r2, r1, lsl #0x8
    orr r3, r1, r0
    mov r1, r3, lsr #0x18
    mov r0, r3, lsr #0x8
    mov r2, r3, lsl #0x8
    mov r3, r3, lsl #0x18
    and r1, r1, #0xff
    and r0, r0, #0xff00
    and r2, r2, #0xff0000
    orr r0, r1, r0
    and r1, r3, #-16777216
    orr r0, r2, r0
    orr r0, r1, r0
    bx lr
