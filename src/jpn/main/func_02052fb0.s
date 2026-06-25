; func_02052fb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a65f4
        .extern func_020a66d8
        .global func_02052fb0
        .arm
func_02052fb0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x400
    mov r4, r0
    add r3, r4, #0x10
    mov ip, r2
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r1, _LIT0
    add r0, sp, #0x0
    str ip, [r4, #0x1c]
    bl func_020a66d8
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x3c
    bl func_020a65f4
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x20]
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    add sp, sp, #0x400
    ldmia sp!, {r4, pc}
_LIT0: .word 0xedb88320
