; func_ov002_0224ac6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022cf16c
        .extern func_0202e234
        .extern func_ov002_021b99b4
        .extern func_ov002_021c33e4
        .extern func_ov002_02253458
        .global func_ov002_0224ac6c
        .arm
func_ov002_0224ac6c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r7, _LIT0
    mov sl, r0
    ldr r0, [r7, #0x5d4]
    mov r6, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, sl, #0x1
    mla r9, r1, r0, r2
    ldr r8, _LIT3
    mov r4, r7
    mov fp, #0xe
.L_38:
    ldrb r0, [r7, #0x5dc]
    cmp r0, #0x16
    bne .L_cc
    ldr r1, [r8]
    mov r0, r1, lsl #0xf
    movs r0, r0, lsr #0x1f
    beq .L_cc
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_cc
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_cc
    mov r1, r1, lsl #0x17
    mov r0, sl
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    movs r5, r0
    bmi .L_cc
    add r0, r9, r5, lsl #0x2
    ldr r0, [r0, #0x418]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_cc
    mov r0, sl
    mov r1, sl
    mov r2, r5
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_cc
    mov r0, sl
    mov r1, fp
    mov r2, r5
    bl func_ov002_02253458
.L_cc:
    ldr r0, [r4, #0x5d4]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x1
    add r8, r8, #0x4
    bcc .L_38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022ce884
