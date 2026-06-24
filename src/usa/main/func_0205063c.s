; func_0205063c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021014b8
        .extern func_0204987c
        .extern func_02064fd8
        .extern func_02066208
        .extern func_020a734c
        .global func_0205063c
        .arm
func_0205063c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r0, [sp, #0x18]
    mov r5, r1
    mov r6, r2
    mov r4, r3
    cmp r0, #0x0
    beq .L_50c
    cmp r4, #0x0
    bne .L_518
.L_50c:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_518:
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    mov r1, r6, asr #0x8
    mov r0, r6, lsl #0x8
    mov r2, #0x2
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    strb r2, [sp, #0x1]
    strh r0, [sp, #0x2]
    str r5, [sp, #0x4]
    ldrb r5, [r4]
    cmp r5, #0xfe
    bne .L_564
    ldrb r0, [r4, #0x1]
    cmp r0, #0xfd
    beq .L_56c
.L_564:
    cmp r5, #0x5c
    bne .L_598
.L_56c:
    bl func_0204987c
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_5d8
    bl func_0204987c
    ldr r0, [r0, #0x10]
    ldr r2, [sp, #0x18]
    add r3, sp, #0x0
    mov r1, r4
    bl func_02066208
    b .L_5d8
.L_598:
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x6
    bl func_020a734c
    cmp r0, #0x0
    bne .L_5c4
    ldr r1, [sp, #0x18]
    add r2, sp, #0x0
    mov r0, r4
    bl func_02064fd8
    b .L_5d8
.L_5c4:
    cmp r5, #0xfe
    moveq r0, #0x0
    add sp, sp, #0x8
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_5d8:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021014b8
