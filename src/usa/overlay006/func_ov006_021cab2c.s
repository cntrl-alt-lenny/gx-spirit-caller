; func_ov006_021cab2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020060f4
        .extern func_02006160
        .extern func_02006178
        .extern func_020221e0
        .extern func_020371b8
        .extern func_ov006_021cad9c
        .global func_ov006_021cab2c
        .arm
func_ov006_021cab2c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02006160
    cmp r0, #0x0
    beq .L_54
    mov r0, #0x84
    sub r1, r0, #0x85
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    str r0, [r5, #0x8]
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_54:
    bl func_02006178
    cmp r0, #0x0
    beq .L_cc
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr ip, [sp, #0x4]
    ldr r1, [r5, #0x24]
    ldr r2, [r5, #0x10]
    sub r1, ip, r1
    add r2, r2, r1
    rsb ip, r2, #0x0
    ldr r0, _LIT0
    ldr r4, [sp]
    ldr r3, [r5, #0x28]
    ldr r2, [r5, #0x14]
    sub r4, r4, r3
    add r2, r2, r4
    rsb r3, r2, #0x0
    mov r2, r0, lsl #0x10
    and ip, ip, r0
    and r0, r2, r3, lsl #0x10
    orr r3, ip, r0
    ldr r2, _LIT1
    mov r0, #0x6
    str r3, [r2]
    bl func_020221e0
    mov r1, r4
    mov r0, #0x7
    bl func_020221e0
.L_cc:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_e8
    mov r0, r5
    bl func_ov006_021cad9c
    mov r0, #0x0
    str r0, [r5, #0xc]
.L_e8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000001ff
_LIT1: .word 0x04001018
