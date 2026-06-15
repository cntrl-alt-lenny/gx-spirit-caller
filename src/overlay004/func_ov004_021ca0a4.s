; func_ov004_021ca0a4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201e800
        .extern func_0201e964
        .global func_ov004_021ca0a4
        .arm
func_ov004_021ca0a4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov ip, r2, lsl #0xc
    mov r3, r3, lsl #0xc
    ldr r2, [sp, #0x3c]
    mov r4, r0
    str ip, [sp, #0x20]
    str r3, [sp, #0x24]
    mov r2, r2, lsl #0x10
    mov r5, r1
    ldr r0, [r4, #0x10]
    mov r1, r2, lsr #0x10
    bl func_0201e800
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldr r0, [sp, #0x38]
    str r3, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x4]
    add r2, sp, #0x20
    str r0, [sp, #0x10]
    ldr r1, [r4]
    mov r0, r5
    mov r1, r1, lsl #0x9
    str r1, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x10]
    ldr r1, [r1, #0x2c]
    bl func_0201e964
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
