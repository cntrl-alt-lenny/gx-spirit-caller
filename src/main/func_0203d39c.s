; func_0203d39c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c888
        .extern func_0203c900
        .extern func_0203cef8
        .extern func_0203d0e0
        .extern func_0203d1c0
        .extern func_0203d258
        .extern func_0203eb14
        .global func_0203d39c
        .arm
func_0203d39c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r0, #0x10
    mvn r6, #0x0
    bl func_0203c900
    mov r4, r0
    mov r0, #0x1
    bl func_0203c900
    mov r1, #0x1
    strb r1, [r0, #0xb]
    bl func_0203c888
    cmp r0, #0x3
    beq .L_30c
    cmp r0, #0x4
    beq .L_37c
    cmp r0, #0x5
    beq .L_3c8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_30c:
    ldrh r1, [r7, #0xa]
    ldrb r5, [r4, #0xd11]
    cmp r1, #0x0
    beq .L_328
    ldrb r0, [r7, #0xc]
    cmp r0, #0x0
    bne .L_334
.L_328:
    ldrh r0, [r7, #0x36]
    bl func_0203eb14
    b .L_410
.L_334:
    cmp r1, #0x1
    beq .L_344
    cmp r0, #0x20
    bne .L_364
.L_344:
    ldrh r0, [r7, #0x36]
    bl func_0203eb14
    ldrb r1, [r4, #0xd10]
    mov r0, r7
    add r2, r4, #0x300
    bl func_0203d258
    mov r6, r0
    b .L_410
.L_364:
    ldrb r1, [r4, #0xd10]
    mov r0, r7
    add r2, r4, #0x300
    bl func_0203d258
    mov r6, r0
    b .L_410
.L_37c:
    ldrb r2, [r4, #0xd0f]
    mov r1, #0xc0
    mov r0, r7
    mla r1, r2, r1, r4
    add r1, r1, #0x400
    ldrh r2, [r1, #0xa6]
    mov r1, r4
    sub r2, r2, #0x1
    and r5, r2, #0xff
    bl func_0203d1c0
    movs r6, r0
    bmi .L_410
    ldr r0, _LIT0
    ldrb r1, [r4, #0xd0f]
    add r2, r4, r0
    ldrb r0, [r2, r1, lsl #0x2]
    orr r0, r0, #0x80
    strb r0, [r2, r1, lsl #0x2]
    b .L_410
.L_3c8:
    ldrb r1, [r4, #0xd0f]
    add r2, r4, #0x300
    mov r0, #0x24
    mla r2, r1, r0, r2
    mov r0, r7
    mov r1, #0x1
    ldrb r5, [r4, #0xd11]
    bl func_0203d258
    movs r6, r0
    bmi .L_410
    ldrb r1, [r4, #0xd0f]
    mov r0, #0x24
    add r3, r4, #0x300
    mul r2, r1, r0
    ldrb r0, [r3, r2]
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    strb r0, [r3, r2]
.L_410:
    cmp r6, #0x0
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, r4
    bl func_0203d0e0
    mov r1, r4
    bl func_0203cef8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00000447
