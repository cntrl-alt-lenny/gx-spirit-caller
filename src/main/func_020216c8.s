; func_020216c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020212cc
        .extern func_0202142c
        .extern func_0202147c
        .extern func_02021c0c
        .extern func_02021cd8
        .extern func_02022430
        .extern func_020224c0
        .extern func_0202359c
        .extern func_020240bc
        .extern func_02024630
        .extern func_02027180
        .extern func_0202884c
        .extern func_0202a320
        .global func_020216c8
        .arm
func_020216c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r2, #0x0
    str r0, [sp]
    str r2, [r0, #0x4]
    cmp r2, #0x8
    bge .L_258
.L_1c:
    ldr r0, [sp]
    ldr r1, _LIT0
    add r0, r0, #0x34
    mla sl, r2, r1, r0
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    beq .L_23c
    ldr r0, [sl]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_23c
    ldr r1, [sl, #0x14]
    mov r0, #0x0
    str r0, [sp, #0x4]
    cmp r1, #0x0
    ble .L_1f8
    add r7, sl, #0x18
    mov r4, r0
    mov fp, r0
.L_68:
    ldr r0, [sl]
    ldr r5, [r7, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_104
    mov r6, #0x0
.L_80:
    add r0, r5, r6, lsl #0x2
    ldr r8, [r0, #0x48]
    cmp r8, #0x0
    beq .L_f8
    ldr r9, [r8]
    ldr r0, [r8, #0x4]
    mov r1, r9, lsr #0x10
    and r1, r1, #0xff
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r5
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r3, r0, asr #0x10
    mov r0, r5
    mov r1, r9, lsr #0x8
    and r1, r1, #0xff
    and r2, r9, #0xff
    bl func_02022430
    cmp r0, #0x0
    beq .L_f8
    ldr r0, [r8, #0x8]
    mov r6, fp
    str r0, [r5]
.L_e0:
    add r0, r5, r6, lsl #0x2
    add r6, r6, #0x1
    str r4, [r0, #0x48]
    cmp r6, #0x4
    blt .L_e0
    str r4, [r5, #0x4]
.L_f8:
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_80
.L_104:
    ldr r0, [r7]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_1d0
    b .L_130
    b .L_18c
    b .L_198
    b .L_1a4
    b .L_1b0
    b .L_1bc
    b .L_1c8
.L_130:
    ldr r6, [r5]
    ldr r0, [r6]
    mov r0, r0, lsr #0x18
    cmp r0, #0xf0
    beq .L_168
.L_144:
    mov r0, r5
    bl func_02021cd8
    cmp r0, #0x0
    bne .L_168
    ldr r0, [r5]
    ldr r0, [r0]
    mov r0, r0, lsr #0x18
    cmp r0, #0xf0
    bne .L_144
.L_168:
    ldr r0, [r5]
    cmp r0, r6
    movne r0, #0x0
    strne r0, [r5, #0x4]
    bne .L_1d0
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    b .L_1d0
.L_18c:
    ldr r0, [r7, #0x4]
    bl func_0202359c
    b .L_1d0
.L_198:
    ldr r0, [r7, #0x4]
    bl func_020240bc
    b .L_1d0
.L_1a4:
    ldr r0, [r7, #0x4]
    bl func_02024630
    b .L_1d0
.L_1b0:
    ldr r0, [r7, #0x4]
    bl func_02027180
    b .L_1d0
.L_1bc:
    ldr r0, [r7, #0x4]
    bl func_0202884c
    b .L_1d0
.L_1c8:
    ldr r0, [r7, #0x4]
    bl func_0202a320
.L_1d0:
    ldr r0, [sl, #0x8]
    tst r0, #0x8
    bne .L_1f8
    ldr r0, [sp, #0x4]
    ldr r1, [sl, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, r1
    add r7, r7, #0xc
    blt .L_68
.L_1f8:
    ldr r0, [sl, #0x8]
    tst r0, #0x1
    beq .L_210
    mov r0, sl
    bl func_020212cc
    b .L_234
.L_210:
    tst r0, #0x4
    beq .L_224
    mov r0, sl
    bl func_0202147c
    b .L_234
.L_224:
    tst r0, #0x2
    beq .L_234
    mov r0, sl
    bl func_0202142c
.L_234:
    mov r0, #0x0
    str r0, [sl, #0x8]
.L_23c:
    ldr r0, [sp]
    ldr r0, [r0, #0x4]
    add r2, r0, #0x1
    ldr r0, [sp]
    cmp r2, #0x8
    str r2, [r0, #0x4]
    blt .L_1c
.L_258:
    bl func_02021c0c
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000618
