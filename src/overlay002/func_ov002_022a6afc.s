; func_ov002_022a6afc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern func_ov002_021c93f0
        .extern func_ov002_021c9504
        .extern func_ov002_021c988c
        .global func_ov002_022a6afc
        .arm
func_ov002_022a6afc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x500
    ldr r1, _LIT0
    ldrh r2, [r0, #0x90]
    ldr r0, [r1, #0x4]
    mov r1, r2, lsl #0x1f
    eor r0, r0, #0x1
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    add r1, r5, #0x500
    ldrh r1, [r1, #0x90]
    moveq r4, #0x1
    movne r4, #0x0
    mov r2, r1, lsl #0x12
    mov r3, r1, lsl #0x1a
    mov r1, r3, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9504
    cmp r0, #0x0
    beq .L_2e4
    add r0, r5, #0x500
    ldrh r2, [r0, #0x90]
    ldr r0, _LIT0
    mov r3, r2, lsl #0x1f
    ldr r1, [r0, #0x4]
    mov r0, r3, lsr #0x1f
    cmp r0, r1
    beq .L_2a0
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c988c
    cmp r0, #0x0
    beq .L_2e4
.L_2a0:
    add r0, r5, #0x500
    ldrh r0, [r0, #0x90]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c93f0
    ldr r1, _LIT0
    ldr r0, [r0]
    ldr r1, [r1, #0x4]
    mov r0, r0, lsl #0x12
    eor r1, r1, #0x1
    cmp r1, r0, lsr #0x1f
    moveq r4, #0x1
    movne r4, #0x0
.L_2e4:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd73c
