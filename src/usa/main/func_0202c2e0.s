; func_0202c2e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be688
        .extern data_020c6a3c
        .extern data_020c6a50
        .extern data_0219a85c
        .extern func_02006bf0
        .extern func_0202c374
        .extern OS_SPrintf
        .global func_0202c2e0
        .arm
func_0202c2e0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x40
    mov r4, r0
    bl func_0202c374
    cmp r4, #0x0
    addlt sp, sp, #0x40
    ldmltia sp!, {r4, pc}
    ldr r1, _LIT0
    add r0, sp, #0x20
    ldr r4, [r1, r4, lsl #0x2]
    ldr r1, _LIT1
    mov r2, r4
    bl OS_SPrintf
    add r0, sp, #0x20
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT2
    ldr r1, _LIT3
    ldr r3, [r2, #0x4]
    mov r2, r4
    str r0, [r3]
    add r0, sp, #0x0
    bl OS_SPrintf
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r1, _LIT2
    ldr r1, [r1, #0x4]
    str r0, [r1, #0x4]
    add sp, sp, #0x40
    ldmia sp!, {r4, pc}
_LIT0: .word data_020be688
_LIT1: .word data_020c6a3c
_LIT2: .word data_0219a85c
_LIT3: .word data_020c6a50
