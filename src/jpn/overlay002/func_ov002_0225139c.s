; func_ov002_0225139c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a4
        .extern func_0202df24
        .extern func_ov002_021b3ef8
        .extern func_ov002_02253370
        .global func_ov002_0225139c
        .arm
func_ov002_0225139c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r8, r1, r0
    ldr r0, _LIT1
    mov r9, r2
    ldr r0, [r0, r8]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_b0
    ldr r0, _LIT2
    ldr fp, _LIT3
    add r7, r0, r8
    add r6, r7, #0x260
    mov r4, #0xb
.L_40:
    ldr r1, [r6]
    mov r0, r9
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_9c
    ldr r2, [r6]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov ip, r1, lsl #0x1
    mov r1, r4
    mov r2, fp
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_9c
    mov r0, sl
    mov r1, #0xd
    mov r2, r5
    bl func_ov002_02253370
.L_9c:
    ldr r0, [r7, #0x10]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_40
.L_b0:
    ldr r0, _LIT4
    mov r6, #0x0
    ldr r0, [r0, r8]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov r7, #0xc
    add r5, r0, r8
    add r4, r5, #0x3a0
.L_d4:
    ldr r1, [r4]
    mov r0, r9
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_100
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_02253370
.L_100:
    ldr r0, [r5, #0x18]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_d4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000012a1
_LIT4: .word data_ov002_022cf0a4
