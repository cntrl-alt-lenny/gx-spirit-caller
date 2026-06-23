; func_ov006_021b7f5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02094688
        .global func_ov006_021b7f5c
        .arm
func_ov006_021b7f5c:
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
    ble .L_9c
    add r0, r4, #0xa60
    add r6, r0, #0x7000
    mov r2, ip
.L_58:
    ldrb r0, [r6, #0x2]
    mov r5, r2
    cmp r0, #0x0
    ble .L_8c
.L_68:
    ldrh r1, [r6]
    add r0, r4, ip, lsl #0x1
    add r0, r0, #0x100
    strh r1, [r0, #0x4c]
    ldrb r0, [r6, #0x2]
    add r5, r5, #0x1
    add ip, ip, #0x1
    cmp r5, r0
    blt .L_68
.L_8c:
    add lr, lr, #0x1
    cmp lr, r3
    add r6, r6, #0x4
    blt .L_58
.L_9c:
    str ip, [r4, #0x140]
    add r0, r4, #0x8100
    ldrh r3, [r0, #0x64]
    mov r5, #0x0
    mov r6, r5
    cmp r3, #0x0
    ble .L_108
    add r0, r4, #0xc60
    add ip, r0, #0x7000
    mov r2, r5
.L_c4:
    ldrb r0, [ip, #0x2]
    mov lr, r2
    cmp r0, #0x0
    ble .L_f8
.L_d4:
    ldrh r1, [ip]
    add r0, r4, r5, lsl #0x1
    add r0, r0, #0x100
    strh r1, [r0, #0xec]
    ldrb r0, [ip, #0x2]
    add lr, lr, #0x1
    add r5, r5, #0x1
    cmp lr, r0
    blt .L_d4
.L_f8:
    add r6, r6, #0x1
    cmp r6, r3
    add ip, ip, #0x4
    blt .L_c4
.L_108:
    str r5, [r4, #0x144]
    add r0, r4, #0x8100
    ldrh r3, [r0, #0x66]
    mov r5, #0x0
    mov r6, r5
    cmp r3, #0x0
    ble .L_174
    add r0, r4, #0xe60
    add ip, r0, #0x7000
    mov r2, r5
.L_130:
    ldrb r0, [ip, #0x2]
    mov lr, r2
    cmp r0, #0x0
    ble .L_164
.L_140:
    ldrh r1, [ip]
    add r0, r4, r5, lsl #0x1
    add r0, r0, #0x200
    strh r1, [r0, #0xa]
    ldrb r0, [ip, #0x2]
    add lr, lr, #0x1
    add r5, r5, #0x1
    cmp lr, r0
    blt .L_140
.L_164:
    add r6, r6, #0x1
    cmp r6, r3
    add ip, ip, #0x4
    blt .L_130
.L_174:
    str r5, [r4, #0x148]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
