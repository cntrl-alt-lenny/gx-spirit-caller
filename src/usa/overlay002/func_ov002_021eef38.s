; func_ov002_021eef38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c194c
        .extern func_ov002_021c1d64
        .extern func_ov002_021eb210
        .global func_ov002_021eef38
        .arm
func_ov002_021eef38:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x2
    bne .L_1b8
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c194c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_1b8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021eb210
    ldmia sp!, {r4, r5, r6, pc}
