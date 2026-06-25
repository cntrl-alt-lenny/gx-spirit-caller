; func_0204fa08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204f958
        .global func_0204fa08
        .arm
func_0204fa08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r0
    mov r8, r1
    bl func_0204987c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_0204987c
    add r0, r0, r9, lsl #0x2
    ldr fp, [r0, #0xf4]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    add r0, r0, r9
    ldrb r0, [r0, #0x2c8]
    mov r1, #0x1
    ldr r2, [r4, #0x2e8]
    mvn r0, r1, lsl r0
    and r0, r2, r0
    str r0, [r4, #0x2e8]
    bl func_0204f958
    sub r0, r8, #0x1
    cmp r9, r0
    bge .L_140
    sub r0, r8, r9
    sub r6, r0, #0x1
    cmp r6, #0x0
    mov r7, #0x0
    ble .L_140
.L_7c:
    add r4, r9, r7
    add r5, r4, #0x1
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    add r0, r0, r5, lsl #0x2
    ldr r1, [r0, #0x24]
    add r0, sl, r4, lsl #0x2
    str r1, [r0, #0x24]
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    add r0, r0, r5, lsl #0x1
    ldrh r1, [r0, #0xa4]
    add r0, sl, r4, lsl #0x1
    strh r1, [r0, #0xa4]
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    add r1, sl, r4, lsl #0x2
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r1, #0xf4]
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    add r1, sl, r4, lsl #0x2
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0x208]
    str r0, [r1, #0x208]
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    add r1, sl, r4, lsl #0x1
    add r1, r1, #0x200
    add r0, r0, r5, lsl #0x1
    add r0, r0, #0x200
    ldrh r0, [r0, #0x88]
    strh r0, [r1, #0x88]
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    add r1, r0, r5
    add r0, sl, r4
    ldrb r1, [r1, #0x2c8]
    add r7, r7, #0x1
    cmp r7, r6
    strb r1, [r0, #0x2c8]
    blt .L_7c
.L_140:
    cmp r8, #0x0
    ble .L_1b0
    sub r4, r8, #0x1
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x24]
    bl func_0204987c
    add r0, r0, r4, lsl #0x1
    mov r1, #0x0
    strh r1, [r0, #0xa4]
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0xf4]
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x208]
    bl func_0204987c
    add r0, r0, r4, lsl #0x1
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x88]
    bl func_0204987c
    add r0, r0, r4
    mov r1, #0x0
    strb r1, [r0, #0x2c8]
.L_1b0:
    mov r0, fp
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
