; func_0204937c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .global func_0204937c
        .arm
func_0204937c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r5, [sp, #0x10]
    ldr r1, [r0]
    ldr r4, [sp, #0x14]
    str r2, [r1, #0x2c]
    ldr r1, [r0]
    ldr lr, [sp, #0x18]
    str r3, [r1, #0x30]
    ldr r1, [r0]
    ldr ip, [sp, #0x1c]
    str r5, [r1, #0x34]
    ldr r1, [r0]
    mov r3, #0x0
    str r4, [r1, #0x38]
    ldr r1, [r0]
    mov r2, #0x1
    str lr, [r1, #0x3c]
    ldr r1, [r0]
    str ip, [r1, #0x40]
    ldr r1, [r0]
    strb r3, [r1, #0x1d]
    ldr r1, [r0]
    strb r3, [r1, #0x1e]
    ldr r1, [r0]
    strb r3, [r1, #0x1f]
    ldr r1, [r0]
    strb r3, [r1, #0x1c]
    ldr r1, [r0]
    str r2, [r1]
    ldr r1, [r0]
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    ldreqb r0, [r1, #0x1f]
    addeq r0, r0, #0x1
    streqb r0, [r1, #0x1f]
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x1f]
    add r0, r0, #0x1
    strb r0, [r1, #0x1f]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dc80
