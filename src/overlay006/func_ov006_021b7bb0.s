; func_ov006_021b7bb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a97b8
        .extern func_ov006_021b81dc
        .extern func_ov006_021b831c
        .extern func_ov006_021b8544
        .extern func_ov006_021b8fa8
        .extern func_ov006_021b9010
        .extern func_ov006_021b940c
        .global func_ov006_021b7bb0
        .arm
func_ov006_021b7bb0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r5, r1
    bl func_ov006_021b81dc
    mov r0, r6
    mov r1, r5
    mov r2, #0x1
    bl func_ov006_021b831c
    cmp r5, #0x4
    addls pc, pc, r5, lsl #0x2
    b .L_78
    b .L_40
    b .L_4c
    b .L_58
    b .L_64
    b .L_70
.L_40:
    add r0, r6, #0x198
    add r4, r0, #0x9800
    b .L_78
.L_4c:
    add r0, r6, #0x358
    add r4, r0, #0xb000
    b .L_78
.L_58:
    add r0, r6, #0x158
    add r4, r0, #0xb800
    b .L_78
.L_64:
    add r0, r6, #0x358
    add r4, r0, #0xbc00
    b .L_78
.L_70:
    add r0, r6, #0x58
    add r4, r0, #0xc400
.L_78:
    add r0, r6, r5, lsl #0x1
    add r2, r0, #0xc600
    mov r0, r6
    mov r1, r5
    ldrh r7, [r2, #0x62]
    bl func_ov006_021b8fa8
    add r0, r6, #0x6000
    ldr r0, [r0, #0x29c]
    mov r2, #0x4
    cmp r0, #0x0
    beq .L_b8
    ldr r3, _LIT0
    mov r0, r4
    mov r1, r7
    bl func_020a97b8
    b .L_c8
.L_b8:
    ldr r3, _LIT1
    mov r0, r4
    mov r1, r7
    bl func_020a97b8
.L_c8:
    mov r0, r6
    mov r1, r5
    bl func_ov006_021b8544
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word func_ov006_021b940c
_LIT1: .word func_ov006_021b9010
