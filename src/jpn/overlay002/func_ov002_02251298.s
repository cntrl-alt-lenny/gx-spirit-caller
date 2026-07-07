; func_ov002_02251298 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202df24
        .extern func_0202e1e0
        .extern func_ov002_021c3304
        .extern func_ov002_02253370
        .global func_ov002_02251298
        .arm
func_ov002_02251298:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    ldr r0, _LIT0
    and r2, fp, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    add r9, r0, r1
    add r0, r9, #0x18
    add r8, r0, #0x400
    str r8, [sp]
.L_3c:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_e0
    ldr r0, [r9, #0x14]
    mov r7, #0x0
    mov r5, r7
    cmp r0, #0x0
    bls .L_b0
    ldr sl, [sp]
.L_70:
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_9c
    ldr r1, [sl]
    mov r0, r6
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    addne r7, r7, #0x1
.L_9c:
    ldr r0, [r9, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add sl, sl, #0x4
    bcc .L_70
.L_b0:
    cmp r7, #0x3
    bne .L_e0
    mov r0, fp
    mov r1, fp
    mov r2, r4
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_e0
    mov r0, fp
    mov r1, #0xe
    mov r2, r4
    bl func_ov002_02253370
.L_e0:
    ldr r0, [r9, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r8, r8, #0x4
    bcc .L_3c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
