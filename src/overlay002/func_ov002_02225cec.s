; func_ov002_02225cec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_ov002_021d7970
        .extern func_ov002_021e27c0
        .global func_ov002_02225cec
        .arm
func_ov002_02225cec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_118
    cmp r0, #0x7f
    beq .L_68
    cmp r0, #0x80
    bne .L_14c
    ldrh r0, [sl, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    ldrh r0, [sl, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_68:
    ldr r0, _LIT1
    ldr r1, [r1, #0x5ac]
    ldr r2, [r0, #0xcec]
    ldr r0, _LIT2
    eor r7, r2, r1
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT3
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_f8
    ldr r0, _LIT4
    mov r4, r6
    add r9, r0, r1
    add r8, r9, #0x120
    mov r5, #0x1
.L_ac:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_e4
    ldrh r0, [sl, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r2, r5
    moveq r2, r4
    mov r0, r7
    bl func_ov002_021d7970
.L_e4:
    ldr r0, [r9, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_ac
.L_f8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x7f
    movge r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_118:
    ldrh r0, [sl, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    ldrh r0, [sl, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_14c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf178
_LIT4: .word data_ov002_022cf16c
