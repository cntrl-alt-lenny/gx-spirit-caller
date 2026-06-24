; func_0207c5b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b450
        .extern func_0207c2c8
        .extern func_0207c404
        .extern func_0207c488
        .extern func_0207c4cc
        .extern func_0209445c
        .global func_0207c5b0
        .arm
func_0207c5b0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_0207b450
    movs r7, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    add r0, r7, #0x2000
    ldrb r0, [r0, #0x26a]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldrh r0, [r5, #0x3c]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    add r0, r5, #0x4
    bl func_0207c404
    movs r6, r0
    bne .L_14c
    bl func_0207c4cc
    mov r6, r0
.L_14c:
    cmp r6, #0x0
    bne .L_16c
    add r0, r7, #0x2000
    ldr r0, [r0, #0x278]
    cmp r0, #0x1
    bne .L_16c
    bl func_0207c488
    mov r6, r0
.L_16c:
    cmp r6, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r5
    add r1, r6, #0x10
    mov r2, #0xc0
    strh r4, [r6, #0x2]
    bl func_0209445c
    mov r0, r6
    bl func_0207c2c8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
