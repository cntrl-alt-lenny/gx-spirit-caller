; func_ov002_02230bec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3dc
        .extern func_ov002_021ba1b4
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0227acc8
        .global func_ov002_02230bec
        .arm
func_ov002_02230bec:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_20
    beq .L_200
    b .L_218
.L_20:
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_218
    b .L_1e4
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_1c8
    b .L_168
    b .L_e0
    b .L_54
.L_54:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    bne .L_c8
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_c8:
    bl func_ov002_021e2a4c
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_e0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_118
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    bne .L_120
.L_118:
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_120:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_14c
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_160
.L_14c:
    ldrh r1, [r4, #0x4]
    mov r0, #0x35
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae3dc
.L_160:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_168:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ba1b4
    ldr r3, _LIT3
    ldr r1, _LIT4
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    mov r2, r0
    add r1, r1, #0x260
    add r1, r1, r2, lsl #0x2
    mov r0, r4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227acc8
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_1c8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1e4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_200:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_218:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
