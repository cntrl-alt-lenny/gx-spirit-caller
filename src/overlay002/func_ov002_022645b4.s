; func_ov002_022645b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021d5b80
        .extern func_ov002_021d7970
        .extern func_ov002_021dec2c
        .extern func_ov002_021df6d4
        .global func_ov002_022645b4
        .arm
func_ov002_022645b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r4, _LIT0
    mov r8, r0
    mov r6, #0x0
    mov r5, #0xb
.L_14:
    eor r7, r8, r6
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_178
    ldr r0, _LIT1
    and r1, r7, #0x1
    mul r9, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r9]
    subs r6, r0, #0x1
    bmi .L_c0
    ldr r0, _LIT3
    ldr r4, _LIT0
    add r0, r0, r9
    add r0, r0, #0x120
    add r8, r0, r6, lsl #0x2
    mov sl, #0x0
    mov r5, #0xb
.L_68:
    ldr r2, [r8]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov ip, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r5
    mov r2, r4
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_b4
    mov r0, r7
    mov r1, r4
    bl func_ov002_021df6d4
    mov r0, r7
    mov r1, r6
    mov r2, sl
    bl func_ov002_021d7970
.L_b4:
    sub r8, r8, #0x4
    subs r6, r6, #0x1
    bpl .L_68
.L_c0:
    ldr r0, _LIT3
    ldr r4, _LIT0
    add r0, r0, r9
    mov sl, #0x5
    add r6, r0, #0x94
    add r8, r0, #0x64
    mov r9, #0x0
    mov r5, #0xb
.L_e0:
    ldr r1, [r6]
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_148
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    bne .L_148
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov ip, r1, lsl #0x12
    mov r3, r0, lsl #0x1
    mov r0, r7
    mov r1, r5
    mov r2, r4
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_148
    mov r0, r7
    mov r1, r4
    bl func_ov002_021df6d4
    mov r0, r7
    mov r1, sl
    mov r2, r9
    mov r3, r4
    bl func_ov002_021dec2c
.L_148:
    add sl, sl, #0x1
    cmp sl, #0xa
    add r6, r6, #0x14
    add r8, r8, #0x14
    ble .L_e0
    ldr r2, _LIT0
    mov r0, r7
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5b80
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_178:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00001379
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
