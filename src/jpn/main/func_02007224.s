; func_02007224 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a65f4
        .extern func_020a66d8
        .global func_02007224
        .arm
func_02007224:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x400
    mov r4, r1
    mov r5, r0
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_020a66d8
    add r0, sp, #0x0
    mov r1, r5
    mov r2, r4
    bl func_020a65f4
    add sp, sp, #0x400
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0xedb88320
