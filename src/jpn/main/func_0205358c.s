; func_0205358c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020535b8
        .extern func_0205362c
        .global func_0205358c
        .arm
func_0205358c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_0205362c
    bic r1, r0, #0x3
    mov r0, r5
    orr r1, r1, r4
    bl func_020535b8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
