; func_ov002_02256af0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c8
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .extern func_ov002_021d8fd0
        .extern func_ov002_021d9054
        .global func_ov002_02256af0
        .arm
func_ov002_02256af0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r4, _LIT0
    ldr r0, [r4, #0xcf8]
    cmp r0, #0x7
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r5, [r4, #0xcec]
    ldr r0, _LIT1
    and r1, r5, #0x1
    mul r8, r1, r0
    ldr r0, _LIT2
    ldr r9, _LIT3
    mov r6, #0x0
    add r7, r0, r8
.L_38:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9dec
    cmp r0, r9
    bne .L_ec
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_ec
    ldr r1, [r7, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_ec
    ldr r0, [r7, #0x3c]
    ldr r1, [r4, #0xcf0]
    mov r0, r0, lsr #0x10
    add r1, r1, #0x1
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x10
    beq .L_ec
    mov r0, #0x14
    mul r2, r6, r0
    ldr r1, _LIT4
    mov r0, r5
    add r1, r1, r8
    ldr r2, [r2, r1]
    mov r1, r6
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    mov r4, r3, lsr #0x10
    bl func_ov002_021d9054
    ldr r0, _LIT0
    add r1, r4, #0x1
    ldr r0, [r0, #0xcf0]
    mov r2, r1, lsl #0x10
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, lsl #0x10
    mov r0, r5
    mov r1, r6
    orr r2, r3, r2, lsr #0x10
    bl func_ov002_021d8fd0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_ec:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_38
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001810
_LIT4: .word data_ov002_022cf0c8
