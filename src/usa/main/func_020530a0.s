; func_020530a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a65f4
        .extern func_020a66d8
        .global func_020530a0
        .arm
func_020530a0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x400
    ldr r1, _LIT0
    mov r4, r0
    add r0, sp, #0x0
    bl func_020a66d8
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x3c
    bl func_020a65f4
    ldr r1, [r4, #0x3c]
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x400
    ldmia sp!, {r4, pc}
_LIT0: .word 0xedb88320
