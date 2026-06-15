; func_02066a88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02066ae8
        .global func_02066a88
        .arm
func_02066a88:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    str r3, [sp]
    mov r3, r2
    mov r2, #0x0
    mov r5, r0
    mov r4, r1
    bl func_02066ae8
    ldr ip, [sp, #0x14]
    ldr r3, [sp, #0x10]
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    str ip, [sp]
    bl func_02066ae8
    ldr r0, [sp, #0x1c]
    ldr r3, [sp, #0x18]
    str r0, [sp]
    mov r0, r5
    mov r1, r4
    mov r2, #0x2
    bl func_02066ae8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
