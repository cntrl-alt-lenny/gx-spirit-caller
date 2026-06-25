; func_02076474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02077d70
        .extern func_02077de4
        .extern func_02077ea4
        .extern func_020783b0
        .extern func_02078424
        .extern func_020784e4
        .extern func_02078d54
        .global func_02076474
        .arm
func_02076474:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov sl, r0
    ldrh r0, [sl, #0x32]
    cmp r0, #0x4
    beq .L_34
    cmp r0, #0x5
    moveq r0, #0x14
    streq r0, [sp]
    moveq r0, #0x10
    streq r0, [sp, #0x4]
    moveq r2, #0x0
    b .L_44
.L_34:
    mov r0, #0x10
    str r0, [sp]
    str r0, [sp, #0x4]
    mov r2, #0x0
.L_44:
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    mov r9, #0x0
    add r0, r1, r0
    add r0, r2, r0
    mov r0, r0, lsl #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x0
    ble .L_15c
    mov r0, #0x20
    str r0, [sp, #0x10]
    mov r0, #0x14
    mov r6, r9
    add r5, sp, #0x18
    str r9, [sp, #0xc]
    mov r4, #0x1
    mov fp, #0x30
    str r0, [sp, #0x14]
.L_8c:
    add r7, sl, #0x348
    mov r0, r7
    bl func_020784e4
    add r0, r9, #0x41
    strb r0, [sp, #0x18]
    add r0, r9, #0x1
    ldr r8, [sp, #0xc]
    cmp r0, #0x0
    ble .L_d0
.L_b0:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_02078424
    add r8, r8, #0x1
    add r0, r9, #0x1
    cmp r8, r0
    blt .L_b0
.L_d0:
    mov r0, r7
    mov r1, sl
    mov r2, fp
    bl func_02078424
    ldr r2, [sp, #0x10]
    mov r0, r7
    add r1, sl, #0x54
    bl func_02078424
    ldr r2, [sp, #0x10]
    mov r0, r7
    add r1, sl, #0x34
    bl func_02078424
    mov r0, r7
    add r1, sp, #0x19
    bl func_020783b0
    add r7, sl, #0x3fc
    mov r0, r7
    bl func_02077ea4
    mov r0, r7
    mov r1, sl
    mov r2, fp
    bl func_02077de4
    ldr r2, [sp, #0x14]
    mov r0, r7
    add r1, sp, #0x19
    bl func_02077de4
    add r1, sl, #0x74
    mov r0, r7
    add r1, r1, r6
    bl func_02077d70
    ldr r0, [sp, #0x8]
    add r6, r6, #0x10
    cmp r6, r0
    add r9, r9, #0x1
    blt .L_8c
.L_15c:
    ldrb r0, [sl, #0x454]
    cmp r0, #0x0
    beq .L_1a4
    add r1, sl, #0x74
    str r1, [sl, #0x1d4]
    ldr r0, [sp]
    ldr r2, [sl, #0x1d4]
    add r1, r1, r0
    add r0, r2, r0, lsl #0x1
    str r0, [sl, #0x1d8]
    str r1, [sl, #0xbc]
    ldr r1, [sl, #0xbc]
    ldr r0, [sp]
    add r1, r1, r0
    ldr r0, [sp, #0x4]
    add r0, r1, r0
    str r0, [sl, #0xc0]
    b .L_1dc
.L_1a4:
    add r1, sl, #0x74
    str r1, [sl, #0xbc]
    ldr r0, [sp]
    ldr r2, [sl, #0xbc]
    add r1, r1, r0
    add r0, r2, r0, lsl #0x1
    str r0, [sl, #0xc0]
    str r1, [sl, #0x1d4]
    ldr r1, [sl, #0x1d4]
    ldr r0, [sp]
    add r1, r1, r0
    ldr r0, [sp, #0x4]
    add r0, r1, r0
    str r0, [sl, #0x1d8]
.L_1dc:
    ldr r1, [sl, #0x1d8]
    add r0, sl, #0x1e0
    mov r2, #0x10
    bl func_02078d54
    ldr r1, [sl, #0xc0]
    add r0, sl, #0xc8
    mov r2, #0x10
    bl func_02078d54
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
