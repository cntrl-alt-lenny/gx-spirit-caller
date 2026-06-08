; func_ov002_022593a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022d016c
        .extern func_ov002_0228fa1c
        .global func_ov002_022593a8
        .arm
func_ov002_022593a8:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r3, [r3, r0, lsl #0x2]
    cmp r3, #0x1
    bne .L_1c
    bl func_ov002_0228fa1c
    ldmia sp!, {r3, pc}
.L_1c:
    ldr r3, _LIT1
    mov ip, #0xa
    str ip, [r3, #0xd48]
    str r2, [r3, #0xd84]
    mov r2, #0x0
    str r2, [r3, #0xd54]
    str r2, [r3, #0xd50]
    str r0, [r3, #0xd6c]
    str r1, [r3, #0xd58]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd744
_LIT1: .word data_ov002_022d016c
