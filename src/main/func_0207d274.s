; func_0207d274 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a08d4
        .extern func_0207d29c
        .global func_0207d274
        .arm
func_0207d274:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r1, r0
    mov r0, r4
    bl func_0207d29c
    cmp r0, #0x0
    addne r4, r0, #0xc
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a08d4
