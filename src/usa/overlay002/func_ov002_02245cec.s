; func_ov002_02245cec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021b9dec
        .extern func_ov002_021fbe84
        .extern func_ov002_021fbfd8
        .extern func_ov002_022450d0
        .extern func_ov002_02253600
        .global func_ov002_02245cec
        .arm
func_ov002_02245cec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, #0x0
    mov r8, r0
    mov r7, r1
    mov r4, r9
    mov r6, r9
.L_18:
    mov sl, r6
.L_1c:
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b9dec
    movs r5, r0
    beq .L_70
    mov r0, r8
    mov r1, r9
    mov r2, sl
    mov r3, r4
    bl func_ov002_021fbe84
    cmp r0, #0x0
    beq .L_70
    cmp r7, #0x0
    beq .L_68
    mov r0, r8
    mov r1, r5
    bl func_ov002_022450d0
    cmp r0, #0x0
    beq .L_70
.L_68:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_70:
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_1c
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_18
    ldr r0, _LIT0
    and r2, r8, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_114
    ldr r0, _LIT2
    mov r9, r6
    add r5, r0, r1
    add r4, r5, #0x120
.L_b8:
    ldr r1, [r4]
    mov r0, r8
    mov r3, r1, lsl #0x13
    mov r1, r6
    mov r2, r9
    mov sl, r3, lsr #0x13
    bl func_ov002_021fbfd8
    cmp r0, #0x0
    beq .L_100
    cmp r7, #0x0
    beq .L_f8
    mov r0, r8
    mov r1, sl
    bl func_ov002_022450d0
    cmp r0, #0x0
    beq .L_100
.L_f8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_100:
    ldr r0, [r5, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_b8
.L_114:
    ldr r1, _LIT3
    mov r0, r8
    mov r2, #0xe
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x0000fffe
