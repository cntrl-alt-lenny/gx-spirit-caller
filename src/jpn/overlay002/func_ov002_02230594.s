; func_ov002_02230594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021d5918
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02230594
        .arm
func_ov002_02230594:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldrh r0, [sl, #0x2]
    ldrh r2, [sl, #0x4]
    ldr r4, _LIT0
    mov r1, r0, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    ldr r0, _LIT1
    and r3, r3, #0x1
    mla r4, r3, r0, r4
    mov r1, r1, lsr #0x1b
    mov r0, #0x14
    mul r0, r1, r0
    add r1, r4, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [sl, #0x6]
    mov r7, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_490
    mov r5, #0x16
    mov r4, r7
    add r6, sp, #0x8
.L_3f4:
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_47c
    ldr r2, [sp, #0x8]
    mov r0, sl
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r8, r2, #0xff
    and r9, r1, #0xff
    mov r1, r8
    mov r2, r9
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_47c
    str r5, [sp]
    str r4, [sp, #0x4]
    ldrh r2, [sl, #0x2]
    mov r0, sl
    mov r1, r8
    mov r3, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r3, r2, lsl #0x10
    mov r2, r9
    mov r3, r3, lsr #0x10
    bl func_ov002_021d5918
.L_47c:
    ldrh r0, [sl, #0x6]
    add r7, r7, #0x1
    mov r0, r0, lsl #0x10
    cmp r7, r0, lsr #0x18
    blt .L_3f4
.L_490:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
