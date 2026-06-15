; func_0204d4b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204b034
        .extern func_0204b300
        .extern func_0204ead0
        .extern func_020673dc
        .global func_0204d4b4
        .arm
func_0204d4b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020498f0
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_88
    bl func_020498f0
    ldr r0, [r0, #0x20]
    cmp r6, r0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_88:
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x17]
    bl func_020498f0
    str r6, [r0, #0x20]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1bc]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c8]
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x204]
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    add r0, r0, #0x1
    add r0, r7, r0, lsl #0x2
    str r6, [r0, #0xf4]
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    add r0, r0, #0x1
    add r0, r7, r0, lsl #0x2
    str r5, [r0, #0x24]
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    add r0, r0, #0x1
    add r0, r7, r0, lsl #0x1
    strh r4, [r0, #0xa4]
    bl func_020498f0
    str r5, [r0, #0x1b8]
    bl func_020498f0
    add r0, r0, #0x100
    strh r4, [r0, #0xb4]
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_0204b300
    ldrb r1, [r4, #0x14]
    add r1, r1, #0x1
    add r1, r5, r1
    strb r0, [r1, #0x2d0]
    str r6, [sp, #0x8]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    mov r7, #0x1
    add r0, r0, #0x1
    add r0, r4, r0
    ldrb r0, [r0, #0x2d0]
    str r0, [sp, #0xc]
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    cmp r0, #0x1
    blt .L_1f8
    add r6, sp, #0x8
    mov r5, #0x2
    mov r4, #0x7
.L_19c:
    bl func_020498f0
    mov r9, r0
    bl func_020498f0
    mov r8, r0
    bl func_020498f0
    str r6, [sp]
    str r5, [sp, #0x4]
    add r0, r0, r7, lsl #0x1
    add r1, r9, r7, lsl #0x2
    add r2, r8, r7, lsl #0x2
    ldrh r3, [r0, #0xa4]
    ldr r1, [r1, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, r4
    bl func_0204ead0
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r7, r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    cmp r7, r0
    ble .L_19c
.L_1f8:
    mov r0, #0x1
    bl func_0204b034
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
