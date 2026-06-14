; func_ov006_021b805c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02094688
        .global func_ov006_021b805c
        .arm
func_ov006_021b805c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    add r1, r4, #0x124
    mov r0, #0x0
    mov r2, #0x124
    bl Fill32
    add r1, r4, #0x25
    add r0, r4, #0x1
    add r1, r1, #0x100
    mov r2, #0x19
    bl func_02094688
    ldrb r1, [r4]
    mov ip, #0x0
    add r0, r4, #0x8100
    strb r1, [r4, #0x124]
    ldrh r3, [r0, #0x62]
    mov lr, ip
    cmp r3, #0x0
    ble .L_3fc
    add r0, r4, #0xa60
    add r6, r0, #0x7000
    mov r2, ip
.L_3b8:
    ldrb r0, [r6, #0x2]
    mov r5, r2
    cmp r0, #0x0
    ble .L_3ec
.L_3c8:
    ldrh r1, [r6]
    add r0, r4, ip, lsl #0x1
    add r0, r0, #0x100
    strh r1, [r0, #0x4c]
    ldrb r0, [r6, #0x2]
    add r5, r5, #0x1
    add ip, ip, #0x1
    cmp r5, r0
    blt .L_3c8
.L_3ec:
    add lr, lr, #0x1
    cmp lr, r3
    add r6, r6, #0x4
    blt .L_3b8
.L_3fc:
    str ip, [r4, #0x140]
    add r0, r4, #0x8100
    ldrh r3, [r0, #0x64]
    mov r5, #0x0
    mov r6, r5
    cmp r3, #0x0
    ble .L_468
    add r0, r4, #0xc60
    add ip, r0, #0x7000
    mov r2, r5
.L_424:
    ldrb r0, [ip, #0x2]
    mov lr, r2
    cmp r0, #0x0
    ble .L_458
.L_434:
    ldrh r1, [ip]
    add r0, r4, r5, lsl #0x1
    add r0, r0, #0x100
    strh r1, [r0, #0xec]
    ldrb r0, [ip, #0x2]
    add lr, lr, #0x1
    add r5, r5, #0x1
    cmp lr, r0
    blt .L_434
.L_458:
    add r6, r6, #0x1
    cmp r6, r3
    add ip, ip, #0x4
    blt .L_424
.L_468:
    str r5, [r4, #0x144]
    add r0, r4, #0x8100
    ldrh r3, [r0, #0x66]
    mov r5, #0x0
    mov r6, r5
    cmp r3, #0x0
    ble .L_4d4
    add r0, r4, #0xe60
    add ip, r0, #0x7000
    mov r2, r5
.L_490:
    ldrb r0, [ip, #0x2]
    mov lr, r2
    cmp r0, #0x0
    ble .L_4c4
.L_4a0:
    ldrh r1, [ip]
    add r0, r4, r5, lsl #0x1
    add r0, r0, #0x200
    strh r1, [r0, #0xa]
    ldrb r0, [ip, #0x2]
    add lr, lr, #0x1
    add r5, r5, #0x1
    cmp lr, r0
    blt .L_4a0
.L_4c4:
    add r6, r6, #0x1
    cmp r6, r3
    add ip, ip, #0x4
    blt .L_490
.L_4d4:
    str r5, [r4, #0x148]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
