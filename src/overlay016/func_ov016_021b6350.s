; func_ov016_021b6350 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov000_021b1d4c
        .extern data_ov016_021b9374
        .extern data_ov016_021b937e
        .extern data_ov016_021bab44
        .extern data_ov016_021bac38
        .extern data_ov016_021bb2c4
        .extern func_ov005_021aaea8
        .extern func_ov016_021b287c
        .extern func_ov016_021b2a8c
        .extern func_ov016_021b3560
        .extern func_ov016_021b3594
        .extern func_ov016_021b6074
        .extern func_ov016_021b8040
        .global func_ov016_021b6350
        .arm
func_ov016_021b6350:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldr r0, _LIT0
    ldr r4, _LIT1
    bl func_ov016_021b8040
    ldr r6, _LIT2
    mov r7, #0x0
    mov r0, r6
    bl func_ov016_021b287c
    cmp r0, #0x0
    beq .L_40
    ldr r0, _LIT3
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r7, #0x1
.L_40:
    mvn r5, #0x0
    str r5, [sp]
    ldr r0, _LIT4
    mov r2, r7
    mov r3, r6
    mov r1, #0xe
    str r5, [sp, #0x4]
    bl func_ov016_021b3594
    ldr r5, _LIT5
    mov r6, #0x0
    mov r0, r5
    bl func_ov016_021b287c
    cmp r0, #0x0
    beq .L_88
    ldr r0, _LIT3
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r6, #0x1
.L_88:
    mvn r1, #0x0
    str r1, [sp]
    ldr r0, _LIT6
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x4]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    mov r2, r6
    mov r3, r5
    add r1, r1, #0x15
    bl func_ov016_021b3594
    ldr r0, [sl, #0x8]
    cmp r0, #0x6
    ble .L_170
    ldr r0, [r4, #0x18]
    mov r1, #0x2
    cmp r0, #0x2
    mov r0, #0x8
    str r0, [sp]
    mov r2, #0x0
    str r1, [sp, #0x4]
    mov r3, #0x1
    str r3, [sp, #0x8]
    ldr r0, _LIT4
    moveq r2, #0x1
    mov r3, #0xe8
    bl func_ov016_021b3560
    ldr r0, [r4, #0x18]
    mov r2, #0x0
    cmp r0, #0x3
    mov r0, #0x83
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    ldr r0, _LIT4
    moveq r2, #0x1
    mov r1, #0x3
    mov r3, #0xe8
    bl func_ov016_021b3560
    ldr r0, [r4, #0x18]
    mov r5, #0x0
    cmp r0, #0x1
    mov r0, r4
    moveq r5, #0x1
    bl func_ov005_021aaea8
    str r0, [sp]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r4, #0x1
    ldr r0, _LIT4
    mov r2, r5
    mov r1, #0x4
    mov r3, #0xe8
    str r4, [sp, #0x8]
    bl func_ov016_021b3560
.L_170:
    ldr r1, [sl, #0x10]
    mov r0, #0x18
    mul r0, r1, r0
    add r0, r0, #0x8
    str r0, [sp]
    mov r2, #0x2
    mov r1, #0x0
    str r2, [sp, #0x4]
    mov r4, #0x1
    ldr r0, _LIT4
    sub r2, r1, #0x1
    mov r3, #0x84
    str r4, [sp, #0x8]
    bl func_ov016_021b3560
    mov r5, #0x2
    mov r9, #0x0
    mov r7, #0xd
    mov r8, #0xc
    mov r6, #0xa0
    ldr r4, _LIT4
    mov fp, r5
    b .L_2fc
.L_1c8:
    str r6, [sp]
    ldr r2, [sl, #0xc]
    mov r0, #0x15
    add r2, r2, r9
    mov ip, r2, lsr #0x1f
    rsb r2, ip, r2, lsl #0x1d
    add ip, ip, r2, ror #0x1d
    mov r2, #0xc
    mul r2, ip, r2
    add r2, r2, #0x27c
    mov r2, r2, lsl #0x10
    mov r1, r7
    mov r3, #0x5
    mov r2, r2, lsr #0x10
    bl func_ov016_021b2a8c
    str r7, [sp]
    str r5, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, r4
    mov r1, #0x7
    mov r2, #0x0
    mov r3, #0xd3
    bl func_ov016_021b3560
    ldr r3, [sl, #0xc]
    mov r0, #0xd3
    add r3, r3, r9
    mov ip, r3, lsr #0x1f
    rsb r3, ip, r3, lsl #0x1d
    add r3, ip, r3, ror #0x1d
    add r3, r3, r3, lsl #0x1
    mov r1, r8
    mov r2, #0x2
    add r3, r3, #0x2
    bl func_ov016_021b6074
    stmia sp, {r7, fp}
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, r4
    mov r1, #0x6
    mov r2, #0x0
    mov r3, #0xb9
    bl func_ov016_021b3560
    ldr r3, [sl, #0xc]
    mov r0, #0xb9
    add r3, r3, r9
    mov ip, r3, lsr #0x1f
    rsb r3, ip, r3, lsl #0x1d
    add r3, ip, r3, ror #0x1d
    add r3, r3, r3, lsl #0x1
    mov r1, r8
    mov r2, #0x2
    add r3, r3, #0x1
    bl func_ov016_021b6074
    str r7, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x0
    mov r3, #0x9f
    bl func_ov016_021b3560
    ldr r3, [sl, #0xc]
    mov r0, #0x9f
    add r3, r3, r9
    mov ip, r3, lsr #0x1f
    rsb r3, ip, r3, lsl #0x1d
    add r3, ip, r3, ror #0x1d
    mov r1, r8
    mov r2, #0x2
    add r3, r3, r3, lsl #0x1
    bl func_ov016_021b6074
    add r7, r7, #0x18
    add r8, r8, #0x18
    add r9, r9, #0x1
.L_2fc:
    ldr r0, [sl, #0x8]
    cmp r0, #0x6
    movgt r0, #0x6
    cmp r9, r0
    blt .L_1c8
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov016_021bb2c4
_LIT1: .word data_ov000_021b1d4c
_LIT2: .word data_ov016_021b9374
_LIT3: .word data_ov016_021bac38
_LIT4: .word data_ov016_021bab44
_LIT5: .word data_ov016_021b937e
_LIT6: .word data_02104f4c
