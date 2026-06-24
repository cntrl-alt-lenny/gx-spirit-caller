; func_02020ad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c674c
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_02020344
        .extern func_0209e6fc
        .global func_02020ad0
        .arm
func_02020ad0:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    str r0, [r2, #0x1c]
    mov r0, #0xe
    mov r2, #0x0
    bl func_0209e6fc
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f0e4
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT2
    blx r1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word func_02020344
_LIT2: .word data_020c674c
