; func_ov006_021b6cac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b6cac
        .arm
func_ov006_021b6cac:
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_114
    b .L_b0
    b .L_bc
    b .L_d4
    b .L_e8
    b .L_100
.L_b0:
    add r0, r0, #0x198
    add r0, r0, #0x9800
    b .L_114
.L_bc:
    cmp r3, #0x0
    addne r0, r0, #0x158
    addne r0, r0, #0xb400
    addeq r0, r0, #0x358
    addeq r0, r0, #0xb000
    b .L_114
.L_d4:
    cmp r3, #0x0
    addne r0, r0, #0x358
    addeq r0, r0, #0x158
    add r0, r0, #0xb800
    b .L_114
.L_e8:
    cmp r3, #0x0
    addne r0, r0, #0x158
    addne r0, r0, #0xc000
    addeq r0, r0, #0x358
    addeq r0, r0, #0xbc00
    b .L_114
.L_100:
    cmp r3, #0x0
    addne r0, r0, #0x158
    addne r0, r0, #0xc400
    addeq r0, r0, #0x58
    addeq r0, r0, #0xc400
.L_114:
    add r0, r0, r2, lsl #0x2
    ldrb r0, [r0, #0x2]
    bx lr
