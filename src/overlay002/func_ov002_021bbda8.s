; func_ov002_021bbda8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202df78
        .global func_ov002_021bbda8
        .arm
func_ov002_021bbda8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r7, #0x0
    ldr r4, _LIT0
    ldr fp, _LIT1
    mov sl, r0
    mov r9, r1
    mov r5, r7
.L_1c:
    and r0, r5, #0x1
    mla r1, r0, fp, r4
    mov r6, #0x0
    add r8, r1, #0x30
.L_2c:
    ldr r0, [r8]
    mov r1, r0, lsl #0x12
    cmp sl, r1, lsr #0x1f
    bne .L_54
    mov r0, r0, lsl #0x13
    mov r1, r9
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    addne r7, r7, #0x1
.L_54:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x14
    ble .L_2c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_1c
    ldr r0, _LIT1
    and r2, sl, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_d0
    ldr r0, _LIT0
    add r5, r0, r1
    add r0, r5, #0x18
    add r4, r0, #0x400
.L_a0:
    ldr r0, [r4]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    addne r7, r7, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_a0
.L_d0:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf180
