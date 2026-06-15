; func_0206677c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101750
        .extern func_020667e8
        .extern func_02067294
        .global func_0206677c
        .arm
func_0206677c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r2, #0x1
    mov r5, r0
    str r2, [r4, #0x800]
    mov r3, #0x5c
    mov r2, #0x0
    strb r3, [r4]
    bl func_020667e8
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_020667e8
    mov r0, r5
    mov r1, r4
    mov r2, #0x2
    bl func_020667e8
    ldr r1, _LIT0
    mov r0, r4
    bl func_02067294
    ldr r0, [r4, #0x800]
    sub r0, r0, #0x1
    str r0, [r4, #0x800]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101750
