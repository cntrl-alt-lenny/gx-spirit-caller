; func_ov002_021ca5bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202e234
        .extern func_ov002_021ca51c
        .global func_ov002_021ca5bc
        .arm
func_ov002_021ca5bc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_ov002_021ca51c
    mov r4, r0
    tst r4, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    tst r4, #0x2
    beq .L_48
    ldr r0, _LIT0
    mov r1, r5, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_48:
    tst r4, #0x4
    beq .L_5c
    tst r5, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_5c:
    tst r4, #0x8
    beq .L_74
    and r0, r5, #0x1
    cmp r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_74:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0250
