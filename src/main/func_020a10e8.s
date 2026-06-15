; func_020a10e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .extern func_020a2cbc
        .extern func_020a5c80
        .global func_020a10e8
        .arm
func_020a10e8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r4, r1
    ldr r1, [r2]
    strb r0, [sp]
    add r0, sp, #0x0
    bl func_020a5c80
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x6
    bl func_020a2cbc
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a98fc
