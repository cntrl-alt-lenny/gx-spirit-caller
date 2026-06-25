; func_ov002_021ca4dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202e1e0
        .extern func_ov002_021ca43c
        .global func_ov002_021ca4dc
        .arm
func_ov002_021ca4dc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_ov002_021ca43c
    mov r4, r0
    tst r4, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    tst r4, #0x2
    beq .L_1c4
    ldr r0, _LIT0
    mov r1, r5, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_1c4:
    tst r4, #0x4
    beq .L_1d8
    tst r5, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_1d8:
    tst r4, #0x8
    beq .L_1f0
    and r0, r5, #0x1
    cmp r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_1f0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0170
