; func_ov016_021b5390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov016_021b5390
        .arm
func_ov016_021b5390:
    ldr r1, [r0, #0x1c]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    bx lr
    b .L_228
    b .L_234
    b .L_248
    b .L_25c
.L_228:
    ldr r0, [r0, #0x18]
    add r0, r0, #0x1
    bx lr
.L_234:
    ldr r0, [r0, #0x18]
    cmp r0, #0x3
    addlt r0, r0, #0x4
    movge r0, #0xd
    bx lr
.L_248:
    ldr r0, [r0, #0x18]
    cmp r0, #0x3
    addlt r0, r0, #0x7
    movge r0, #0xc
    bx lr
.L_25c:
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    beq .L_27c
    cmp r1, #0x1
    beq .L_284
    cmp r1, #0x2
    moveq r0, #0xb
    bx lr
.L_27c:
    mov r0, #0x0
    bx lr
.L_284:
    mov r0, #0xa
    bx lr
