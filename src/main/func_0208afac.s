; func_0208afac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023c0
        .extern func_02088ee4
        .extern func_0208ae34
        .extern func_0208aec8
        .global func_0208afac
        .arm
func_0208afac:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r0, r2
    mov r4, r1
    bl func_0208aec8
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
    bl func_02088ee4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word func_0208ae34
_LIT1: .word data_021023c0
