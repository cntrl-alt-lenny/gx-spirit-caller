; func_ov002_022439b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_0202e2f8
        .extern func_ov002_021b90a8
        .extern func_ov002_021c1e44
        .extern func_ov002_021d90c0
        .extern func_ov002_021deb28
        .extern func_ov002_0223de94
        .extern func_ov002_0223fb48
        .global func_ov002_022439b4
        .arm
func_ov002_022439b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, _LIT0
    mov r9, r0
    ldr r2, [r2, #0x5b8]
    cmp r2, #0xa
    beq .L_34
    bl func_ov002_0223fb48
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0xa
    strne r1, [r0, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_34:
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r6, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    ldr r4, _LIT1
    ldr sl, _LIT2
    mov r5, r6
    mov r7, r6
    and r8, r0, #0xff
.L_60:
    ldrh r0, [r9, #0x2]
    cmp r5, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r0, r1, sl, r4
    add r0, r0, r7
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmpne r0, #0x0
    beq .L_f0
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_f0
    ldrh r0, [r9, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b90a8
    cmp r0, #0x0
    beq .L_f0
    ldrh r1, [r9, #0x2]
    mov r0, r9
    mov r2, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021c1e44
    cmp r0, #0x0
    bne .L_f0
    ldrh r0, [r9, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021deb28
    add r6, r6, #0x1
.L_f0:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r7, r7, #0x14
    ble .L_60
    ldrh r0, [r9, #0x2]
    mov r2, r6
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90c0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
