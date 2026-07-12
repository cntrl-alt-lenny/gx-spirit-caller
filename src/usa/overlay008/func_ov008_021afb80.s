; func_ov008_021afb80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2cc4
        .extern func_02005d90
        .extern func_02006178
        .extern func_0202b660
        .extern func_0202bacc
        .extern func_020371b8
        .extern func_020943b0
        .extern func_ov008_021aa498
        .extern func_ov008_021ab3a4
        .global func_ov008_021afb80
        .arm
func_ov008_021afb80:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr r4, _LIT0
    mov sl, r2
    smull r3, r6, r4, sl
    mov r2, sl, lsr #0x1f
    add r5, r1, #0x4
    and r1, r5, #0xff
    orr fp, r1, #0x2000
    add r6, r2, r6, asr #0x1
    mov r3, #0x5
    smull r1, r2, r3, r6
    add r8, r0, #0x19
    add r0, sl, sl, lsl #0x2
    str r0, [sp, #0x10]
    sub r0, r5, #0x2
    sub r6, sl, r1
    str r0, [sp, #0x14]
    mvn r0, #0x0
    add r9, r6, r6, lsl #0x2
    ldr r4, _LIT1
    orr fp, fp, #-2147483648
    mov r6, #0x0
    str r0, [sp, #0x18]
.L_60:
    ldr r2, [r4, #0xc0]
    ldr r0, [sp, #0x10]
    mov r1, r6, lsl #0x1
    add r0, r2, r0, lsl #0x1
    ldrh r7, [r1, r0]
    mov r0, r7
    bl func_0202bacc
    cmp r0, #0x0
    bne .L_b8
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    ldr r1, [sp, #0x14]
    str r0, [sp, #0x4]
    mov r0, #0x40
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    add r0, r8, #0x7
    mov r2, #0x1
    mov r3, #0x3
    bl func_ov008_021ab3a4
.L_b8:
    add r0, r8, #0x3
    mov r0, r0, lsl #0x17
    orr r0, fp, r0, lsr #0x7
    str r0, [sp, #0x1c]
    mov r0, r9, lsl #0x3
    add r0, r0, #0xf3
    add r0, r0, #0x200
    orr r0, r0, #0x1400
    strh r0, [sp, #0x20]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x1c
    mov r2, #0x8
    bl func_020943b0
    mov r0, r7
    bl func_0202b660
    cmp r0, #0x0
    ble .L_17c
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_140
    b .L_140
    b .L_138
    b .L_138
    b .L_130
    b .L_128
.L_128:
    mov r3, #0x0
    b .L_144
.L_130:
    mov r3, #0x1
    b .L_144
.L_138:
    mov r3, #0x2
    b .L_144
.L_140:
    mov r3, #0x4
.L_144:
    cmp r3, #0x4
    bge .L_17c
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    add r1, r5, #0x3
    str r0, [sp, #0x4]
    mov r0, #0x40
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    add r0, r8, #0x9
    mov r2, #0x1
    bl func_ov008_021ab3a4
.L_17c:
    bl func_02006178
    cmp r0, #0x0
    beq .L_1fc
    ldrh r0, [r4, #0xaa]
    cmp r0, #0x0
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_1fc
    add r0, r8, #0x9
    add r1, r5, #0x3
    add r2, r8, #0x1d
    add r3, r5, #0x1d
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_1fc
    ldrh r3, [r4]
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    sub r3, sl, r3
    add r2, r6, #0x1
    strh r3, [r4, #0x2]
    strh r2, [r4, #0x4]
    ldrh r2, [r4, #0x2]
    cmp r1, r2
    ldreqh r1, [r4, #0x4]
    cmpeq r0, r1
    beq .L_1fc
    ldr r1, [sp, #0x18]
    mov r0, #0x38
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1fc:
    add r8, r8, #0x1a
    add r9, r9, #0x1
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_60
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov008_021b2cc4
_LIT2: .word 0x000001f2
