; func_ov002_02255998 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a0
        .extern data_ov002_022d016c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021de480
        .global func_ov002_02255998
        .arm
func_ov002_02255998:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x0
    ldr r4, _LIT0
    str r0, [sp]
    mov fp, r0
.L_18:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0xcec]
    ldr r0, [sp]
    mov r6, #0x0
    eor r5, r2, r0
    and r0, r5, #0x1
    mul r9, r0, r1
.L_38:
    mov r0, r5
    mov r1, r6
    mov r2, sl
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_f8
    mov r7, fp
    add r8, r4, r9
.L_58:
    cmp r7, r6
    beq .L_e8
    mov r0, r5
    mov r1, r7
    bl func_ov002_021b9ecc
    cmp sl, r0
    bne .L_e8
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_e8
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_e8
    mov r0, #0x14
    mul r1, r6, r0
    ldr r2, _LIT3
    mul r0, r7, r0
    add r2, r2, r9
    ldrh r1, [r2, r1]
    ldrh r0, [r2, r0]
    mov r2, #0x0
    cmp r1, r0
    mov r0, r5
    bls .L_d4
    mov r1, r6
    mov r3, r2
    bl func_ov002_021de480
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    mov r1, r7
    mov r3, r2
    bl func_ov002_021de480
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e8:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    blt .L_58
.L_f8:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_38
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_18
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf1a0
