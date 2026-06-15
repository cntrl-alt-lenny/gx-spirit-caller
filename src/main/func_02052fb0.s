; func_02052fb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a66e8
        .extern func_020a67cc
        .global func_02052fb0
        .arm
func_02052fb0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x400
    mov r4, r0
    ldr r1, [r4, #0x20]
    add r0, sp, #0x0
    bic r2, r1, #0x1
    ldr r1, _LIT0
    str r2, [r4, #0x20]
    bl func_020a67cc
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x3c
    bl func_020a66e8
    str r0, [r4, #0x3c]
    add sp, sp, #0x400
    ldmia sp!, {r4, pc}
_LIT0: .word 0xedb88320
