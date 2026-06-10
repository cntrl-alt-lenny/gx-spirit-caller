; func_ov002_022a6bdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022a6bdc
        .arm
func_ov002_022a6bdc:
    add r1, r0, #0x500
    ldrh r1, [r1, #0x90]
    mov r1, r1, lsl #0x11
    movs r1, r1, lsr #0x1f
    beq .L_1a4c
    ldr r1, [r0, #0x578]
    tst r1, #0x4
    bne .L_1a4c
    cmp r1, #0x0
    movne r0, #0x0
    bxne lr
    ldr r0, [r0, #0x580]
    and r0, r0, #0x1f
    subs r0, r0, #0x8
    rsbmi r0, r0, #0x0
    mov r0, r0, lsl #0x5
    cmp r0, #0x100
    movge r0, #0x100
    rsb r0, r0, #0x100
    bx lr
.L_1a4c:
    mvn r0, #0x0
    bx lr
