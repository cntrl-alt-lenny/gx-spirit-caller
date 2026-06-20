; func_ov002_0224c69c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern func_0202df78
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021ca3f0
        .extern func_ov002_02253458
        .global func_ov002_0224c69c
        .arm
func_ov002_0224c69c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r3, _LIT0
    mov r5, r0
    cmp r1, r3
    bgt .L_50
    bge .L_7c
    ldr r2, _LIT1
    cmp r1, r2
    bgt .L_40
    sub r0, r2, #0x1
    cmp r1, r0
    blt .L_80
    beq .L_74
    cmp r1, r2
    ldreq r8, _LIT2
    b .L_80
.L_40:
    add r0, r2, #0x6c
    cmp r1, r0
    addeq r8, r2, #0x6b
    b .L_80
.L_50:
    ldr r2, _LIT3
    cmp r1, r2
    bgt .L_64
    subeq r8, r2, #0xb
    b .L_80
.L_64:
    add r0, r2, #0x55
    cmp r1, r0
    addeq r8, r2, #0x4d
    b .L_80
.L_74:
    sub r8, r3, #0x39c
    b .L_80
.L_7c:
    sub r8, r3, #0x1b
.L_80:
    mov r0, r5
    mov r1, r8
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT4
    and r1, r5, #0x1
    mul r4, r1, r0
    ldr r0, _LIT5
    mov r7, #0x0
    ldr r0, [r0, r4]
    cmp r0, #0x0
    bls .L_104
    ldr r0, _LIT6
    mov r6, #0xd
    add sl, r0, r4
    add r9, sl, #0x260
.L_c4:
    ldr r0, [r9]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_f0
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_ov002_02253458
.L_f0:
    ldr r0, [sl, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r9, r9, #0x4
    bcc .L_c4
.L_104:
    ldr r0, _LIT7
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_12c
    ldr r1, _LIT8
    mov r0, r5
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_194
.L_12c:
    ldr r0, _LIT9
    mov sl, #0x0
    ldr r0, [r0, r4]
    cmp r0, #0x0
    bls .L_194
    ldr r0, _LIT6
    mov r6, #0xe
    add r9, r0, r4
    add r0, r9, #0x18
    add r7, r0, #0x400
.L_154:
    ldr r0, [r7]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_180
    mov r0, r5
    mov r1, r6
    mov r2, sl
    bl func_ov002_02253458
.L_180:
    ldr r0, [r9, #0x14]
    add sl, sl, #0x1
    cmp sl, r0
    add r7, r7, #0x4
    bcc .L_154
.L_194:
    ldr r0, _LIT10
    mov r7, #0x0
    ldr r0, [r0, r4]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT6
    mov r9, #0xb
    add r6, r0, r4
    add r4, r6, #0x120
.L_1b8:
    ldr r0, [r4]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_1e4
    mov r0, r5
    mov r1, r9
    mov r2, r7
    bl func_ov002_02253458
.L_1e4:
    ldr r0, [r6, #0xc]
    add r7, r7, #0x1
    cmp r7, r0
    add r4, r4, #0x4
    bcc .L_1b8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00001713
_LIT1: .word 0x00001611
_LIT2: .word 0x00000fc9
_LIT3: .word 0x0000195c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf17c
_LIT6: .word data_ov002_022cf16c
_LIT7: .word 0x0000159d
_LIT8: .word 0x0000158b
_LIT9: .word data_ov002_022cf180
_LIT10: .word data_ov002_022cf178
