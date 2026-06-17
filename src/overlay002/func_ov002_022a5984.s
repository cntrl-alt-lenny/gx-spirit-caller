; func_ov002_022a5984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022a4a30
        .extern func_ov002_022a4ed8
        .extern func_ov002_022a51e0
        .global func_ov002_022a5984
        .arm
func_ov002_022a5984:
    stmdb sp!, {r3, lr}
    ldr r1, [r0]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
    b .L_7ec
    b .L_7e4
    b .L_7fc
    b .L_7f4
    b .L_7f4
    b .L_7f4
    b .L_7f4
    b .L_7fc
.L_7e4:
    bl func_ov002_022a4ed8
    ldmia sp!, {r3, pc}
.L_7ec:
    bl func_ov002_022a4a30
    ldmia sp!, {r3, pc}
.L_7f4:
    bl func_ov002_022a51e0
    ldmia sp!, {r3, pc}
.L_7fc:
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
    ldmia sp!, {r3, pc}
