; func_02064544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054338
        .extern func_02055330
        .extern func_02064580
        .global func_02064544
        .arm
func_02064544:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_02055330
    str r0, [sp]
    ldr r0, [r4, #0xc]
    ldr r1, _LIT0
    add r2, sp, #0x0
    bl func_02054338
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word func_02064580
