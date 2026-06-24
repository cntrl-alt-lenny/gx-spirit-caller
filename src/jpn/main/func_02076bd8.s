; func_02076bd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02076bd8
        .arm
func_02076bd8:
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    mov r4, #0x0
    ble .L_ac
.L_74:
    ldrb lr, [r0]
    ldrb ip, [r0, #0x1]
    cmp r2, #0x3
    add lr, ip, lr, lsl #0x8
    ldreqb ip, [r0, #0x2]
    addeq lr, ip, lr, lsl #0x8
    cmp lr, r3
    moveq r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r4, r4, #0x1
    cmp r4, r1
    add r0, r0, r2
    blt .L_74
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
