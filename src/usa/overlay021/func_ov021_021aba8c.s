; func_ov021_021aba8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov021_021aba8c
        .arm
func_ov021_021aba8c:
    str r1, [r0, #0x198]
    cmp r1, #0x0
    mov r2, #0x4000000
    beq .L_a58
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_a78
.L_a58:
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_a78:
    mov r0, #0x1
    bx lr
