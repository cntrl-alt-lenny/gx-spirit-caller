; func_ov002_02216004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .extern func_ov002_0225764c
        .global func_ov002_02216004
        .arm
func_ov002_02216004:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r9, r1
    mvn r7, #0x0
    mov r5, #0x0
.L_1c8:
    ldr r0, _LIT0
    and r8, r5, #0xff
    sub fp, r0, #0x16c
    ldr r0, _LIT1
    mov r6, #0x0
    add r4, r0, #0x8f
    ldr r0, _LIT0
    sub r0, r0, #0x16c
    str r0, [sp]
.L_1ec:
    mov r0, sl
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_304
    ldrh r0, [sl]
    cmp r0, #0x1540
    bgt .L_234
    bge .L_268
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_228
    beq .L_268
    b .L_304
.L_228:
    cmp r0, r4
    beq .L_2a0
    b .L_304
.L_234:
    cmp r0, fp
    bgt .L_258
    ldr r1, [sp]
    cmp r0, r1
    bge .L_268
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_2d4
    b .L_304
.L_258:
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_2a0
    b .L_304
.L_268:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8470
    cmp r7, #0x0
    blt .L_284
    cmp r0, r7
    ble .L_304
.L_284:
    mov r7, r0
    cmp r9, #0x0
    beq .L_304
    and r0, r6, #0xff
    orr r0, r8, r0, lsl #0x8
    strh r0, [r9]
    b .L_304
.L_2a0:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8470
    cmp r7, #0x0
    cmpge r0, r7
    bge .L_304
    mov r7, r0
    cmp r9, #0x0
    beq .L_304
    and r0, r6, #0xff
    orr r0, r8, r0, lsl #0x8
    strh r0, [r9]
    b .L_304
.L_2d4:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c84a8
    cmp r7, #0x0
    blt .L_2f0
    cmp r0, r7
    ble .L_304
.L_2f0:
    mov r7, r0
    cmp r9, #0x0
    andne r0, r6, #0xff
    orrne r0, r8, r0, lsl #0x8
    strneh r0, [r9]
.L_304:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_1ec
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_1c8
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000195e
_LIT1: .word 0x00001254
_LIT2: .word 0x00001711
