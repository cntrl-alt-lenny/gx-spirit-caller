; func_ov002_02229c10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202df24
        .extern func_ov002_021d8198
        .extern func_ov002_021d86ec
        .extern func_ov002_021e1304
        .extern func_ov002_021e2728
        .global func_ov002_02229c10
        .arm
func_ov002_02229c10:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_b8
    bl func_ov002_021e2728
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d86ec
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0x260]
    ldrh r1, [r4, #0x8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    beq .L_a4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r3, _LIT2
    ldr r1, _LIT0
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    bl func_ov002_021d8198
    b .L_b8
.L_a4:
    mov r0, r0, lsl #0x1f
    mov r1, #0x1
    mov r2, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e1304
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
