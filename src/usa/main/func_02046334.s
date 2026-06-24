; func_02046334 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_0204664c
        .global func_02046334
        .arm
func_02046334:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2]
    mov r4, r1
    ldr r0, [r0, #0x28]
    cmp r0, #0x4
    beq .L_370
    bl func_0204664c
.L_370:
    ldr r1, _LIT0
    mov r0, r5
    ldr r3, [r1]
    mov r1, r4
    ldr r2, [r3, #0x7c]
    ldr r3, [r3, #0x78]
    blx r3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219da0c
