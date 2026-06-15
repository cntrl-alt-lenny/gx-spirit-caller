; func_02081988 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e7d8
        .extern func_02081898
        .extern func_02093bfc
        .global func_02081988
        .arm
func_02081988:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    mov r5, r1
    beq .L_560
    cmp r6, #0x0
    beq .L_51c
    ldr r1, [r6]
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x1
    beq .L_520
.L_51c:
    mov r0, #0x0
.L_520:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_564
    cmp r6, #0x0
    beq .L_54c
    ldrh r0, [r6, #0x6]
    cmp r0, #0x100
    movcs r0, #0x1
    bcs .L_550
.L_54c:
    mov r0, #0x0
.L_550:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_564
.L_560:
    mov r0, #0x0
.L_564:
    cmp r0, #0x0
    movne r4, #0x0
    bne .L_5ec
    cmp r6, #0x0
    beq .L_5d8
    cmp r6, #0x0
    beq .L_594
    ldr r1, [r6]
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x1
    beq .L_598
.L_594:
    mov r0, #0x0
.L_598:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_5dc
    cmp r6, #0x0
    beq .L_5c4
    ldrh r0, [r6, #0x6]
    cmp r0, #0x1
    movcs r0, #0x1
    bcs .L_5c8
.L_5c4:
    mov r0, #0x0
.L_5c8:
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_5dc
.L_5d8:
    mov r0, #0x0
.L_5dc:
    cmp r0, #0x0
    movne r4, #0x1
    bne .L_5ec
    bl func_02093bfc
.L_5ec:
    mov r0, r6
    bl func_02081898
    ldr r1, _LIT1
    mov r0, r6
    bl func_0207e7d8
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5]
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r0, #0x8
    str r0, [r5]
    cmp r4, #0x0
    beq .L_638
    ldr r2, [r5]
    mov r1, #0x0
    ldrsb r0, [r2, #0x6]
    strb r0, [r2, #0x7]
    ldr r0, [r5]
    strb r1, [r0, #0x6]
.L_638:
    add r0, r4, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x4e465452
_LIT1: .word 0x46494e46
