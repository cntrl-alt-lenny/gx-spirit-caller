; func_02074bf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02074e0c
        .extern func_02074e44
        .extern func_020750fc
        .extern func_020752ac
        .extern func_02075840
        .extern func_02076474
        .extern func_0207667c
        .extern func_02077b20
        .global func_02074bf4
        .arm
func_02074bf4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5, #0xc]
    bl func_020750fc
.L_14:
    mov r0, r5
    bl func_02075840
    cmp r0, #0x9
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    cmp r0, #0x4
    beq .L_44
    ldrb r0, [r4, #0x31]
    cmp r0, #0x0
    beq .L_14
.L_44:
    ldrb r0, [r4, #0x31]
    cmp r0, #0x0
    beq .L_80
    mov r0, r4
    bl func_02076474
    mov r0, r5
    bl func_02074e0c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r0, r5
    bl func_020752ac
    b .L_d8
.L_80:
    mov r0, r5
    bl func_02074e44
    mov r0, r4
    bl func_0207667c
    ldrb r0, [r4, #0x30]
    cmp r0, #0x0
    beq .L_ac
    ldrh r2, [r5, #0x18]
    ldr r1, [r5, #0x1c]
    mov r0, r4
    bl func_02077b20
.L_ac:
    mov r0, r4
    bl func_02076474
    mov r0, r5
    bl func_020752ac
    mov r0, r5
    bl func_02074e0c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_d8:
    mov r0, #0x8
    strb r0, [r4, #0x455]
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
