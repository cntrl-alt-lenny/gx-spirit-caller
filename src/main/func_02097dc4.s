; func_02097dc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a830c
        .extern func_02098228
        .extern func_02098388
        .global func_02097dc4
        .arm
func_02097dc4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x58
    mov r4, r0
    add r0, sp, #0xc
    bl func_02098388
    add r0, sp, #0xc
    add r3, sp, #0x0
    mov r1, r4
    mov r2, #0x0
    bl func_02098228
    cmp r0, #0x0
    moveq r0, #0x0
    addne r0, sp, #0x0
    ldrne r3, _LIT0
    ldmneia r0, {r0, r1, r2}
    stmneia r3, {r0, r1, r2}
    movne r0, #0x1
    add sp, sp, #0x58
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a830c
