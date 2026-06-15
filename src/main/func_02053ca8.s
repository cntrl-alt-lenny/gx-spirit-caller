; func_02053ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb00
        .extern data_020ffb04
        .extern func_020540d0
        .extern func_020a6d54
        .global func_02053ca8
        .arm
func_02053ca8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r6, r1
    mov r7, r0
    mov r5, r2
    bne .L_560
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x104
    bl func_020a6d54
.L_560:
    ldr r0, [r7]
    subs r4, r0, #0x1
    addmi sp, sp, #0x4
    ldmmiia sp!, {r4, r5, r6, r7, pc}
.L_570:
    mov r0, r7
    mov r1, r4
    bl func_020540d0
    mov r1, r5
    blx r6
    subs r4, r4, #0x1
    bpl .L_570
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffb00
_LIT1: .word data_020ffb04
