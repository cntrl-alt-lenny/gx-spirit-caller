; func_02049270 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff920
        .extern func_02048314
        .extern func_02055c70
        .extern func_020aaf40
        .global func_02049270
        .arm
func_02049270:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r5, r0
    ldr r0, [r4, #0x8]
    ldr r1, _LIT0
    bl func_020aaf40
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
    bl func_02055c70
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ff920+0x8
_LIT1: .word func_02048314
