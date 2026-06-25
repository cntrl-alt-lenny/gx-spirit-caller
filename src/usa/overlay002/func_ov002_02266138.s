; func_ov002_02266138 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9dec
        .extern func_ov002_021fd72c
        .global func_ov002_02266138
        .arm
func_ov002_02266138:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r8, #0x1
    mla r5, r1, r0, r2
    mov r0, r8, lsl #0x1f
    and r0, r0, #-2147483648
    mov r4, #0x0
    ldr r9, _LIT2
    add r6, r5, #0x30
    orr r7, r0, #0x600000
    mov sl, r4
.L_1090:
    mov r0, r8
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r0, r9
    bne .L_10f8
    ldrh r1, [r5, #0x38]
    cmp r1, #0x0
    beq .L_10f8
    ldr r3, [r6]
    mov r1, r4, lsl #0x10
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    and r1, r1, #0x1f0000
    add r2, r2, r3, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r1, r7, r1
    orr r0, r1, r0, lsr #0x10
    mov r2, sl
    mov r1, r3, lsr #0x10
    bl func_ov002_021fd72c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_10f8:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r5, r5, #0x14
    add r6, r6, #0x14
    ble .L_1090
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001954
