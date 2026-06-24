; func_0206532c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020653fc
        .extern func_02065714
        .extern func_02065938
        .global func_0206532c
        .arm
func_0206532c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r1
    ldrb r1, [r5, #0x13]
    mov r4, r0
    cmp r1, #0x0
    bne .L_378
    mov r1, r2
    bl func_020653fc
.L_378:
    ldr r0, [r4, #0x10]
    cmp r0, #0x2
    addge sp, sp, #0x4
    ldmgeia sp!, {r4, r5, pc}
    ldrb r1, [r5, #0x13]
    cmp r1, #0x0
    beq .L_3d0
    mov r0, #0x3
    cmp r1, #0x1
    moveq r0, #0x1
    beq .L_3ac
    cmp r1, #0x2
    moveq r0, #0x2
.L_3ac:
    ldr r3, [r4, #0x3c]
    ldr ip, [r4, #0x38]
    mvn r1, #0x0
    mov r2, #0x0
    blx ip
    ldr r0, [r4, #0x8]
    bl func_02065714
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_3d0:
    ldr r0, [r5, #0xc]
    mov r1, #0x0
    str r0, [r4, #0x2c]
    ldrh r2, [r5, #0x10]
    mov r0, #0x2
    mov r3, r2, asr #0x8
    mov r2, r2, lsl #0x8
    and r3, r3, #0xff
    and r2, r2, #0xff00
    orr r2, r3, r2
    strh r2, [r4, #0x30]
    str r1, [r4, #0x20]
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x3c]
    ldr r2, [r4, #0x34]
    blx r2
    mov r0, r4
    bl func_02065938
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
