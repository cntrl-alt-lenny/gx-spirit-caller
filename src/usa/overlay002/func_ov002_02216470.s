; func_ov002_02216470 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d86b4
        .extern func_ov002_021df618
        .extern func_ov002_021e269c
        .extern func_ov002_02216440
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .global func_ov002_02216470
        .arm
func_ov002_02216470:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r1, [r0, #0x4]
    ldrh r2, [r0, #0x8]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    and r2, r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    rsb r2, r0, #0x1
    ldr r1, _LIT0
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    ldr r1, [r1, r3]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT2
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_8c
    cmp r1, #0x80
    bne .L_11c
    mov r1, #0xf4
    bl func_ov002_021ae320
    ldr r0, _LIT3
    bl func_ov002_02259204
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_8c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x80
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT4
    ldr r3, _LIT5
    ldr r6, [r1, #0xd70]
    ldr r0, _LIT0
    and r2, r6, #0x1
    mla r0, r2, r0, r3
    add r5, r0, #0x120
    ldr r4, [r1, #0xd78]
    mov r0, r6
    ldr r2, [r5, r4, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r2, r1, r2, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021d86b4
    ldr r1, [r5, r4, lsl #0x2]
    mov r0, r6
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_ov002_021df618
    ldr r2, [r5, r4, lsl #0x2]
    mov r0, r6
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e269c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word func_ov002_02216440
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cf08c
