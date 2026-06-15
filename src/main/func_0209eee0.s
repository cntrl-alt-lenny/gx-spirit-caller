; func_0209eee0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_0209db88
        .extern func_0209dd30
        .extern func_0209de5c
        .extern func_0209ee90
        .global func_0209eee0
        .arm
func_0209eee0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    mov r0, #0x1
    mov r1, #0x2
    bl func_0209db88
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
    beq .L_124
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
.L_124:
    ldrh r1, [r4, #0x14]
    ldrh r0, [r4, #0x34]
    cmp r1, #0x0
    movne r2, #0x2a
    moveq r2, #0x0
    add r0, r0, r2
    cmp r0, #0x200
    bgt .L_160
    ldrh r0, [r4, #0x36]
    cmp r1, #0x0
    movne r1, #0x6
    moveq r1, #0x0
    add r0, r0, r1
    cmp r0, #0x200
    ble .L_170
.L_160:
    add sp, sp, #0x4
    mov r0, #0x6
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_170:
    mov r0, r4
    bl func_0209ee90
    mov r1, r5
    mov r0, #0x7
    bl func_0209de5c
    mov r0, r4
    mov r1, #0x40
    bl func_020928e8
    ldrh r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_1a4
    ldr r0, [r4]
    bl func_020928e8
.L_1a4:
    mov r2, r4
    mov r0, #0x7
    mov r1, #0x1
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
