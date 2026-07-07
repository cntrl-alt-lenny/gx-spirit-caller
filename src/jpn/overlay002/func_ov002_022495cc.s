; func_ov002_022495cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202e1e0
        .extern func_ov002_02253370
        .global func_ov002_022495cc
        .arm
func_ov002_022495cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r0
    ldr r0, _LIT0
    and r2, r9, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr r5, _LIT3
    add r8, r0, r1
    ldr sl, _LIT4
    add r7, r8, #0x260
    mov fp, #0xd
    add r4, r5, #0x1
.L_254:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_2c0
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    cmp r5, r0, lsr #0x13
    mov r1, r0, lsr #0x13
    bcc .L_2a8
    cmp r1, r5
    bcs .L_2c0
    sub r0, r1, sl
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_2b0
    b .L_2c0
    b .L_2c0
    b .L_2c0
    b .L_2c0
.L_2a8:
    cmp r1, r4
    beq .L_2c0
.L_2b0:
    mov r0, r9
    mov r1, fp
    mov r2, r6
    bl func_ov002_02253370
.L_2c0:
    ldr r0, [r8, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x4
    bcc .L_254
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000017ad
_LIT4: .word 0x00001497
