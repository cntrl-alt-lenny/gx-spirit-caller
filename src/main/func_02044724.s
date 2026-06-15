; func_02044724 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209448c
        .global func_02044724
        .arm
func_02044724:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    add r1, r5, r4, lsl #0x8
    mov r0, #0x0
    mov r2, #0x100
    bl func_0209448c
    add r0, r5, r4, lsl #0x8
    mov r1, #0xff
    strb r1, [r0, #0xe7]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
