; func_ov002_02204290 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_0202b824
        .extern func_02031740
        .extern func_ov002_021c8860
        .extern func_ov002_021ff264
        .extern func_ov002_0223dda4
        .global func_ov002_02204290
        .arm
func_ov002_02204290:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    bl func_ov002_021ff264
    cmp r0, #0x0
    cmpne r5, #0x0
    beq .L_ac
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_ac
    ldrh r0, [r5]
    bl func_02031740
    cmp r0, #0x0
    bne .L_ac
    ldrh r0, [r5]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_ac
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0x4
    and r0, r0, #0xff
    bgt .L_ac
    ldr r2, _LIT0
    mov r3, #0x14
    ldr ip, _LIT1
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r2, lr, r2, ip
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_ac
    bl func_ov002_021c8860
    cmp r0, #0x1
    moveq r0, #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
.L_ac:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
