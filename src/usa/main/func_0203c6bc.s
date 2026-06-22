; func_0203c6bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203c6bc
        .arm
func_0203c6bc:
    cmp r0, #0x0
    beq .L_14
    ldrh r0, [r0, #0xb0]
    tst r0, #0x800
    beq .L_1c
.L_14:
    mov r0, #0x1
    bx lr
.L_1c:
    mov r0, #0x0
    bx lr
