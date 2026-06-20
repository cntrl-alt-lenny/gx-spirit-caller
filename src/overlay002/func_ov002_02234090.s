; func_ov002_02234090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b4120
        .extern func_ov002_021bbf50
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5b80
        .extern func_ov002_021e276c
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02234090
        .arm
func_ov002_02234090:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    add r2, sp, #0x4
    mov r1, #0x0
    mov r6, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_120
    ldr r2, [sp, #0x4]
    mov r0, r6
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_120
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r7, r1, r2, lsr #0x1f
    bl func_ov002_021bbf50
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r6]
    mov r0, r4
    mov r1, r5
    mov r3, #0x2
    bl func_ov002_021d59cc
    ldr r2, _LIT2
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_108
    ldr r2, _LIT2
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b4120
    cmp r7, r0
    beq .L_120
    ldrh r2, [r6]
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021d5b80
    ldrh r1, [r6]
    mov r0, r4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e276c
    b .L_120
.L_108:
    ldrh r1, [r6]
    mov r2, r7, lsl #0x10
    mov r0, r4
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
.L_120:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x0000195b
