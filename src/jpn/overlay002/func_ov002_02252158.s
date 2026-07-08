; func_ov002_02252158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202e1e0
        .extern func_0202ed3c
        .extern func_ov002_021c3304
        .extern func_ov002_02253370
        .global func_ov002_02252158
        .arm
func_ov002_02252158:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_c0
    ldr r0, _LIT2
    mov r8, #0xe
    add r7, r0, r1
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_3c:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_ac
    mov r0, r9
    bl func_0202ed3c
    cmp r0, #0x0
    beq .L_ac
    ldr r0, [r6]
    mov r1, r0, lsl #0xb
    movs r1, r1, lsr #0x1f
    bne .L_ac
    mov r0, r0, lsl #0xc
    movs r0, r0, lsr #0x1f
    beq .L_ac
    mov r0, r4
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_ac
    mov r0, r4
    mov r1, r8
    mov r2, r5
    bl func_ov002_02253370
.L_ac:
    ldr r0, [r7, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_3c
.L_c0:
    rsb r7, r4, #0x1
    ldr r0, _LIT0
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    mov r8, #0x0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xe
    add r6, r0, r2
    add r0, r6, #0x18
    add r5, r0, #0x400
.L_f8:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_168
    mov r0, sl
    bl func_0202ed3c
    cmp r0, #0x0
    beq .L_168
    ldr r0, [r5]
    mov r1, r0, lsl #0xb
    movs r1, r1, lsr #0x1f
    bne .L_168
    mov r0, r0, lsl #0xc
    movs r0, r0, lsr #0x1f
    beq .L_168
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_168
    mov r0, r7
    mov r1, r9
    mov r2, r8
    bl func_ov002_02253370
.L_168:
    ldr r0, [r6, #0x14]
    add r8, r8, #0x1
    cmp r8, r0
    add r5, r5, #0x4
    bcc .L_f8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
