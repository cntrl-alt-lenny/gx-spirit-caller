; func_ov002_02256cf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d90c0
        .extern func_ov002_021e30b4
        .global func_ov002_02256cf0
        .arm
func_ov002_02256cf0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    ldr r6, _LIT1
    ldr r8, _LIT2
    mov r7, #0x0
    mov r5, #0xa
.L_130:
    mov r0, r7
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp r0, r8
    bne .L_218
    and r0, r7, #0x1
    mla r9, r0, r6, r4
    add r0, r9, #0x100
    ldrh r0, [r0]
    cmp r0, #0x0
    beq .L_218
    ldr r1, [r9, #0x108]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_218
    ldr r0, [r9, #0x104]
    cmp r0, #0x0
    beq .L_218
    mov r0, r7, lsl #0x1f
    ldr r6, _LIT3
    ldr r4, _LIT4
    ldr r5, _LIT5
    and sl, r0, #-2147483648
    mov r8, #0x0
    mov fp, #0x1
.L_198:
    ldr r1, [r5, #0xcec]
    ldr r0, [r9, #0x104]
    eor r2, r1, r8
    mov r1, r2, lsl #0x4
    tst r0, r6, lsl r1
    beq .L_1f4
    cmp r7, r2
    ldr r2, [r9, #0xf8]
    movne r0, fp
    mov r1, r2, lsl #0x2
    moveq r0, #0x0
    mov r1, r1, lsr #0x18
    mov r0, r0, lsl #0x18
    and r3, r0, #0x1000000
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r0, r1, r2, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r3, sl, r3
    mov r2, #0x0
    orr r0, r3, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_1f4:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_198
    mov r0, r7
    mov r1, #0xa
    mov r2, #0x0
    bl func_ov002_021d90c0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_218:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_130
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x0000183f
_LIT3: .word 0x0000ffff
_LIT4: .word 0x002a183f
_LIT5: .word data_ov002_022d016c
