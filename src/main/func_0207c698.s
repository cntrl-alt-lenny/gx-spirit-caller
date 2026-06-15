; func_0207c698 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b538
        .extern func_0207c3b0
        .extern func_0207c4ec
        .extern func_0207c570
        .extern func_0207c5b4
        .extern func_02094550
        .global func_0207c698
        .arm
func_0207c698:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_0207b538
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
    bl func_0207c4ec
    movs r6, r0
    bne .L_480
    bl func_0207c5b4
    mov r6, r0
.L_480:
    cmp r6, #0x0
    bne .L_4a0
    add r0, r7, #0x2000
    ldr r0, [r0, #0x278]
    cmp r0, #0x1
    bne .L_4a0
    bl func_0207c570
    mov r6, r0
.L_4a0:
    cmp r6, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r5
    add r1, r6, #0x10
    mov r2, #0xc0
    strh r4, [r6, #0x2]
    bl func_02094550
    mov r0, r6
    bl func_0207c3b0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
