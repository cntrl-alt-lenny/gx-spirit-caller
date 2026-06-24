; func_0208aec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021022e0
        .extern func_02088dfc
        .extern func_0208ad4c
        .extern func_0208ade0
        .global func_0208aec4
        .arm
func_0208aec4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r0, r2
    mov r4, r1
    bl func_0208ade0
    mov r1, #0x2
    ldr r0, _LIT0
    str r1, [sp]
    ldr ip, _LIT1
    str r0, [sp, #0x4]
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    mov r3, #0x7d00
    str ip, [sp, #0x8]
    bl func_02088dfc
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word func_0208ad4c
_LIT1: .word data_021022e0
