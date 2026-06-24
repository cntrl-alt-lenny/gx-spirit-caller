; func_020661b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054c34
        .extern func_020552bc
        .extern func_02066e2c
        .global func_020661b0
        .arm
func_020661b0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x810
    mov r4, r0
    mov r3, #0x0
    add r0, sp, #0x8
    add r2, r4, #0x84
    mov r1, #0x8
    str r3, [sp, #0x808]
    bl func_02066e2c
    add r0, r4, #0xcc
    str r0, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r4]
    ldr r2, [sp, #0x808]
    add r1, sp, #0x8
    mov r3, #0x0
    bl func_02054c34
    bl func_020552bc
    str r0, [r4, #0xb0]
    add sp, sp, #0x810
    ldmia sp!, {r4, pc}
