; func_ov002_022531bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_0202ed90
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_022531bc
        .arm
func_ov002_022531bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    movs r8, r2
    ldr r0, _LIT0
    and r2, r4, #0x1
    bne .L_98
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r8, #0xe
    add r7, r0, r1
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_44:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_80
    mov r0, r9
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_80
    mov r0, r4
    mov r1, r8
    mov r2, r5
    bl func_ov002_02253458
.L_80:
    ldr r0, [r7, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_98:
    mul r1, r2, r0
    ldr r0, _LIT3
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_c0:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e234
    cmp r0, #0x0
    beq .L_120
    mov r0, sl
    bl func_0202b8a8
    cmp r0, r8, lsr #0x1
    bhi .L_120
    mov r0, sl
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_120
    mov r0, r4
    mov r1, sl
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_120
    mov r0, r4
    mov r1, r9
    mov r2, r7
    bl func_ov002_02253458
.L_120:
    ldr r0, [r6, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_c0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf17c
