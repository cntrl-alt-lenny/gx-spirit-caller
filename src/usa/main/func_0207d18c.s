; func_0207d18c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07f4
        .extern func_0207d1b4
        .global func_0207d18c
        .arm
func_0207d18c:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r1, r0
    mov r0, r4
    bl func_0207d1b4
    cmp r0, #0x0
    addne r4, r0, #0xc
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a07f4
