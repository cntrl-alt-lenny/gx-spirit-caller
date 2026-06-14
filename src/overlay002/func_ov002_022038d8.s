; func_ov002_022038d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bc0d4
        .global func_ov002_022038d8
        .arm
func_ov002_022038d8:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    ldrne r1, _LIT0
    ldrne r1, [r1, #0xcf8]
    cmpne r1, #0x2
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldrh r0, [r0, #0x2]
    mov r1, #0x1
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bc0d4
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
