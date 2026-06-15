; func_0207dc5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d1e8
        .global func_0207dc5c
        .arm
func_0207dc5c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r3, r1
    add r4, r5, #0x24
    str r2, [sp]
    ldr r1, _LIT0
    add r2, r4, #0xc
    bl func_0207d1e8
    ldr r0, [r5, #0x18]
    mov r1, #0x0
    str r0, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    mov r0, r5
    str r2, [r4, #0x4]
    str r1, [r4, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x46524d48
