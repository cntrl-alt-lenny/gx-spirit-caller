; func_02045c7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8fc
        .extern OS_SNPrintf
        .extern func_020aaddc
        .global func_02045c7c
        .arm
func_02045c7c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    str r0, [sp]
    mov r4, r2
    str r3, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r2, _LIT0
    mov r0, r4
    mov r1, #0x1000
    bl OS_SNPrintf
    mov r0, r4
    bl func_020aaddc
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ff8fc
