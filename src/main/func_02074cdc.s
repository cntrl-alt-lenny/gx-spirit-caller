; func_02074cdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02074ef4
        .extern func_02074f2c
        .extern func_020751e4
        .extern func_02075394
        .extern func_02075928
        .extern func_0207655c
        .extern func_02076764
        .extern func_02077c08
        .global func_02074cdc
        .arm
func_02074cdc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5, #0xc]
    bl func_020751e4
.L_594:
    mov r0, r5
    bl func_02075928
    cmp r0, #0x9
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    cmp r0, #0x4
    beq .L_5c4
    ldrb r0, [r4, #0x31]
    cmp r0, #0x0
    beq .L_594
.L_5c4:
    ldrb r0, [r4, #0x31]
    cmp r0, #0x0
    beq .L_600
    mov r0, r4
    bl func_0207655c
    mov r0, r5
    bl func_02074ef4
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    mov r0, r5
    bl func_02075394
    b .L_658
.L_600:
    mov r0, r5
    bl func_02074f2c
    mov r0, r4
    bl func_02076764
    ldrb r0, [r4, #0x30]
    cmp r0, #0x0
    beq .L_62c
    ldrh r2, [r5, #0x18]
    ldr r1, [r5, #0x1c]
    mov r0, r4
    bl func_02077c08
.L_62c:
    mov r0, r4
    bl func_0207655c
    mov r0, r5
    bl func_02075394
    mov r0, r5
    bl func_02074ef4
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_658:
    mov r0, #0x8
    strb r0, [r4, #0x455]
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
