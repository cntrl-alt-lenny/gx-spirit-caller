; func_020491fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff840
        .extern func_020482a0
        .extern func_02055bfc
        .extern func_020aae4c
        .global func_020491fc
        .arm
func_020491fc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r5, r0
    ldr r0, [r4, #0x8]
    ldr r1, _LIT0
    bl func_020aae4c
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT1
    mov r2, #0x0
    str r0, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r4]
    mov r0, r5
    mov r3, r2
    bl func_02055bfc
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ff840+0x8
_LIT1: .word func_020482a0
