; func_ov002_02287474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bd6c8
        .extern func_ov002_022576d8
        .extern func_ov002_0228c864
        .extern func_ov002_0228dda8
        .global func_ov002_02287474
        .arm
func_ov002_02287474:
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
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_022576d8
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldr r2, _LIT2
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c864
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x0000169f
_LIT2: .word func_ov002_0228dda8
