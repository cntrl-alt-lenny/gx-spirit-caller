; func_ov002_0229d044 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0229d044
        .arm
func_ov002_0229d044:
    mov r3, #0x0
.L_a8:
    ldr r1, [r0, r3, lsl #0x2]
    cmp r1, #0x0
    beq .L_c4
    add r2, r0, r3, lsl #0x2
    ldr r1, [r2, #0xd4]
    add r1, r1, #0x1
    str r1, [r2, #0xd4]
.L_c4:
    add r3, r3, #0x1
    cmp r3, #0x35
    blt .L_a8
    bx lr
