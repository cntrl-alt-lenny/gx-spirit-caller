; func_ov002_021c2798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern func_ov002_0223de94
        .global func_ov002_021c2798
        .arm
func_ov002_021c2798:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r4, _LIT0
    mov sl, r2
    ldr r2, [r4, #0x484]
    mov r9, r3
    subs r5, r2, #0x1
    bmi .L_2d8
    ldr r3, _LIT1
    mov r2, #0x18
    mla r7, r5, r2, r3
    and r2, r0, #0xff
    and r0, r1, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    mov r4, #0x0
.L_270:
    ldrh r0, [r7, #0x2]
    mov r1, r0, lsl #0x1f
    cmp sl, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r9, r0, lsr #0x1b
    bne .L_2cc
    ldrh r0, [r7, #0x6]
    mov r6, r4
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_2cc
.L_2a0:
    mov r0, r7
    mov r1, r6
    bl func_ov002_0223de94
    cmp r8, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r7, #0x6]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x18
    cmp r6, r0, lsr #0x18
    blt .L_2a0
.L_2cc:
    sub r7, r7, #0x18
    subs r5, r5, #0x1
    bpl .L_270
.L_2d8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce588
