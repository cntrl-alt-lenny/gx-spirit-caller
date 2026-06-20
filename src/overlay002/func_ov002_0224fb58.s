; func_ov002_0224fb58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern data_ov002_022cf184
        .extern func_0202eac8
        .extern func_ov002_021ca3f0
        .extern func_ov002_021ca698
        .extern func_ov002_0223c72c
        .extern func_ov002_0223c918
        .extern func_ov002_02253458
        .global func_ov002_0224fb58
        .arm
func_ov002_0224fb58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    cmp r2, #0x0
    bne .L_ac
    ldr r0, _LIT0
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    mov r8, #0xc
    add r6, r0, r1
    add r5, r6, #0x3a0
.L_40:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202eac8
    cmp r0, #0x0
    beq .L_94
    mov r0, r7
    mov r1, r9
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    beq .L_94
    mov r0, r7
    mov r1, r9
    bl func_ov002_0223c918
    cmp r0, #0x0
    beq .L_94
    mov r0, r7
    mov r1, r8
    mov r2, r4
    bl func_ov002_02253458
.L_94:
    ldr r0, [r6, #0x18]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_ac:
    mov r6, #0x0
    mov r4, r6
    mov r5, r6
.L_b8:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_0223c72c
    cmp r0, #0x0
    beq .L_e0
    mov r0, r7
    mov r1, r6
    mov r2, r4
    bl func_ov002_02253458
.L_e0:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_b8
    mov r0, r7
    mov r1, r7
    bl func_ov002_021ca698
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT0
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT3
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    mov r5, #0xe
    add r8, r0, r1
    mov r6, r5
.L_130:
    mov r0, r7
    mov r1, r6
    mov r2, r4
    bl func_ov002_0223c72c
    cmp r0, #0x0
    beq .L_158
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov002_02253458
.L_158:
    ldr r0, [r8, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_130
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf184
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf180
