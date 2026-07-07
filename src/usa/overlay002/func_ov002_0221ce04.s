; func_ov002_0221ce04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021d46ac
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226b114
        .global func_ov002_0221ce04
        .arm
func_ov002_0221ce04:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_80c
    cmp r1, #0x80
    bne .L_81c
    ldr r1, _LIT1
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
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_804
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_804
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldr r6, [r1]
    ldr r2, _LIT4
    and r3, r6, #0x1
    mla r2, r3, r0, r2
    ldr r1, [r1, #0x1c]
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_804
    cmp r6, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x19
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r5, lsl #0x10
    mov r3, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_804:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_80c:
    mov r0, #0x1
    bl func_ov002_0226b114
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_81c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd314
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf08c
