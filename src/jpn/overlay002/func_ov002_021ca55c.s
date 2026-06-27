; func_ov002_021ca55c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ca43c
        .global func_ov002_021ca55c
        .arm
func_ov002_021ca55c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov002_021ca43c
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    tst r0, #0x2
    cmpne r4, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    tst r0, #0x4
    beq .L_23c
    cmp r5, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_23c:
    tst r0, #0x8
    beq .L_250
    cmp r5, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_250:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
