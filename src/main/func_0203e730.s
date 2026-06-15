; func_0203e730 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203e3d4
        .extern func_0203e540
        .extern func_020930b0
        .extern func_020b3808
        .global func_0203e730
        .arm
func_0203e730:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020930b0
    ldr r3, [r4, #0xcb0]
    ldr r2, [r4, #0xcb4]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    cmp r1, #0x0
    cmpeq r0, #0x96
    bcs .L_38c
    ldrb r0, [r4, #0xd0f]
    add r0, r4, r0, lsl #0x2
    ldrb r0, [r0, #0x447]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_454
.L_38c:
    ldr r0, _LIT1
    ldrb r1, [r4, #0xd0f]
    add r2, r4, r0
    ldrb r0, [r2, r1, lsl #0x2]
    orr r0, r0, #0x80
    strb r0, [r2, r1, lsl #0x2]
    ldrb r2, [r4, #0xd12]
    ldrb r3, [r4, #0xd0f]
    cmp r3, r2
    bcs .L_3ec
    ldr r0, _LIT2
    add r1, r4, r0
.L_3bc:
    add r0, r4, r3, lsl #0x2
    ldrb r0, [r0, #0x447]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    beq .L_3ec
    ldrb r0, [r1]
    add r0, r0, #0x1
    strb r0, [r1]
    ldrb r2, [r4, #0xd12]
    ldrb r3, [r4, #0xd0f]
    cmp r3, r2
    bcc .L_3bc
.L_3ec:
    cmp r2, r3
    bhi .L_40c
    mov r2, #0x0
    mov r0, r4
    mov r1, #0x4
    strb r2, [r4, #0xd0f]
    bl func_0203e540
    ldmia sp!, {r4, pc}
.L_40c:
    bl func_020930b0
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    ldrb r2, [r4, #0xd0f]
    mov r0, #0xc0
    ldr r1, _LIT3
    mul ip, r2, r0
    add r0, r4, ip
    add r0, r0, #0x400
    ldrh r2, [r0, #0xa6]
    ldr r0, _LIT4
    add r3, r4, r1
    add r1, r4, r0
    add r0, r3, ip
    add r1, r1, ip
    sub r2, r2, #0x1
    mov r3, #0x300000
    bl func_0203e3d4
.L_454:
    mov r0, #0x4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000082ea
_LIT1: .word 0x00000447
_LIT2: .word 0x00000d0f
_LIT3: .word 0x00000474
_LIT4: .word 0x0000047c
