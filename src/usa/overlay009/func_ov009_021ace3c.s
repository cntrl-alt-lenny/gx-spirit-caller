; func_ov009_021ace3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov009_021ace3c
        .arm
func_ov009_021ace3c:
    ldr r1, [r0, #0x3c]
    cmp r1, #0x0
    movne r0, #0xff
    bxne lr
    ldr r2, [r0, #0x38]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_16d8
    b .L_1698
    b .L_167c
    b .L_165c
    b .L_163c
.L_163c:
    ldr r1, [r0, #0x34]
    cmp r1, #0x0
    movle r0, #0xfe
    bxle lr
    rsb r0, r2, #0x3
    add r0, r0, r0, lsl #0x1
    add r0, r1, r0
    bx lr
.L_165c:
    ldr r1, [r0, #0x34]
    cmp r1, #0x0
    movle r0, #0xfd
    bxle lr
    rsb r0, r2, #0x3
    add r0, r0, r0, lsl #0x1
    add r0, r1, r0
    bx lr
.L_167c:
    ldr r1, [r0, #0x34]
    cmp r1, #0x0
    moveq r0, #0xfc
    rsbne r0, r2, #0x3
    addne r0, r0, r0, lsl #0x1
    addne r0, r1, r0
    bx lr
.L_1698:
    ldr r1, [r0, #0x34]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_16d8
    b .L_16b8
    b .L_16c0
    b .L_16c8
    b .L_16d0
.L_16b8:
    mov r0, #0xfc
    bx lr
.L_16c0:
    mov r0, #0x0
    bx lr
.L_16c8:
    mov r0, #0xfa
    bx lr
.L_16d0:
    mov r0, #0xfb
    bx lr
.L_16d8:
    mov r1, #0x1
    str r1, [r0, #0x3c]
    mov r0, #0xff
    bx lr
