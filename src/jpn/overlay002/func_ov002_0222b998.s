; func_ov002_0222b998 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0e3c
        .extern func_ov002_021b9a84
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022535a4
        .extern func_ov002_0226b0a4
        .extern func_ov002_0227acc8
        .global func_ov002_0222b998
        .arm
func_ov002_0222b998:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2, #0x5a8]
    ldr r4, [r2, #0x5ac]
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_180
    b .L_158
    b .L_180
    b .L_180
    b .L_180
    b .L_180
    b .L_108
    b .L_e8
    b .L_78
    b .L_48
.L_48:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r1, [r1, #0xcec]
    str r1, [r2, #0x5ac]
    bl func_ov002_021ca1d8
    strh r0, [r5, #0xc]
    mov r0, #0x1
    bl func_ov002_021ca1d8
    strh r0, [r5, #0xe]
    bl func_ov002_021e2a4c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_78:
    add r0, r4, #0x2
    add r0, r5, r0, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_021bc538
    mov r6, r0
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_022535a4
    cmp r6, r0
    bge .L_c0
    mov r0, r4
    bl func_ov002_021bc538
    b .L_d0
.L_c0:
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_022535a4
.L_d0:
    strh r0, [r5, #0xa]
    ldrh r0, [r5, #0xa]
    cmp r0, #0x0
    moveq r0, #0x78
    movne r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    ldrh r1, [r5]
    ldrh r2, [r5, #0xa]
    mov r0, r4
    bl func_ov002_0226b0a4
    mov r0, #0x0
    strh r0, [r5, #0x8]
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    ldrh r1, [r5, #0x8]
    ldrh r0, [r5, #0xa]
    cmp r1, r0
    movcs r0, #0x78
    ldmcsia sp!, {r4, r5, r6, pc}
    add r1, r1, #0x1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1
    ldrh r0, [r0, r1]
    bl func_ov002_021b9a84
    mov r1, r0
    mov r0, r4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227acc8
    ldrh r1, [r5, #0x8]
    mov r0, #0x7d
    add r1, r1, #0x1
    strh r1, [r5, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
.L_158:
    rsb r1, r4, #0x1
    ldr r0, _LIT1
    str r1, [r2, #0x5ac]
    ldr r0, [r0, #0xcec]
    cmp r1, r0
    movne r0, #0x7f
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_180:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0e3c
