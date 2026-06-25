; func_ov002_02281810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ba5ec
        .extern func_ov002_021bbc34
        .extern func_ov002_021c2e44
        .extern func_ov002_021c3a04
        .global func_ov002_02281810
        .arm
func_ov002_02281810:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r1, r4, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r5, r0
    bl func_ov002_021ba5ec
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, r4, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021c3a04
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c2e44
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bbc34
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
