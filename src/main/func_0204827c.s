; func_0204827c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc78
        .extern func_020945f4
        .global func_0204827c
        .arm
func_0204827c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    mov r6, r1
    mov r5, r2
    mov r1, #0x0
    mov r2, #0x260
    mov r4, r3
    str r0, [ip]
    bl func_020945f4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    ldr ip, [sp, #0x10]
    str r5, [r1]
    ldr r1, [r0]
    ldr r5, [sp, #0x14]
    str r2, [r1, #0x4]
    ldr r1, [r0]
    ldr r3, [sp, #0x18]
    str r4, [r1, #0x8]
    ldr r1, [r0]
    ldr r2, [sp, #0x1c]
    str ip, [r1, #0xc]
    ldr r1, [r0]
    str r5, [r1, #0x10]
    ldr r1, [r0]
    str r3, [r1, #0x14]
    ldr r1, [r0]
    str r2, [r1, #0x18]
    ldr r0, [r0]
    str r6, [r0, #0x1c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dc78
