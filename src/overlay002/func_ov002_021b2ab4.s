; func_ov002_021b2ab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0650
        .extern func_ov002_021b1d84
        .global func_ov002_021b2ab4
        .arm
func_ov002_021b2ab4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_10:
    ldr r0, [sp, #0x8]
    ldr r9, _LIT0
    ldr r7, _LIT1
    and r0, r0, #0x1
    mla fp, r0, r7, r9
    add r0, fp, #0x30
    str r0, [sp]
    mov r0, #0x0
    ldr r8, _LIT2
    ldr r4, _LIT3
    ldr r6, _LIT4
    str r0, [sp, #0x4]
    mov r5, #0x14
.L_44:
    ldr r0, [sp, #0x4]
    cmp r0, #0xb
    beq .L_64
    ldr r0, [sp]
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_e0
.L_64:
    ldrh r0, [fp, #0x3a]
    cmp r0, #0x0
    beq .L_e0
.L_70:
    add r2, r8, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh sl, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x4
    bne .L_94
    bl func_ov002_021b1d84
    b .L_d4
.L_94:
    cmp r1, #0x6
    bcc .L_d4
    ldrh r2, [r2]
    and r1, r2, #0xff
    and r1, r1, #0x1
    mla r3, r1, r7, r9
    mov r1, r2, asr #0x8
    and r2, r1, #0xff
    mla r1, r2, r5, r3
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r6
    cmpne r1, r4
    bne .L_d4
    bl func_ov002_021b1d84
.L_d4:
    mov r0, sl
    cmp sl, #0x0
    bne .L_70
.L_e0:
    ldr r0, [sp, #0x4]
    add fp, fp, #0x14
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0xb
    ldr r0, [sp]
    add r0, r0, #0x14
    str r0, [sp]
    ble .L_44
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x2
    blt .L_10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d0650
_LIT3: .word 0x00001852
_LIT4: .word 0x00001561
