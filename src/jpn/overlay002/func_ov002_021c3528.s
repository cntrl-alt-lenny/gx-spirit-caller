; func_ov002_021c3528 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf1a8
        .extern func_0202e2bc
        .extern func_02030538
        .extern func_020307b4
        .extern func_ov002_021b3dec
        .extern func_ov002_021bb82c
        .extern func_ov002_021bbdac
        .extern func_ov002_021ca310
        .extern func_ov002_021ca360
        .global func_ov002_021c3528
        .arm
func_ov002_021c3528:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    ldr r3, _LIT1
    and r1, r1, #0x1
    mla r3, r1, r3, r4
    mov r7, r2
    add r6, r3, #0x5d0
    ldr r1, [r6, r7, lsl #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x13
    mov r4, r0, lsr #0x13
    mov r0, r4
    bl func_020307b4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_02030538
    cmp r0, #0x0
    beq .L_328
    ldr r0, [r6, r7, lsl #0x2]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_0202e2bc
    cmp r0, #0x0
    beq .L_2ac
    mov r0, r5
    bl func_ov002_021bbdac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_2ac:
    ldr r1, _LIT2
    cmp r4, r1
    beq .L_2c8
    add r0, r1, #0x7c
    cmp r4, r0
    beq .L_2e4
    b .L_340
.L_2c8:
    mov r0, r5
    sub r1, r1, #0xe8
    bl func_ov002_021bb82c
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2e4:
    ldr r0, _LIT1
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT4
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_340
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_328:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ca360
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_340:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ca310
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x000014fc
_LIT3: .word data_ov002_022cf1a8
_LIT4: .word 0x000012f3
