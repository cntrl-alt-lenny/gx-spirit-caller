; func_ov002_0221aa28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c8470
        .extern func_ov002_021d479c
        .extern func_ov002_021df818
        .extern func_ov002_021e05fc
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .global func_ov002_0221aa28
        .arm
func_ov002_0221aa28:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, r1, lsr #0x1
    tst r1, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_368
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    and r4, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    and r5, r3, #0xff
    mov r0, #0x14
    smulbb r0, r5, r0
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_368
    ldrh r1, [r6]
    cmp r1, #0x1380
    beq .L_27c
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_2a0
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_304
    b .L_368
.L_27c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    ldrh r2, [r6, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e05fc
    b .L_368
.L_2a0:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1e44
    cmp r0, #0x0
    bne .L_368
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x20
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    mov r2, r0
    mov r0, r6
    mov r1, r4
    bl func_ov002_021df818
    b .L_368
.L_304:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1e44
    cmp r0, #0x0
    bne .L_368
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x20
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    ldrh r2, [r6, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e05fc
.L_368:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x00001404
_LIT4: .word 0x0000176a
