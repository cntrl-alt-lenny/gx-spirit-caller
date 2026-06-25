; func_ov002_021ca310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_ov002_021ca1e8
        .extern func_ov002_021ca1f0
        .global func_ov002_021ca310
        .arm
func_ov002_021ca310:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_0202b824
    mov r1, r0
    mov r0, r5
    bl func_ov002_021ca1e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0202b83c
    mov r1, r0
    mov r0, r5
    bl func_ov002_021ca1f0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
