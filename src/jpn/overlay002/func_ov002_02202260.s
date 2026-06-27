; func_ov002_02202260 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1e10
        .global func_ov002_02202260
        .arm
func_ov002_02202260:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    cmpne r0, #0x13
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, [r0]
    rsb r2, r2, #0x1
    cmp r1, r2
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r2, _LIT0
    mov r0, r4
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    bl func_ov002_021c1d64
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
