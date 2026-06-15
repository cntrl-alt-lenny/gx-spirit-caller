; func_ov021_021ab150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c72f0
        .extern data_ov021_021ace58
        .extern func_020211c8
        .extern func_0202147c
        .extern func_02021660
        .extern func_020216b0
        .extern func_0202227c
        .extern func_020a978c
        .extern func_ov021_021aba18
        .extern func_ov021_021abaa0
        .extern func_ov021_021abb6c
        .extern func_ov021_021abbc8
        .global func_ov021_021ab150
        .arm
func_ov021_021ab150:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, [sl]
    cmp r0, #0x0
    bne .L_24
    ldr r0, _LIT0
    bl func_020211c8
    str r0, [sl]
    bl func_0202147c
.L_24:
    mov r2, #0x0
    mov r1, r2
.L_2c:
    add r0, sl, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x9c]
    cmp r2, #0xa
    blt .L_2c
    str r1, [sl, #0x18c]
    mov r0, sl
    str r1, [sl, #0x190]
    bl func_ov021_021aba18
    mov r0, sl
    bl func_ov021_021abaa0
    ldr r0, [sl]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    ldr r2, [sl, #0x44]
    mov r1, #0x48
    sub r3, r2, #0x2
    mul r2, r3, r1
    mov r1, #0x3
    mov r4, r0
    bl func_020216b0
    ldr r0, [sl, #0x48]
    mov r1, #0x4
    cmp r0, #0x0
    moveq r2, #0x38
    mvnne r2, #0x37
    mov r0, r4
    bl func_020216b0
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x2
    bl func_020216b0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x11
    bl func_020216b0
    ldr r0, [sl]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x0
    bl func_020216b0
    mov r8, #0x0
    ldr r5, _LIT1
    mov r7, r8
    mvn r6, #0x37
    mov fp, #0x5
    mov r4, #0x48
.L_f4:
    ldr r0, [sl]
    mov r1, #0x3
    add r2, r8, #0x5
    bl func_02021660
    add r2, sl, r8, lsl #0x2
    ldr r2, [r2, #0x74]
    mov r1, #0x2
    mov r9, r0
    bl func_020216b0
    smull r2, r3, r5, r8
    mov r2, r8, lsr #0x1f
    add r3, r2, r3, asr #0x1
    smull r2, r3, fp, r3
    sub r3, r8, r2
    sub r3, r3, #0x2
    mul r2, r3, r4
    mov r0, r9
    mov r1, #0x3
    bl func_020216b0
    smull r0, r1, r5, r8
    mov r0, r8, lsr #0x1f
    adds r1, r0, r1, asr #0x1
    moveq r2, #0x38
    movne r2, r6
    mov r0, r9
    mov r1, #0x4
    bl func_020216b0
    mov r0, r9
    mov r1, #0x5
    mov r2, #0x0
    bl func_020216b0
    mov r0, r9
    mov r1, #0xc
    mov r2, r7
    bl func_020216b0
    mov r0, r9
    mov r1, #0x0
    mov r2, #0x15
    bl func_020216b0
    ldr r0, [sl]
    mov r1, #0x3
    add r2, r8, #0x5
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x1f
    bl func_020216b0
    add r8, r8, #0x1
    add r7, r7, #0x3
    cmp r8, #0xa
    blt .L_f4
    mov r9, #0x0
    mov r8, #0x3
    ldr r4, _LIT2
    mov r6, #0x2
    mov r5, r9
    mov fp, r8
.L_1d4:
    ldr r0, [sl]
    mov r1, r8
    add r2, r9, #0xf
    bl func_02021660
    mov r7, r0
    mov r1, r6
    mov r2, r9
    bl func_020216b0
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_020216b0
    ldr r0, [sl]
    mov r1, fp
    add r2, r9, #0xf
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x0
    bl func_020216b0
    add r9, r9, #0x1
    cmp r9, #0x6
    blt .L_1d4
    mov r7, #0x0
    ldr r4, _LIT3
    add r6, sl, #0xc4
    mov r5, r7
.L_23c:
    mov r0, r7
    mov r1, r6
    bl func_0202227c
    cmp r7, #0x0
    strb r5, [r6]
    moveq r2, r5
    addne r0, sl, r7, lsl #0x2
    ldrne r2, [r0, #0x5c]
    mov r0, r6
    mov r1, r4
    bl func_020a978c
    add r7, r7, #0x1
    cmp r7, #0x6
    add r6, r6, #0x20
    blt .L_23c
    mov r2, #0x3c
    mov r0, sl
    mov r1, #0x1
    str r2, [sl, #0x50]
    bl func_ov021_021abb6c
    mov r0, sl
    bl func_ov021_021abbc8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c72f0
_LIT1: .word 0x66666667
_LIT2: .word 0x00000101
_LIT3: .word data_ov021_021ace58
