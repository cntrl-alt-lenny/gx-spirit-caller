; func_ov002_022bc688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccee4
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_020a9698
        .extern func_ov002_021afab0
        .extern func_ov002_022bda78
        .global func_ov002_022bc688
        .arm
func_ov002_022bc688:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_2c0
    b .L_2c
    b .L_5c
    b .L_128
    b .L_280
    b .L_2a0
.L_2c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    ldr r0, [r4, #0xc58]
    cmp r0, #0x5
    movgt r1, #0x1
    str r1, [r4, #0xcfc]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_2c0
.L_5c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x2d
    blt .L_2c0
    ldr r0, [r4, #0xcfc]
    ldr r2, [r4, #0xc58]
    cmp r0, #0x0
    orrne r2, r2, #0x100
    bne .L_84
    cmp r2, #0x5
    movgt r2, #0x5
.L_84:
    mov r3, #0x0
    ldr r0, _LIT1
    str r3, [sp]
    mov r1, #0x37
    bl func_ov002_022bda78
    ldr r0, [r4, #0xcfc]
    ldr r7, [r4, #0xc58]
    cmp r0, #0x0
    beq .L_b0
    cmp r7, #0x3
    movge r7, #0x3
.L_b0:
    add r0, r4, #0x124
    ldr r2, [r4, #0xc5c]
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a9698
    cmp r7, #0x0
    mov r5, #0x0
    ble .L_114
    add r0, r4, #0x124
    ldr r8, _LIT2
    mov r6, r5
    add r9, r0, #0x800
.L_e0:
    mov r0, r5
    bl func_ov002_021afab0
    ldr r1, [r0]
    add r0, r6, #0x28
    mov r2, r1, lsl #0x13
    mov r1, r8
    mov r2, r2, lsr #0x13
    add r0, r9, r0
    bl func_020a9698
    add r5, r5, #0x1
    cmp r5, r7
    add r6, r6, #0x28
    blt .L_e0
.L_114:
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_2c0
.L_128:
    ldr r0, [r4, #0xcfc]
    ldr r7, [r4, #0xc58]
    cmp r0, #0x0
    ldr r6, _LIT1
    beq .L_14c
    mov r0, #0x14
    mul r0, r7, r0
    add r1, r0, #0x3c
    b .L_158
.L_14c:
    cmp r7, #0x0
    moveq r1, #0x4b
    movne r1, #0x69
.L_158:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x5
    bne .L_17c
    mov r0, #0x3d
    sub r1, r0, #0x3e
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_198
.L_17c:
    cmp r0, r1
    bne .L_198
    mov r0, #0x3e
    sub r1, r0, #0x3f
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_198:
    ldr r0, [r4, #0xcfc]
    cmp r0, #0x0
    beq .L_230
    cmp r7, #0x3
    ble .L_230
    ldr lr, [r4, #0xc64]
    ldr r1, _LIT3
    mov r3, lr, lsr #0x1f
    smull r0, ip, r1, lr
    smull r0, r5, r1, lr
    add ip, r3, ip, asr #0x3
    mov r2, #0x14
    smull r0, r1, r2, ip
    add r5, r3, r5, asr #0x3
    subs ip, lr, r0
    bne .L_230
    cmp r5, #0x3
    blt .L_230
    cmp r5, r7
    bge .L_230
    mov r0, r5
    bl func_ov002_021afab0
    ldr r2, _LIT4
    mov r3, #0x3
    smull r1, r7, r2, r5
    add r7, r7, r5, lsr #0x1f
    smull r2, r1, r3, r7
    add r1, r4, #0x124
    sub r7, r5, r2
    ldr r0, [r0]
    add r2, r1, #0x800
    mov r3, r0, lsl #0x13
    add r1, r7, #0x1
    mov r0, #0x28
    mla r0, r1, r0, r2
    ldr r1, _LIT2
    mov r2, r3, lsr #0x13
    bl func_020a9698
.L_230:
    mov r1, #0x0
.L_234:
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_250
    ldr r0, [r6, #0x4]
    cmp r0, #0x37
    moveq r0, #0x1
    beq .L_264
.L_250:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r6, r6, #0x8
    blt .L_234
    mov r0, #0x0
.L_264:
    cmp r0, #0x0
    bne .L_2c0
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_2c0
.L_280:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_2c0
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_2c0
.L_2a0:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2c0:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d1a18
_LIT1: .word data_ov002_022d281c
_LIT2: .word data_ov002_022ccee4
_LIT3: .word 0x66666667
_LIT4: .word 0x55555556
