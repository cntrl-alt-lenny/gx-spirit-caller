; func_ov002_022a63d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d184
        .extern func_ov002_0229ed30
        .extern func_ov002_022a60f4
        .extern func_ov002_022a6324
        .global func_ov002_022a63d0
        .arm
func_ov002_022a63d0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r2
    ldrh r3, [r5]
    mov r7, r0
    mov r6, r1
    mov r0, r3, lsl #0x1a
    mov r2, r0, lsr #0x1b
    mov r0, r3, lsl #0x1f
    cmp r2, #0xc
    mov r1, r0, lsr #0x1f
    movlt r4, #0x0
    blt .L_a2c
    add r3, r7, #0x280
    mov r0, #0xb0
    mla r4, r1, r0, r3
    sub r3, r2, #0xc
    mov r0, #0x2c
    mla r4, r3, r0, r4
.L_a2c:
    ldrh r3, [r5]
    mov r0, r7
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x18
    bl func_ov002_022a6324
    movs r8, r0
    beq .L_a54
    mov r1, r6
    mov r2, r5
    bl func_ov002_0229d184
.L_a54:
    cmp r4, #0x0
    beq .L_a6c
    mov r0, r4
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_0229ed30
.L_a6c:
    ldrh r1, [r5]
    mov r0, r7
    mov r4, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a60f4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
