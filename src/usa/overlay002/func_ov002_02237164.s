; func_ov002_02237164 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021de318
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ee3d8
        .extern func_ov002_022535a4
        .extern func_ov002_02257668
        .extern func_ov002_0227acc8
        .global func_ov002_02237164
        .arm
func_ov002_02237164:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1c4
    b .L_16c
    b .L_14c
    b .L_f4
    b .L_50
    b .L_34
.L_34:
    ldr r1, _LIT1
    bl func_ov002_02257668
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de318
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_50:
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
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT2
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_dc
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_ec
.L_dc:
    mov r0, #0x2f
    bl func_ov002_021ae3a4
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_ec:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_f4:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x2
    movge r0, #0x2
    cmp r0, #0x20
    movge r0, #0x20
    ldrh r3, [r4, #0x2]
    add r1, r0, #0x27
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_14c:
    mov r1, #0x0
    ldr r0, _LIT4
    strh r1, [r4, #0x8]
    ldr r0, [r0, #0xd44]
    strh r0, [r4, #0xa]
    bl func_ov002_021e2a4c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_16c:
    ldrh r1, [r4, #0x8]
    ldrh r0, [r4, #0xa]
    cmp r1, r0
    bcs .L_1b8
    add r0, r1, #0x1
    bl func_ov002_021aff6c
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    ldrh r1, [r4, #0x8]
    mov r0, #0x7c
    add r1, r1, #0x1
    strh r1, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_1b8:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1c4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_021ee3d8
_LIT2: .word 0x0000159d
_LIT3: .word 0x0000158b
_LIT4: .word data_ov002_022d008c
