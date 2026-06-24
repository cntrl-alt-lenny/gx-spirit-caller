; func_02065244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020552bc
        .extern func_02065938
        .global func_02065244
        .arm
func_02065244:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r3, [r5, #0x10]
    mov r4, r2
    cmp r3, #0x2
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, pc}
    ldr r3, [r4, #0x4]
    mov r2, #0x1
    str r3, [r5, #0x2c]
    ldrh r3, [r4, #0x2]
    mov ip, r3, asr #0x8
    mov r3, r3, lsl #0x8
    and ip, ip, #0xff
    and r3, r3, #0xff00
    orr r3, ip, r3
    strh r3, [r5, #0x30]
    strb r2, [r5, #0x32]
    ldrb r2, [r1, #0x12]
    cmp r2, #0x0
    bne .L_2d0
    bl func_02065938
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_2d0:
    ldr r2, [r5, #0x10]
    cmp r2, #0x2
    bne .L_334
    ldrb r1, [r5, #0x33]
    cmp r1, #0x0
    bne .L_2ec
    bl func_02065938
.L_2ec:
    mov r0, #0x3
    str r0, [r5, #0x10]
    bl func_020552bc
    ldr r1, _LIT0
    mvn r2, #0x0
    add r0, r0, r1
    str r0, [r5, #0x28]
    ldr r1, [r5, #0x4]
    cmp r1, r2
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r3, [r5, #0x3c]
    ldr r5, [r5, #0x38]
    mov r2, r4
    mov r0, #0x0
    blx r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_334:
    ldrb r1, [r1, #0x13]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    bl func_02065938
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00001388
