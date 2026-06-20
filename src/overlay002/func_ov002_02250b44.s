; func_ov002_02250b44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .extern func_ov002_021c33e4
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_02250b44
        .arm
func_ov002_02250b44:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r0
    ldr r0, _LIT0
    and r1, r6, #0x1
    mul r4, r1, r0
    ldr r0, _LIT1
    mov r5, r2
    ldr r0, [r0, r4]
    mov r8, #0x0
    cmp r0, #0x0
    bls .L_90
    ldr r0, _LIT2
    mov r7, #0xd
    add sl, r0, r4
    add r9, sl, #0x260
.L_3c:
    ldr r0, [r9]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_7c
    mov r0, r6
    mov r1, r5
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_7c
    mov r0, r6
    mov r1, r7
    mov r2, r8
    bl func_ov002_02253458
.L_7c:
    ldr r0, [sl, #0x10]
    add r8, r8, #0x1
    cmp r8, r0
    add r9, r9, #0x4
    bcc .L_3c
.L_90:
    ldr r0, _LIT3
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_b8
    ldr r1, _LIT4
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_138
.L_b8:
    ldr r0, _LIT5
    mov sl, #0x0
    ldr r0, [r0, r4]
    cmp r0, #0x0
    bls .L_138
    ldr r0, _LIT2
    mov r7, #0xe
    add r9, r0, r4
    add r0, r9, #0x18
    add r8, r0, #0x400
.L_e0:
    ldr r0, [r8]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_124
    mov r0, r6
    mov r1, r6
    mov r2, sl
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_124
    mov r0, r6
    mov r1, r7
    mov r2, sl
    bl func_ov002_02253458
.L_124:
    ldr r0, [r9, #0x14]
    add sl, sl, #0x1
    cmp sl, r0
    add r8, r8, #0x4
    bcc .L_e0
.L_138:
    ldr r0, _LIT6
    mov r8, #0x0
    ldr r0, [r0, r4]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xb
    add r7, r0, r4
    add r4, r7, #0x120
.L_15c:
    ldr r0, [r4]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_19c
    mov r0, r6
    mov r1, r5
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_19c
    mov r0, r6
    mov r1, r9
    mov r2, r8
    bl func_ov002_02253458
.L_19c:
    ldr r0, [r7, #0xc]
    add r8, r8, #0x1
    cmp r8, r0
    add r4, r4, #0x4
    bcc .L_15c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x0000159d
_LIT4: .word 0x0000158b
_LIT5: .word data_ov002_022cf180
_LIT6: .word data_ov002_022cf178
