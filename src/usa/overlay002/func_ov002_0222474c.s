; func_ov002_0222474c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae350
        .extern func_ov002_021bbe70
        .extern func_ov002_021de3c0
        .extern func_ov002_021f4170
        .extern func_ov002_0226ae48
        .extern func_ov002_0226af44
        .extern func_ov002_0226afa4
        .global func_ov002_0222474c
        .arm
func_ov002_0222474c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_578
    b .L_558
    b .L_4f4
    b .L_4c8
    b .L_468
.L_468:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    bne .L_4a0
    bl func_ov002_021bbe70
    cmp r0, #0x0
    beq .L_4c0
.L_4a0:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afa4
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_4c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_4c8:
    ldr r1, _LIT3
    ldrh r0, [r4]
    ldrh r1, [r1, #0xb0]
    bl func_ov002_021f4170
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae350
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_4f4:
    ldr r0, _LIT3
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    beq .L_510
    cmp r0, #0x1
    beq .L_534
    b .L_550
.L_510:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r2, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226ae48
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_534:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af44
.L_550:
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_558:
    ldr r1, _LIT3
    ldrh r1, [r1, #0xb0]
    mov r2, r1, asr #0x8
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021de3c0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_578:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
