; func_0203e95c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bed88
        .extern data_020bed90
        .extern func_0203c8b0
        .extern func_0203e384
        .extern func_02092fc8
        .global func_0203e95c
        .arm
func_0203e95c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r0, #0x10
    bl func_0203c8b0
    mov r4, r0
    cmp r5, #0x3
    beq .L_38
    cmp r5, #0x4
    beq .L_64
    cmp r5, #0x5
    beq .L_b4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_38:
    bl func_02092fc8
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    add r0, r4, #0xd00
    ldrsb r2, [r0, #0x11]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r3, #0x200000
    bl func_0203e384
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_64:
    bl func_02092fc8
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    ldrb r2, [r4, #0xd0f]
    mov r0, #0xc0
    ldr r1, _LIT2
    mul ip, r2, r0
    add r0, r4, ip
    add r0, r0, #0x400
    ldrh r2, [r0, #0xa6]
    ldr r0, _LIT3
    add r3, r4, r1
    add r1, r4, r0
    add r0, r3, ip
    add r1, r1, ip
    sub r2, r2, #0x1
    mov r3, #0x300000
    bl func_0203e384
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_b4:
    bl func_02092fc8
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    ldrb r3, [r4, #0xd0f]
    add r1, r4, #0x304
    mov r0, #0x24
    add r2, r4, #0xd00
    mla r1, r3, r0, r1
    ldrsb r2, [r2, #0x11]
    ldr r0, _LIT0
    mov r3, #0x300000
    bl func_0203e384
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020bed88
_LIT1: .word data_020bed90
_LIT2: .word 0x00000474
_LIT3: .word 0x0000047c
