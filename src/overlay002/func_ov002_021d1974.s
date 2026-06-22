; func_ov002_021d1974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be10c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d1974
        .arm
func_ov002_021d1974:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r9, #0x1
    ldr r0, [r0, #0x810]
    moveq r9, #0x0
    cmp r0, #0x0
    bne .L_b4
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r9, #0x1
    mla r7, r1, r0, r2
    ldr r5, _LIT3
    mov r8, #0x0
    mov r4, #0x3b
    mov r6, #0x5
.L_48:
    ldr r3, [r5, r8, lsl #0x2]
    mov r2, r6
    add r1, r7, #0x94
.L_54:
    ldr r0, [r1]
    mov r0, r0, lsl #0x13
    cmp r3, r0, lsr #0x13
    bne .L_84
    and r0, r8, #0xff
    orr r0, r0, #0x100
    mov r3, r0, lsl #0x10
    mov r0, r4
    mov r1, r9
    mov r3, r3, lsr #0x10
    bl func_ov002_0229ade0
    b .L_94
.L_84:
    add r2, r2, #0x1
    cmp r2, #0xa
    add r1, r1, #0x14
    blt .L_54
.L_94:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_48
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_b4:
    mov r0, #0x3b
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022be10c
