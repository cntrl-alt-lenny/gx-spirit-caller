; func_0203cabc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern func_0203c8b0
        .global func_0203cabc
        .arm
func_0203cabc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r0, #0x10
    mov r4, r1
    bl func_0203c8b0
    mov r1, r0
    mov r0, r4
    add r1, r1, r5, lsl #0x8
    mov r2, #0xf0
    bl Copy32
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
