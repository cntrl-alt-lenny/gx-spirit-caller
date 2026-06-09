; func_ov002_022a6cc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022a6d1c
        .global func_ov002_022a6cc4
        .arm
func_ov002_022a6cc4:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x578]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r1, [r0, #0x5c0]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r1, [r0, #0x5e8]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r1, [r0, #0x620]
    cmp r1, #0x4
    bne .L_1b34
    ldr r1, [r0, #0x624]
    cmp r1, #0x100
    movlt r0, #0x1
    ldmltia sp!, {r3, pc}
.L_1b34:
    bl func_ov002_022a6d1c
    ldmia sp!, {r3, pc}
