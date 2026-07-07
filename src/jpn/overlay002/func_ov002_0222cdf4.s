; func_ov002_0222cdf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021d8814
        .extern func_ov002_021de4a8
        .extern func_ov002_021e0f5c
        .global func_ov002_0222cdf4
        .arm
func_ov002_0222cdf4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2, #0x5a8]
    mov r4, r1
    cmp r0, #0x7f
    beq .L_b8
    cmp r0, #0x80
    bne .L_cc
    ldrh r0, [r4, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x4]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8814
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r1, lsr #0x1b
    cmp r2, #0xa
    bhi .L_cc
    mov r1, r0, lsl #0x1f
    mov r0, r5
    mov r1, r1, lsr #0x1f
    bl func_ov002_021de4a8
    cmp r0, #0x0
    beq .L_cc
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_b8:
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e0f5c
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
