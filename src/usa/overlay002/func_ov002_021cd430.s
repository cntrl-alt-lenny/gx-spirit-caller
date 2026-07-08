; func_ov002_021cd430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0172
        .extern func_ov002_021b1fec
        .extern func_ov002_021b204c
        .extern func_ov002_021b20ac
        .extern func_ov002_0229acd0
        .global func_ov002_021cd430
        .arm
func_ov002_021cd430:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r6, [r1, #0x2]
    ldrh r3, [r1, #0x6]
    tst r0, #0x8000
    ldrh r5, [r1, #0x4]
    mov r4, r3, asr #0x8
    ldr r0, _LIT1
    movne ip, #0x1
    mov r2, r6, asr #0x8
    moveq ip, #0x0
    tst r5, #0x8000
    and r1, r6, #0xff
    and r2, r2, #0xff
    and r0, r5, r0
    and r3, r3, #0xff
    and r4, r4, #0xff
    beq .L_74
    add r1, ip, r1, lsl #0x1
    ldr r2, _LIT2
    mov r4, r1, lsl #0x2
    mov r1, r0, lsl #0x10
    ldrh r0, [r2, r4]
    mov r2, r3
    mov r1, r1, lsr #0x10
    bl func_ov002_021b204c
    b .L_104
.L_74:
    cmp r4, #0x0
    beq .L_a8
    ldr lr, _LIT3
    mov r4, #0x14
    ldr r6, _LIT4
    and ip, ip, #0x1
    mul r5, r1, r4
    mla r4, ip, lr, r6
    mov r1, r0, lsl #0x10
    ldrh r0, [r5, r4]
    mov r1, r1, lsr #0x10
    bl func_ov002_021b20ac
    b .L_104
.L_a8:
    cmp r2, #0x6
    ldr r2, _LIT3
    mov lr, #0x14
    blt .L_e0
    ldr r5, _LIT4
    and ip, ip, #0x1
    mul r4, r1, lr
    mov r1, r0, lsl #0x10
    mla r2, ip, r2, r5
    ldrh r0, [r4, r2]
    mov r2, r3
    mov r1, r1, lsr #0x10
    bl func_ov002_021b1fec
    b .L_104
.L_e0:
    ldr r5, _LIT4
    and ip, ip, #0x1
    mul r4, r1, lr
    mov r1, r0, lsl #0x10
    mla r2, ip, r2, r5
    ldrh r0, [r4, r2]
    mov r2, r3
    mov r1, r1, lsr #0x10
    bl func_ov002_021b204c
.L_104:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00007fff
_LIT2: .word data_ov002_022d0172
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0c6
