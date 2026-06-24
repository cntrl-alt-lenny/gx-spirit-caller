; func_02075f20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207615c
        .extern func_02076178
        .extern func_02077d70
        .extern func_02077de4
        .extern func_02077ea4
        .extern func_020783b0
        .extern func_02078424
        .extern func_020784e4
        .extern func_02094500
        .extern func_020a734c
        .global func_02075f20
        .arm
func_02075f20:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x44
    mov r6, r1
    ldrb r3, [r6, #0x3]
    ldrb r2, [r6, #0x4]
    mov r7, r0
    add r1, r6, #0x5
    add r2, r2, r3, lsl #0x8
    bl func_0207615c
    ldrh r1, [r7, #0x32]
    mov r5, r0
    cmp r1, #0x4
    beq .L_40
    cmp r1, #0x5
    beq .L_124
    b .L_204
.L_40:
    sub r5, r5, #0x10
    mov r0, r5, asr #0x8
    strb r0, [r6, #0x3]
    add r4, r7, #0x3fc
    mov r0, r4
    strb r5, [r6, #0x4]
    bl func_02077ea4
    ldr r1, [r7, #0x1d4]
    mov r0, r4
    mov r2, #0x10
    bl func_02077de4
    add r0, sp, #0x14
    mov r1, #0x36
    mov r2, #0x30
    bl func_02094500
    mov r0, r4
    add r1, sp, #0x14
    mov r2, #0x30
    bl func_02077de4
    mov r0, r4
    add r1, r7, #0x2e4
    mov r2, #0x8
    bl func_02077de4
    mov r0, r4
    mov r1, r6
    mov r2, #0x1
    bl func_02077de4
    mov r0, r4
    add r1, r6, #0x3
    add r2, r5, #0x2
    bl func_02077de4
    mov r0, r4
    add r1, sp, #0x0
    bl func_02077d70
    mov r0, r4
    bl func_02077ea4
    ldr r1, [r7, #0x1d4]
    mov r0, r4
    mov r2, #0x10
    bl func_02077de4
    add r0, sp, #0x14
    mov r1, #0x5c
    mov r2, #0x30
    bl func_02094500
    mov r0, r4
    add r1, sp, #0x14
    mov r2, #0x30
    bl func_02077de4
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x10
    bl func_02077de4
    mov r0, r4
    add r1, sp, #0x0
    bl func_02077d70
    mov r4, #0x10
    b .L_204
.L_124:
    sub r5, r5, #0x14
    mov r0, r5, asr #0x8
    strb r0, [r6, #0x3]
    add r4, r7, #0x348
    mov r0, r4
    strb r5, [r6, #0x4]
    bl func_020784e4
    ldr r1, [r7, #0x1d4]
    mov r0, r4
    mov r2, #0x14
    bl func_02078424
    add r0, sp, #0x14
    mov r1, #0x36
    mov r2, #0x28
    bl func_02094500
    mov r0, r4
    add r1, sp, #0x14
    mov r2, #0x28
    bl func_02078424
    mov r0, r4
    add r1, r7, #0x2e4
    mov r2, #0x8
    bl func_02078424
    mov r0, r4
    mov r1, r6
    mov r2, #0x1
    bl func_02078424
    mov r0, r4
    add r1, r6, #0x3
    add r2, r5, #0x2
    bl func_02078424
    mov r0, r4
    add r1, sp, #0x0
    bl func_020783b0
    mov r0, r4
    bl func_020784e4
    ldr r1, [r7, #0x1d4]
    mov r0, r4
    mov r2, #0x14
    bl func_02078424
    add r0, sp, #0x14
    mov r1, #0x5c
    mov r2, #0x28
    bl func_02094500
    mov r0, r4
    add r1, sp, #0x14
    mov r2, #0x28
    bl func_02078424
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x14
    bl func_02078424
    mov r0, r4
    add r1, sp, #0x0
    bl func_020783b0
    mov r4, #0x14
.L_204:
    add r0, r6, #0x5
    add r1, sp, #0x0
    mov r2, r4
    add r0, r0, r5
    bl func_020a734c
    cmp r0, #0x0
    movne r0, #0x9
    strneb r0, [r7, #0x455]
    add r0, r7, #0x2ec
    bl func_02076178
    add r0, r5, #0x5
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
