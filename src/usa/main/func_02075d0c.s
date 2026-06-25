; func_02075d0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02076178
        .extern func_02077d70
        .extern func_02077de4
        .extern func_02077ea4
        .extern func_020783b0
        .extern func_02078424
        .extern func_020784e4
        .extern func_02078ce4
        .extern func_02094500
        .global func_02075d0c
        .arm
func_02075d0c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x30
    mov r5, r1
    mov r6, r0
    ldrh r0, [r6, #0x32]
    ldrb r3, [r5, #0x3]
    ldrb r2, [r5, #0x4]
    add r1, r5, #0x5
    cmp r0, #0x4
    add r4, r2, r3, lsl #0x8
    add r8, r1, r4
    beq .L_3c
    cmp r0, #0x5
    beq .L_110
    b .L_1e0
.L_3c:
    add r7, r6, #0x3fc
    mov r0, r7
    bl func_02077ea4
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x10
    bl func_02077de4
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x30
    bl func_02094500
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x30
    bl func_02077de4
    mov r0, r7
    add r1, r6, #0x1cc
    mov r2, #0x8
    bl func_02077de4
    mov r0, r7
    mov r1, r5
    mov r2, #0x1
    bl func_02077de4
    mov r0, r7
    add r1, r5, #0x3
    add r2, r4, #0x2
    bl func_02077de4
    mov r0, r7
    mov r1, r8
    bl func_02077d70
    mov r0, r7
    bl func_02077ea4
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x10
    bl func_02077de4
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x30
    bl func_02094500
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x30
    bl func_02077de4
    mov r0, r7
    mov r1, r8
    mov r2, #0x10
    bl func_02077de4
    mov r0, r7
    mov r1, r8
    bl func_02077d70
    add r4, r4, #0x10
    b .L_1e0
.L_110:
    add r7, r6, #0x348
    mov r0, r7
    bl func_020784e4
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x14
    bl func_02078424
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x28
    bl func_02094500
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x28
    bl func_02078424
    mov r0, r7
    add r1, r6, #0x1cc
    mov r2, #0x8
    bl func_02078424
    mov r0, r7
    mov r1, r5
    mov r2, #0x1
    bl func_02078424
    mov r0, r7
    add r1, r5, #0x3
    add r2, r4, #0x2
    bl func_02078424
    mov r0, r7
    mov r1, r8
    bl func_020783b0
    mov r0, r7
    bl func_020784e4
    ldr r1, [r6, #0xbc]
    mov r0, r7
    mov r2, #0x14
    bl func_02078424
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x28
    bl func_02094500
    mov r0, r7
    add r1, sp, #0x0
    mov r2, #0x28
    bl func_02078424
    mov r0, r7
    mov r1, r8
    mov r2, #0x14
    bl func_02078424
    mov r0, r7
    mov r1, r8
    bl func_020783b0
    add r4, r4, #0x14
.L_1e0:
    mov r0, r4, asr #0x8
    strb r0, [r5, #0x3]
    mov r2, r4
    add r0, r6, #0xc8
    add r1, r5, #0x5
    strb r4, [r5, #0x4]
    bl func_02078ce4
    add r0, r6, #0x1d4
    bl func_02076178
    add r0, r4, #0x5
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
