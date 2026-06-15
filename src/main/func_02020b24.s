; func_02020b24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c682c
        .extern data_02191f40
        .extern func_0201f138
        .extern func_02020398
        .extern func_0209e7f0
        .global func_02020b24
        .arm
func_02020b24:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    str r0, [r2, #0x1c]
    mov r0, #0xe
    mov r2, #0x0
    bl func_0209e7f0
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f138
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT2
    blx r1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word func_02020398
_LIT2: .word data_020c682c
