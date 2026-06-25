; func_0209edec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092800
        .extern func_0209da94
        .extern func_0209dc3c
        .extern func_0209dd68
        .extern func_0209ed9c
        .global func_0209edec
        .arm
func_0209edec:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    mov r0, #0x1
    mov r1, #0x2
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldrh r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_64
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
.L_64:
    ldrh r1, [r4, #0x14]
    ldrh r0, [r4, #0x34]
    cmp r1, #0x0
    movne r2, #0x2a
    moveq r2, #0x0
    add r0, r0, r2
    cmp r0, #0x200
    bgt .L_a0
    ldrh r0, [r4, #0x36]
    cmp r1, #0x0
    movne r1, #0x6
    moveq r1, #0x0
    add r0, r0, r1
    cmp r0, #0x200
    ble .L_b0
.L_a0:
    add sp, sp, #0x4
    mov r0, #0x6
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_b0:
    mov r0, r4
    bl func_0209ed9c
    mov r1, r5
    mov r0, #0x7
    bl func_0209dd68
    mov r0, r4
    mov r1, #0x40
    bl func_02092800
    ldrh r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_e4
    ldr r0, [r4]
    bl func_02092800
.L_e4:
    mov r2, r4
    mov r0, #0x7
    mov r1, #0x1
    bl func_0209dc3c
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
