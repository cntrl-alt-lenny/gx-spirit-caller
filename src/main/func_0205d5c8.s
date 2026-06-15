; func_0205d5c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205d560
        .extern func_0205d614
        .global func_0205d5c8
        .arm
func_0205d5c8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    str r1, [sp]
    mov ip, #0x0
    str r2, [sp, #0x4]
    mov r4, r3
    ldr r1, _LIT0
    add r2, sp, #0x0
    str ip, [sp, #0xc]
    str r4, [sp, #0x8]
    bl func_0205d560
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4]
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word func_0205d614
