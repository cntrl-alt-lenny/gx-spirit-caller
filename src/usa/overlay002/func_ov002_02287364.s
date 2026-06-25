; func_ov002_02287364 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021bd5e8
        .extern func_ov002_022575f0
        .extern func_ov002_0228c754
        .extern func_ov002_0228dc98
        .global func_ov002_02287364
        .arm
func_ov002_02287364:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldr r2, [r0, #0xcec]
    mov r1, r1, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_022575f0
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldr r2, _LIT2
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000169f
_LIT2: .word func_ov002_0228dc98
