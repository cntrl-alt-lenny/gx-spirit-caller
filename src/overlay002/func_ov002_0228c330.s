; func_ov002_0228c330 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c86b8
        .extern data_ov002_022cd524
        .extern func_0202e234
        .extern func_ov002_0228bcd0
        .extern func_ov002_0228c1d0
        .global func_ov002_0228c330
        .arm
func_ov002_0228c330:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r7, _LIT1
    mov r4, r1
    str r5, [r2]
    mov r6, #0x0
.L_67c:
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_ov002_0228bcd0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r6, r6, #0x1
    cmp r6, #0x5d
    add r7, r7, #0x8
    bcc .L_67c
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r5, r0
    bne .L_6e8
    ldrh r0, [r4]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_6e8
    ldrh r1, [r4]
    ldr r0, _LIT2
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_6e8:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c1d0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022c86b8
_LIT2: .word 0x000013f9
