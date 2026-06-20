; func_ov002_022ad5d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f98
        .extern func_0207f05c
        .extern func_020b3870
        .global func_ov002_022ad5d8
        .arm
func_ov002_022ad5d8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrb r0, [r4, #0x24]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r0, #0x5000
    str r1, [sp]
    strh r0, [sp, #0x4]
    ldr r0, [r4, #0x14]
    cmp r0, #0x3
    ldreq r0, [r4, #0x18]
    beq .L_fc8
    ldr ip, [r4, #0x40]
    ldr r0, [r4, #0x3c]
    ldr r2, [r4, #0x34]
    ldr r1, [r4, #0x30]
    sub r0, r0, ip
    sub r1, r2, r1
    ldr r3, [r4, #0x44]
    mul r2, r1, r0
    sub r1, r3, ip
    add r0, r1, r1, lsr #0x1f
    add r0, r2, r0, asr #0x1
    bl func_020b3870
.L_fc8:
    ldr r3, [r4, #0x4]
    ldr r2, [r4, #0x2c]
    ldr r1, [r4, #0x8]
    add r2, r3, r2
    add r3, r2, r0
    add r1, r1, #0x3
    ldr r2, [sp]
    ldr r0, _LIT1
    and r1, r1, #0xff
    and r0, r2, r0
    mov r2, r3, lsl #0x17
    orr r0, r0, r1
    orr r0, r0, r2, lsr #0x7
    str r0, [sp]
    ldr r1, [r4, #0x1c]
    mvn r0, #0x0
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x9
    add r0, r0, #0x1200
    add r2, r0, #0x10000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    ldrh r3, [sp, #0x4]
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r2, r0, r1, asr #0x7
    strh r2, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x0
    mov r2, #0x1
    bl func_0207f05c
    ldr r0, [r4, #0x8]
    ldr r2, [sp]
    add r1, r0, #0x3
    ldr r0, _LIT1
    ldr r3, [r4, #0x4]
    and r0, r2, r0
    and r1, r1, #0xff
    mov r2, r3, lsl #0x17
    orr r0, r0, r1
    orr r0, r0, r2, lsr #0x7
    str r0, [sp]
    ldr r1, [r4, #0x10]
    mvn r0, #0x0
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x9
    add r0, r0, #0x1600
    add r2, r0, #0x10000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    ldrh r3, [sp, #0x4]
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r2, r0, r1, asr #0x7
    strh r2, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x0
    mov r2, #0x1
    bl func_0207f05c
    ldr r0, [r4, #0x8]
    ldr r3, [r4, #0x4]
    add r1, r0, #0x3
    ldr r2, [r4, #0x2c]
    ldr ip, [r4, #0x34]
    add r0, r3, r2
    add r3, ip, r0
    ldr r2, [sp]
    ldr r0, _LIT1
    and r1, r1, #0xff
    and r0, r2, r0
    mov r2, r3, lsl #0x17
    orr r0, r0, r1
    orr r0, r0, r2, lsr #0x7
    str r0, [sp]
    ldr r0, [r4, #0x10]
    ldrh r3, [sp, #0x4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x9
    add r0, r0, #0x1a00
    add r2, r0, #0x10000
    mov r0, #0x400
    mov r1, r2, asr #0x6
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT2
    add r1, sp, #0x0
    mov r2, #0x1
    strh r3, [sp, #0x4]
    bl func_0207f05c
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x80006400
_LIT1: .word 0xfe00ff00
_LIT2: .word data_ov002_022d0f98
