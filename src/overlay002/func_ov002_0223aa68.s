; func_ov002_0223aa68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern func_02031794
        .extern func_ov002_021d8904
        .extern func_ov002_021de598
        .extern func_ov002_0226b13c
        .global func_ov002_0223aa68
        .arm
func_ov002_0223aa68:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x484]
    subs r4, r0, #0x1
    bmi .L_c4
    ldr r1, _LIT1
    mov r0, #0x18
    mla r5, r4, r0, r1
.L_24:
    ldrh r0, [r5]
    bl func_02031794
    cmp r0, #0x0
    bne .L_b8
    ldrh r0, [r5, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r5, #0x4]
    ldrh r1, [r5, #0x4]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r5, #0x4]
    ldrh r1, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8904
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r1, lsr #0x1b
    cmp r2, #0xa
    bhi .L_b8
    mov r1, r0, lsl #0x1f
    mov r0, r6
    mov r1, r1, lsr #0x1f
    bl func_ov002_021de598
.L_b8:
    sub r5, r5, #0x18
    subs r4, r4, #0x1
    bpl .L_24
.L_c4:
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, [r0, #0x484]
    rsb r0, r2, #0x1
    bl func_ov002_0226b13c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce588
