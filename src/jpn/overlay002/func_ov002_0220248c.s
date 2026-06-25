; func_ov002_0220248c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021c1e10
        .global func_ov002_0220248c
        .arm
func_ov002_0220248c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r2, r1, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0xf
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT0
    mov r3, r1, lsl #0x1f
    ldr r1, [r2]
    cmp r1, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r3, [r2, #0x8]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r2, [r2, #0x1c]
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
