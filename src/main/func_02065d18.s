; func_02065d18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054c30
        .global func_02065d18
        .arm
func_02065d18:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    mov r3, #0x8
    add r1, sp, #0x0
    add r2, sp, #0x8
    str r3, [sp, #0x8]
    bl func_02054c30
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x0
    ldrneh r0, [sp, #0x2]
    add sp, sp, #0xc
    ldmfd sp!, {pc}
