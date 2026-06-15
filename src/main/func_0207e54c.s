; func_0207e54c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e3d4
        .extern func_0207e7d8
        .global func_0207e54c
        .arm
func_0207e54c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r1
    ldr r1, _LIT0
    bl func_0207e7d8
    movs r4, r0
    moveq r0, #0x0
    addeq sp, sp, #0x4
    streq r0, [r5]
    ldmeqia sp!, {r4, r5, pc}
    add r0, r4, #0x8
    bl func_0207e3d4
    add r0, r4, #0x8
    str r0, [r5]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x41424e4b
