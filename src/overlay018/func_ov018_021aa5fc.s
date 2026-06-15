; func_ov018_021aa5fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov018_021ad738
        .extern data_ov018_021ad860
        .extern data_ov018_021ad8a8
        .extern data_ov018_021ae234
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov018_021aa5fc
        .arm
func_ov018_021aa5fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r4, _LIT0
    mov r9, r0
    ldr r0, [r4, #0x9d0]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    cmp r0, #0x0
    ldr r4, _LIT1
    ldr r5, _LIT2
    beq .L_198
    ldr r0, [r4, #0x988]
    bl func_02006e1c
    mov r0, #0x0
    str r0, [r4, #0x988]
.L_198:
    ldr r0, _LIT3
    ldr r2, _LIT4
    ldr r0, [r0, #0x34]
    mov r1, #0x4
    add r0, r2, r0, lsl #0x5
    ldr r0, [r0, r9, lsl #0x2]
    mov r2, #0x0
    bl func_02006c0c
    str r0, [r4, #0x988]
    mov r0, r5
    bl func_0201d47c
    ldrh r1, [r5, #0x14]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    strh r0, [r5, #0x14]
    cmp r8, #0x8
    addls pc, pc, r8, lsl #0x2
    b .L_27c
    b .L_210
    b .L_234
    b .L_258
    b .L_26c
    b .L_27c
    b .L_210
    b .L_234
    b .L_258
    b .L_26c
.L_210:
    cmp r7, #0x0
    moveq r0, #0x0
    ldr r1, [r5, #0x18]
    movne r0, #0x2
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [r5, #0x18]
    b .L_27c
.L_234:
    cmp r7, #0x0
    moveq r0, #0x1
    ldr r1, [r5, #0x18]
    movne r0, #0x3
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [r5, #0x18]
    b .L_27c
.L_258:
    ldr r0, [r5, #0x18]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    str r0, [r5, #0x18]
    b .L_27c
.L_26c:
    ldr r0, [r5, #0x18]
    bic r0, r0, #0x1c000
    orr r0, r0, #0xc000
    str r0, [r5, #0x18]
.L_27c:
    ldrh r0, [r5, #0x14]
    ldr r1, [r4, #0x988]
    cmp r6, #0x1
    orr r0, r0, #0x10
    str r1, [r5]
    strh r0, [r5, #0x14]
    bne .L_2cc
    cmp r1, #0x0
    beq .L_2cc
    mov r0, r5
    bl func_0201e5b8
    ldr r0, [r4, #0x988]
    bl func_02006e1c
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    mov r2, #0x0
    str r2, [r4, #0x988]
    bic r1, r1, #0x8
    strh r1, [r0, #0xb4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2cc:
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x8
    strh r1, [r0, #0xb4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov018_021ad860
_LIT1: .word data_ov018_021ad8a8
_LIT2: .word data_ov018_021ae234
_LIT3: .word data_021040ac
_LIT4: .word data_ov018_021ad738
