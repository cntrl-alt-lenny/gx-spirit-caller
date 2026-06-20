; func_ov002_0224cac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern func_0202df78
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_02253458
        .global func_ov002_0224cac4
        .arm
func_ov002_0224cac4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, _LIT0
    mov r4, r0
    cmp r1, r2
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul sl, r1, r0
    ldr r0, _LIT2
    ldreq r7, _LIT3
    ldr r0, [r0, sl]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_84
    ldr r0, _LIT4
    mov r5, #0xd
    add r9, r0, sl
    add r8, r9, #0x260
.L_44:
    ldr r0, [r8]
    mov r1, r7
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_70
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02253458
.L_70:
    ldr r0, [r9, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_44
.L_84:
    ldr r0, _LIT5
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_ac
    ldr r1, _LIT6
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_ac:
    ldr r0, _LIT7
    mov r8, #0x0
    ldr r0, [r0, sl]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT4
    mov r9, #0xe
    add r6, r0, sl
    add r0, r6, #0x18
    add r5, r0, #0x400
.L_d4:
    ldr r0, [r5]
    mov r1, r7
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_100
    mov r0, r4
    mov r1, r9
    mov r2, r8
    bl func_ov002_02253458
.L_100:
    ldr r0, [r6, #0x14]
    add r8, r8, #0x1
    cmp r8, r0
    add r5, r5, #0x4
    bcc .L_d4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00001629
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
_LIT3: .word 0x00001377
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x0000159d
_LIT6: .word 0x0000158b
_LIT7: .word data_ov002_022cf180
