; func_ov002_02266b50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022d008c
        .extern func_ov002_021e2fc4
        .global func_ov002_02266b50
        .arm
func_ov002_02266b50:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0xd28]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT1
    and r3, r0, #0x1
    mul r2, r3, r1
    ldr r1, _LIT2
    mov r6, #0x0
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bls .L_c0
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    add r9, r1, r2
    and r1, r0, #-2147483648
    add r0, r9, #0x18
    orr r8, r1, #0x4e0000
    ldr r4, _LIT4
    add r7, r0, #0x400
    orr r8, r8, #0x4000000
    mov r5, r6
.L_60:
    ldr r2, [r7]
    mov r0, r2, lsl #0x13
    cmp r4, r0, lsr #0x13
    mov r0, r0, lsr #0x13
    bne .L_ac
    mov r1, r2, lsl #0xa
    movs r1, r1, lsr #0x1f
    bne .L_ac
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r5
    orr r0, r8, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_ac:
    ldr r0, [r9, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x4
    bcc .L_60
.L_c0:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a0
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00001459
