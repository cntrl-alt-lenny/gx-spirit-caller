; func_ov002_02266844 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_ov002_021b9d34
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d9144
        .extern func_ov002_021e30b4
        .global func_ov002_02266844
        .arm
func_ov002_02266844:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    mov sl, r0
    ldr r2, [r6, #0xd28]
    cmp r2, #0x5
    bhi .L_13c
    ldr r0, _LIT1
    and r1, sl, #0x1
    mul fp, r1, r0
    ldr r0, _LIT2
    ldr r5, _LIT3
    add r9, r0, fp
    mov r4, #0x14
.L_34:
    add r7, r2, #0x5
    mov r0, sl
    mov r1, r7
    bl func_ov002_021b9ecc
    cmp r0, r5
    bne .L_128
    mul r8, r7, r4
    add r0, r9, r8
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_128
    mov r0, sl
    mov r1, r7
    bl func_ov002_021b9d34
    cmp r0, #0x0
    beq .L_128
    mov r0, sl
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021d9144
    ldr r1, _LIT4
    ldr r0, _LIT5
    add r1, r1, fp
    ldr r3, [r8, r1]
    add r2, r0, fp
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    and r0, r0, #0x1
    ldrh r2, [r8, r2]
    mvn r1, r1
    mvn r0, r0
    and r1, r2, r1
    tst r1, r0
    beq .L_110
    add r0, r9, #0x30
    ldr r2, [r0, r8]
    mov r1, sl, lsl #0x1f
    mov r0, r2, lsl #0x2
    and r4, r1, #-2147483648
    mov r3, r7, lsl #0x10
    mov r1, r0, lsr #0x18
    orr r4, r4, #0x4200000
    and r0, r3, #0x1f0000
    orr r0, r4, r0
    orr r0, r0, #0x7e
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r0, r0, #0x1a00
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_110:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_128:
    ldr r0, [r6, #0xd28]
    add r2, r0, #0x1
    str r2, [r6, #0xd28]
    cmp r2, #0x5
    bls .L_34
.L_13c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00001a7e
_LIT4: .word data_ov002_022cf1ac
_LIT5: .word data_ov002_022cf1a4
