; func_02055204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054c64
        .global func_02055204
        .arm
func_02055204:
    stmdb sp!, {r0, r1, r2, r3}
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov ip, #0x4
    ldr r2, _LIT1
    add r3, sp, #0xc
    str ip, [sp]
    bl func_02054c64
    mvn r1, #0x0
    cmp r0, r1
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00001002
