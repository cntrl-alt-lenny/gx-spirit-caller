; func_0205b7a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020604b0
        .global func_0205b7a8
        .arm
func_0205b7a8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    ldr r1, [r5]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x8]
    beq .L_90c
    add r0, r4, #0x8
    mov r2, #0x1f
    bl func_020604b0
.L_90c:
    ldr r1, [r5, #0x4]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x27]
    beq .L_92c
    add r0, r4, #0x27
    mov r2, #0x15
    bl func_020604b0
.L_92c:
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x3c]
    beq .L_94c
    add r0, r4, #0x3c
    mov r2, #0x33
    bl func_020604b0
.L_94c:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x6f]
    beq .L_96c
    add r0, r4, #0x6f
    mov r2, #0x1f
    bl func_020604b0
.L_96c:
    ldr r1, [r5, #0x10]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x8e]
    beq .L_98c
    add r0, r4, #0x8e
    mov r2, #0x1f
    bl func_020604b0
.L_98c:
    ldr r1, [r5, #0x14]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0xad]
    beq .L_9ac
    add r0, r4, #0xad
    mov r2, #0x4c
    bl func_020604b0
.L_9ac:
    ldr r3, [r5, #0x18]
    add r0, r4, #0x100
    add r1, r5, #0x1c
    mov r2, #0xb
    str r3, [r4, #0xfc]
    bl func_020604b0
    ldr r0, _LIT0
    add r1, r5, #0x27
    add r0, r4, r0
    mov r2, #0x3
    bl func_020604b0
    ldr r0, [r5, #0x2c]
    adds r1, r5, #0x34
    str r0, [r4, #0x110]
    ldr r0, [r5, #0x30]
    str r0, [r4, #0x114]
    moveq r0, #0x0
    streqb r0, [r4, #0x118]
    beq .L_a04
    add r0, r4, #0x118
    mov r2, #0x80
    bl func_020604b0
.L_a04:
    ldr r0, [r5, #0xb4]
    str r0, [r4, #0x198]
    ldr r0, [r5, #0xb8]
    str r0, [r4, #0x19c]
    ldr r0, [r5, #0xbc]
    str r0, [r4, #0x1a0]
    ldr r0, [r5, #0xc0]
    str r0, [r4, #0x1a4]
    ldr r0, [r5, #0xc4]
    str r0, [r4, #0x1a8]
    ldr r1, [r5, #0xc8]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, #0x1ac]
    beq .L_a4c
    add r0, r4, #0x1ac
    mov r2, #0x33
    bl func_020604b0
.L_a4c:
    ldr r0, [r5, #0x18]
    str r0, [r4, #0xfc]
    ldr r0, [r5, #0x2c]
    str r0, [r4, #0x110]
    ldr r0, [r5, #0x30]
    str r0, [r4, #0x114]
    ldr r0, [r5, #0xb4]
    str r0, [r4, #0x198]
    ldr r0, [r5, #0xb8]
    str r0, [r4, #0x19c]
    ldr r0, [r5, #0xbc]
    str r0, [r4, #0x1a0]
    ldr r0, [r5, #0xc0]
    str r0, [r4, #0x1a4]
    ldr r0, [r5, #0xc4]
    str r0, [r4, #0x1a8]
    ldr r0, [r5, #0xcc]
    str r0, [r4, #0x1e0]
    ldr r0, [r5, #0xd0]
    str r0, [r4, #0x1e4]
    ldr r0, [r5, #0xd4]
    str r0, [r4, #0x1e8]
    ldr r0, [r5, #0xd8]
    str r0, [r4, #0x1ec]
    ldr r0, [r5, #0xdc]
    str r0, [r4, #0x1f0]
    ldr r0, [r5, #0xe0]
    str r0, [r4, #0x1f4]
    ldr r0, [r5, #0xe4]
    str r0, [r4, #0x1f8]
    ldr r0, [r5, #0xe8]
    str r0, [r4, #0x1fc]
    ldr r0, [r5, #0xec]
    str r0, [r4, #0x200]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x0000010b
