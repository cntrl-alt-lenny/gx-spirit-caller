; func_ov006_021b6e3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b6e3c
        .arm
func_ov006_021b6e3c:
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1a4
    b .L_140
    b .L_14c
    b .L_164
    b .L_178
    b .L_190
.L_140:
    add ip, r0, #0x198
    add ip, ip, #0x9800
    b .L_1a4
.L_14c:
    cmp r3, #0x0
    addne ip, r0, #0x158
    addne ip, ip, #0xb400
    addeq ip, r0, #0x358
    addeq ip, ip, #0xb000
    b .L_1a4
.L_164:
    cmp r3, #0x0
    addne ip, r0, #0x358
    addeq ip, r0, #0x158
    add ip, ip, #0xb800
    b .L_1a4
.L_178:
    cmp r3, #0x0
    addne ip, r0, #0x158
    addne ip, ip, #0xc000
    addeq ip, r0, #0x358
    addeq ip, ip, #0xbc00
    b .L_1a4
.L_190:
    cmp r3, #0x0
    addne ip, r0, #0x158
    addne ip, ip, #0xc400
    addeq ip, r0, #0x58
    addeq ip, ip, #0xc400
.L_1a4:
    cmp r3, #0x0
    cmpne r1, #0x0
    addeq r0, r0, r1, lsl #0x1
    addeq r0, r0, #0xc600
    ldreqh r3, [r0, #0x62]
    beq .L_1c8
    add r0, r0, r1, lsl #0x1
    add r0, r0, #0xc600
    ldrh r3, [r0, #0x6c]
.L_1c8:
    cmp r3, #0x0
    mov r0, #0x0
    ble .L_1f0
.L_1d4:
    ldrh r1, [ip]
    cmp r1, r2
    beq .L_1f0
    add r0, r0, #0x1
    cmp r0, r3
    add ip, ip, #0x4
    blt .L_1d4
.L_1f0:
    cmp r0, r3
    movge r0, #0x0
    bx lr
