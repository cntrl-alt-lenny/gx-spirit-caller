; func_0206e90c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec78
        .global func_0206e90c
        .arm
func_0206e90c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    add r4, r0, #0x4
    ldr r2, [r1]
    mov r1, r4
    mov r0, #0x0
    blx r2
    cmp r0, #0x0
    strne r4, [r0], #0x4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ec78
