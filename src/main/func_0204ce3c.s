; func_0204ce3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204ead0
        .global func_0204ce3c
        .arm
func_0204ce3c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    mov r1, #0x0
    str r1, [sp]
    str r1, [sp, #0x4]
    ldrh r3, [r0, #0xa4]
    ldr r2, [r4, #0x24]
    mov r1, r5
    mov r0, #0x5
    bl func_0204ead0
    mov r4, r0
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x204]
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
