; func_02068aa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101c9c
        .extern func_02068ae0
        .extern func_020a9698
        .global func_02068aa8
        .arm
func_02068aa8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r1
    mov r5, r0
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_020a9698
    add r2, sp, #0x0
    mov r0, r5
    mov r1, r4
    bl func_02068ae0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101c9c
