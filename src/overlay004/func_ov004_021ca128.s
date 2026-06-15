; func_ov004_021ca128 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201eaa0
        .global func_ov004_021ca128
        .arm
func_ov004_021ca128:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x28
    mov ip, r2, lsl #0xc
    mov r3, r3, lsl #0xc
    str r3, [sp, #0x24]
    ldr r2, [sp, #0x30]
    str ip, [sp, #0x20]
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    add ip, r2, #0x8
    str ip, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr ip, [r0, #0x4]
    ldr r2, [sp, #0x34]
    str ip, [sp, #0x10]
    ldr ip, [r0]
    add r2, r0, r2, lsl #0x2
    mov r0, ip, lsl #0x9
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    mov r0, r1
    ldr r1, [r2, #0x10]
    add r2, sp, #0x20
    bl func_0201eaa0
    add sp, sp, #0x28
    ldmia sp!, {r3, pc}
