; func_02033000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe388
        .extern func_02052b60
        .global func_02033000
        .arm
func_02033000:
    stmdb sp!, {r4, r5, r6, lr}
    mov r2, r0
    mov r6, r1
    mov r0, #0x700
    mov r1, #0x20
    blx r2
    movs r5, r0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_02052b60
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r5
    str r4, [r1]
    blx r6
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020fe388
