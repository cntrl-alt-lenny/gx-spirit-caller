; func_ov002_02232c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021c2e44
        .extern func_ov002_021e26d0
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ff1c8
        .extern func_ov002_021ff2cc
        .extern func_ov002_0223f5dc
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0227acc8
        .global func_ov002_02232c30
        .arm
func_ov002_02232c30:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh ip, [r5, #0x2]
    ldr r2, _LIT0
    mov r4, ip, lsl #0x11
    ldr r3, [r2, #0x5a8]
    mov ip, ip, lsl #0x1f
    mov r4, r4, lsr #0x1f
    cmp r3, #0x64
    eor r4, r4, ip, lsr #0x1f
    bgt .L_38
    cmp r3, #0x64
    beq .L_1fc
    b .L_20c
.L_38:
    sub r3, r3, #0x76
    cmp r3, #0xa
    addls pc, pc, r3, lsl #0x2
    b .L_20c
    b .L_1e8
    b .L_1d8
    b .L_1c4
    b .L_20c
    b .L_20c
    b .L_20c
    b .L_20c
    b .L_170
    b .L_14c
    b .L_11c
    b .L_74
.L_74:
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021c2e44
    mov r6, r0
    ldr r2, _LIT0
    mov r0, r5
    mov r1, r4
    str r6, [r2, #0x5ac]
    bl func_ov002_021ff1c8
    cmp r6, r0
    blt .L_c0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff1c8
    mov r6, r0
.L_c0:
    ldr r0, _LIT0
    cmp r6, #0x0
    str r6, [r0, #0x5ac]
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_ov002_0223f5dc
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_022535a4
    cmp r0, #0x0
    bne .L_108
    ldr r1, _LIT2
    mov r0, r4
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_11c:
    ldr r6, [r2, #0x5ac]
    mov r0, r5
    cmp r6, #0x20
    movge r6, #0x20
    bl func_ov002_0223f5dc
    mov r3, r0
    ldrh r2, [r5]
    mov r0, r4
    add r1, r6, #0x27
    bl func_ov002_021af8f0
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_14c:
    bl func_ov002_021e2a4c
    ldr r1, _LIT4
    ldr r0, _LIT0
    ldr r2, [r1, #0xd44]
    mov r1, #0x0
    strh r2, [r5, #0x8]
    str r1, [r0, #0x5ac]
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_170:
    ldrh r0, [r5, #0x8]
    ldr r1, [r2, #0x5ac]
    cmp r1, r0
    bge .L_1b8
    add r0, r1, #0x1
    bl func_ov002_021aff6c
    ldrh r2, [r5]
    mov r1, r0
    mov r0, r4
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    ldr r1, _LIT0
    mov r0, #0x7d
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, pc}
.L_1b8:
    bl func_ov002_021e2b6c
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_1c4:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x77
    ldmia sp!, {r4, r5, r6, pc}
.L_1d8:
    rsb r0, r4, #0x1
    bl func_ov002_0226af64
    mov r0, #0x76
    ldmia sp!, {r4, r5, r6, pc}
.L_1e8:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021e26d0
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_1fc:
    mov r0, r4
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_20c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001919
_LIT2: .word 0x00000122
_LIT3: .word 0x0000011d
_LIT4: .word data_ov002_022d008c
