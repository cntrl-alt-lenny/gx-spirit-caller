; func_ov002_021b27f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0658
        .extern func_ov002_021b1d84
        .extern func_ov002_021b20cc
        .global func_ov002_021b27f8
        .arm
func_ov002_021b27f8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r7, _LIT0
    ldr r5, _LIT1
    ldr r8, _LIT2
    ldr sl, _LIT3
    ldr r4, _LIT4
    mov r6, #0x1
    mov r9, #0x14
.L_20:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_44
    cmp r0, #0x7
    beq .L_80
    b .L_c8
.L_44:
    ldrh r1, [r7, #0x2]
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1c
    beq .L_74
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xf0
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x18
    strh r0, [r7, #0x2]
    b .L_c8
.L_74:
    mov r0, r6
    bl func_ov002_021b1d84
    b .L_c8
.L_80:
    ldrh r1, [r7]
    and r0, r1, #0xff
    and r0, r0, #0x1
    mla r2, r0, r8, r5
    mov r0, r1, asr #0x8
    and r1, r0, #0xff
    mla r0, r1, r9, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, sl
    bne .L_c8
    ldrh r0, [r7, #0x4]
    ldr r1, [r4, #0xcf0]
    cmp r1, r0
    bls .L_c8
    mov r0, r6
    bl func_ov002_021b1d84
.L_c8:
    add r6, r6, #0x1
    cmp r6, #0x100
    add r7, r7, #0x8
    blt .L_20
    mov r0, #0x0
    str r0, [sp]
.L_e0:
    ldr r0, [sp]
    ldr r1, _LIT2
    and r2, r0, #0x1
    ldr r0, _LIT1
    mov r6, #0x5
    mla r0, r2, r1, r0
    add r8, r0, #0x94
    ldr r0, [sp]
    mov r4, #0x1
    and fp, r0, #0xff
.L_108:
    ldr r0, [r8]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT5
    cmp r0, r1, lsr #0x13
    bne .L_188
    ldr r0, _LIT4
    ldr r1, _LIT2
    ldr r0, [r0, #0xcec]
    and r2, r6, #0xff
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    ldr r0, _LIT1
    mov r7, #0x5
    mla r0, r3, r1, r0
    add r9, r0, #0x94
    add sl, r0, #0x64
    orr r0, fp, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
.L_154:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_174
    ldrh r0, [sl, #0x3a]
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b20cc
.L_174:
    add r9, r9, #0x14
    add sl, sl, #0x14
    add r7, r7, #0x1
    cmp r7, #0xa
    ble .L_154
.L_188:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x14
    ble .L_108
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_e0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0658
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x0000175d
_LIT4: .word data_ov002_022d016c
_LIT5: .word 0x00001390
