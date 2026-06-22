; func_ov002_022157e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d5a08
        .extern func_ov002_0225764c
        .extern func_ov002_0226b258
        .global func_ov002_022157e4
        .arm
func_ov002_022157e4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r9, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_48
    cmp r0, #0x80
    bne .L_c8
    ldrh r0, [r9, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b258
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_48:
    mov r8, #0x0
    ldr r4, _LIT1
    mov r5, #0x2
    mov r6, r8
    mov sl, #0x64
.L_5c:
    mov r7, r6
.L_60:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_a4
    str r5, [sp]
    ldrh r2, [r4, #0xb0]
    mov r0, r9
    mov r1, r8
    mul r3, r2, sl
    mov r2, r3, lsl #0x10
    mov r2, r2, lsr #0x10
    str r2, [sp, #0x4]
    ldrh r3, [r9]
    mov r2, r7
    bl func_ov002_021d5a08
.L_a4:
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_60
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_5c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
