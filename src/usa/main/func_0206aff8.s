; func_0206aff8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d18
        .extern func_020a7274
        .extern func_020aace8
        .global func_0206aff8
        .arm
func_0206aff8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r7, r1
    ldreq r7, _LIT0
    mov r4, r0
    mov r0, r7
    mov r6, r2
    bl func_020aace8
    add r5, r0, #0x1
    ldr r0, [r4]
    mov r1, r7
    mov r2, r5
    bl func_020a7274
    ldr r0, [r6]
    add r0, r0, r5
    str r0, [r6]
    ldr r0, [r4]
    add r0, r0, r5
    str r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101d18
