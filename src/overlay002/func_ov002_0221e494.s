; func_ov002_0221e494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c8470
        .extern func_ov002_021d90c0
        .extern func_ov002_0220e77c
        .global func_ov002_0221e494
        .arm
func_ov002_0221e494:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    mov r7, #0x0
    bl func_ov002_0220e77c
    mov r5, r7
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r6, r5
.L_710:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r3, r1, r9, r4
    add r1, r3, #0x30
    ldr r2, [r1, r6]
    mov r1, r2, lsl #0x13
    movs r1, r1, lsr #0x13
    addne r1, r3, r6
    ldrneh r1, [r1, #0x38]
    cmpne r1, #0x0
    movne r1, r2, lsl #0x12
    cmpne r0, r1, lsr #0x1f
    beq .L_758
    mov r1, r5
    bl func_ov002_021c8470
    add r7, r7, r0
.L_758:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    ble .L_710
    ldr r0, _LIT2
    cmp r7, r0
    movgt r7, r0
    ldrh r0, [r8, #0x2]
    mov r2, r7
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x0000ffff
