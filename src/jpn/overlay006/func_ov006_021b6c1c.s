; func_ov006_021b6c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b6c1c
        .arm
func_ov006_021b6c1c:
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_84
    b .L_20
    b .L_2c
    b .L_44
    b .L_58
    b .L_70
.L_20:
    add r0, r0, #0x198
    add r1, r0, #0x9800
    b .L_84
.L_2c:
    cmp r3, #0x0
    addne r0, r0, #0x158
    addne r1, r0, #0xb400
    addeq r0, r0, #0x358
    addeq r1, r0, #0xb000
    b .L_84
.L_44:
    cmp r3, #0x0
    addne r0, r0, #0x358
    addeq r0, r0, #0x158
    add r1, r0, #0xb800
    b .L_84
.L_58:
    cmp r3, #0x0
    addne r0, r0, #0x158
    addne r1, r0, #0xc000
    addeq r0, r0, #0x358
    addeq r1, r0, #0xbc00
    b .L_84
.L_70:
    cmp r3, #0x0
    addne r0, r0, #0x158
    addne r1, r0, #0xc400
    addeq r0, r0, #0x58
    addeq r1, r0, #0xc400
.L_84:
    mov r0, r2, lsl #0x2
    ldrh r0, [r1, r0]
    bx lr
