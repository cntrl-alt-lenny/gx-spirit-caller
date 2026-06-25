; func_02094ef0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094ba0
        .global func_02094ef0
        .arm
func_02094ef0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r0, r1, lsl #0x1e
    ldr ip, [sp, #0x8]
    mov r1, r2
    orr r0, r0, ip, lsl #0x1d
    ldr r2, [sp, #0xc]
    mov lr, #0x0
    orr r0, r0, r2, lsl #0x1c
    ldr ip, [sp, #0x10]
    mov r2, r3
    orr r3, r0, ip, lsl #0x1b
    mov r0, #0x11
    str lr, [sp]
    bl func_02094ba0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
