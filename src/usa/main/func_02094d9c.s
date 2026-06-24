; func_02094d9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094ba0
        .global func_02094d9c
        .arm
func_02094d9c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr ip, [sp, #0x18]
    mov r3, r3, lsl #0x1a
    orr r4, r3, r1, lsl #0x18
    ldr r5, [sp, #0x24]
    mov r3, ip, lsl #0x18
    ldr r1, [sp, #0x1c]
    ldr ip, [sp, #0x10]
    orr r4, r4, r5, lsl #0x10
    orr r4, ip, r4
    ldr lr, [sp, #0x20]
    orr r3, r3, r1, lsl #0x16
    ldr ip, [sp, #0x14]
    orr r1, r0, lr, lsl #0x10
    orr r3, ip, r3
    mov r0, #0xe
    str r4, [sp]
    bl func_02094ba0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
