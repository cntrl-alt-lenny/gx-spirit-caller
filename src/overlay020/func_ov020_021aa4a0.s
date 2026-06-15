; func_ov020_021aa4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern func_0202b100
        .extern func_0202c208
        .extern func_0202c228
        .extern func_020a6a00
        .extern func_020a6afc
        .global func_ov020_021aa4a0
        .arm
func_ov020_021aa4a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, r1
    ldrsb r1, [r5]
    mov r6, r0
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_1d0
    ldr r7, _LIT0
    mov fp, #0x64
.L_24:
    ldr r0, [r7, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_60
    tst r1, #0x80
    beq .L_60
    cmp r6, #0x0
    beq .L_54
    strb r1, [r6]
    ldrsb r0, [r5, #0x1]
    strb r0, [r6, #0x1]
    add r6, r6, #0x2
.L_54:
    add r5, r5, #0x2
    add r4, r4, #0x2
    b .L_1c4
.L_60:
    cmp r1, #0x40
    bne .L_1b4
    ldrsb r0, [r5, #0x1]
    cmp r0, #0x61
    beq .L_f8
    cmp r0, #0x63
    beq .L_88
    cmp r0, #0x74
    beq .L_14c
    b .L_1a0
.L_88:
    ldrsb r0, [r5, #0x3]
    ldrsb r2, [r5, #0x2]
    ldrsb r3, [r5, #0x4]
    sub r0, r0, #0x30
    mul r1, r0, fp
    sub r2, r2, #0x30
    mov r0, #0x3e8
    mla r1, r2, r0, r1
    sub r2, r3, #0x30
    mov r0, #0xa
    ldrsb r3, [r5, #0x5]
    mla r8, r2, r0, r1
    sub r9, r3, #0x30
    add r0, r9, r8
    bl func_0202b100
    bl func_020a6a00
    mov sl, r0
    cmp r6, #0x0
    beq .L_ec
    add r0, r9, r8
    bl func_0202b100
    mov r1, r0
    mov r0, r6
    bl func_020a6afc
    add r6, r6, sl
.L_ec:
    add r4, r4, sl
    add r5, r5, #0x6
    b .L_1c4
.L_f8:
    ldrsb r0, [r5, #0x2]
    ldrsb r2, [r5, #0x3]
    sub r1, r0, #0x30
    mov r0, #0xa
    mul r8, r1, r0
    sub r9, r2, #0x2f
    add r0, r9, r8
    bl func_0202c228
    bl func_020a6a00
    mov sl, r0
    cmp r6, #0x0
    beq .L_140
    add r0, r9, r8
    bl func_0202c228
    mov r1, r0
    mov r0, r6
    bl func_020a6afc
    add r6, r6, sl
.L_140:
    add r4, r4, sl
    add r5, r5, #0x4
    b .L_1c4
.L_14c:
    ldrsb r0, [r5, #0x2]
    ldrsb r2, [r5, #0x3]
    sub r1, r0, #0x30
    mov r0, #0xa
    mul r8, r1, r0
    sub r9, r2, #0x2f
    add r0, r9, r8
    bl func_0202c208
    bl func_020a6a00
    mov sl, r0
    cmp r6, #0x0
    beq .L_194
    add r0, r9, r8
    bl func_0202c208
    mov r1, r0
    mov r0, r6
    bl func_020a6afc
    add r6, r6, sl
.L_194:
    add r4, r4, sl
    add r5, r5, #0x4
    b .L_1c4
.L_1a0:
    cmp r6, #0x0
    strneb r1, [r6], #0x1
    add r5, r5, #0x1
    add r4, r4, #0x1
    b .L_1c4
.L_1b4:
    cmp r6, #0x0
    strneb r1, [r6], #0x1
    add r5, r5, #0x1
    add r4, r4, #0x1
.L_1c4:
    ldrsb r1, [r5]
    cmp r1, #0x0
    bne .L_24
.L_1d0:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
