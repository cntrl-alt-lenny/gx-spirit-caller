; func_0202f430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f430
        .arm
func_0202f430:
    sub r0, r0, #0xa70
    sub r0, r0, #0x1000
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_34
    b .L_2c
    b .L_2c
    b .L_2c
    b .L_2c
    b .L_2c
    b .L_2c
.L_2c:
    mov r0, #0x1
    bx lr
.L_34:
    mov r0, #0x0
    bx lr
