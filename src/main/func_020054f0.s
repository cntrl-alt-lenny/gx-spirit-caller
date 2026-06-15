; func_020054f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02001d0c
        .extern func_02001d84
        .extern func_02003b14
        .extern func_02004ef4
        .global func_020054f0
        .arm
func_020054f0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x40
    mov r6, r0
    mov r5, r1
    mov r4, r2
    add r0, sp, #0xc
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    add r0, sp, #0xc
    mov r1, r4
    mov r2, #0x0
    bl func_02001d84
    mov r2, #0x0
    stmia sp, {r2, r5}
    ldr r3, _LIT0
    mov r1, r6
    str r3, [sp, #0x8]
    add r0, sp, #0xc
    mov r3, r2
    bl func_02004ef4
    ldr r0, [sp, #0x14]
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02003b14
