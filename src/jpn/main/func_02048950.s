; func_02048950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff840
        .extern data_0219dba0
        .extern func_0204880c
        .extern func_02055a10
        .global func_02048950
        .arm
func_02048950:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r1, r0
    ldr r0, [r2]
    ldr r2, _LIT1
    ldr r0, [r0, #0x4]
    bl func_02055a10
    mov r4, r0
    bl func_0204880c
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dba0
_LIT1: .word data_020ff840+0x4
