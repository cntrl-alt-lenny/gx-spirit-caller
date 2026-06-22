; func_ov002_02232a18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9bd4
        .extern func_ov002_021d6808
        .extern func_ov002_021d9144
        .extern func_ov002_021de480
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02232a18
        .arm
func_ov002_02232a18:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    bne .L_248
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_248
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_248
    mov ip, #0x1
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6808
.L_248:
    ldrh r1, [r4, #0x2]
    ldrh ip, [r4, #0x4]
    ldr r3, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov lr, r1, lsl #0x1a
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    mov r1, lr, lsr #0x1b
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov ip, ip, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    mov r2, #0x1
    bl func_ov002_021d9144
    ldrh r0, [r4, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9bd4
    add r0, r0, #0x1
    cmp r0, #0x3
    blt .L_2f8
    ldrh r0, [r4, #0x2]
    mov r2, #0x0
    mov r3, r2
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021de480
.L_2f8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
