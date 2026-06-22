; func_ov002_0221d0d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bbc58
        .extern func_ov002_021c8470
        .extern func_ov002_021d5a08
        .extern func_ov002_0225764c
        .global func_ov002_0221d0d8
        .arm
func_ov002_0221d0d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r5, _LIT0
    mov sl, r0
    ldr r0, _LIT1
    ldr r8, _LIT2
    mov r9, #0x0
    sub r7, r5, #0x71
    add r6, r0, #0x134
    add r4, r5, #0x2d4
    mov fp, #0x2
.L_2c:
    mov r0, sl
    ldrh r1, [sl, #0x2]
    mov r2, r9
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_114
    ldrh r2, [sl]
    mov r1, #0x0
    cmp r2, r7
    bgt .L_74
    cmp r2, r6
    bge .L_c4
    ldr r0, _LIT1
    cmp r2, r0
    beq .L_94
    b .L_e8
.L_74:
    cmp r2, r5
    bgt .L_88
    ldreq r0, _LIT3
    ldreq r1, [r0, #0xce8]
    b .L_e8
.L_88:
    cmp r2, r4
    beq .L_cc
    b .L_e8
.L_94:
    ldrh r0, [sl, #0x2]
    mov r1, r9
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8470
    ldr r2, _LIT4
    smull r3, r1, r2, r0
    mov r0, r0, lsr #0x1f
    add r1, r0, r1, asr #0x1
    cmp r1, r8
    movge r1, r8
    b .L_e8
.L_c4:
    ldrh r1, [sl, #0x8]
    b .L_e8
.L_cc:
    ldrh r0, [sl, #0x2]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbc58
    mov r1, #0xc8
    mul r1, r0, r1
.L_e8:
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str fp, [sp]
    str r0, [sp, #0x4]
    mov r0, sl
    ldrh r1, [sl, #0x2]
    mov r2, r9
    ldrh r3, [sl]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d5a08
.L_114:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_2c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000015ae
_LIT1: .word 0x00001409
_LIT2: .word 0x0000ffff
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x66666667
