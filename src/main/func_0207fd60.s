; func_0207fd60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e8b8
        .extern func_0207f8c8
        .extern func_0207fd48
        .global func_0207fd60
        .arm
func_0207fd60:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    str r2, [r5, #0x30]
    mvn r2, #0x0
    add r0, r5, #0x38
    mov r1, #0x1
    str r2, [r5, #0x34]
    bl func_0207f8c8
    mov r0, r5
    bl func_0207e8b8
    mov r0, r5
    mov r1, r4
    bl func_0207fd48
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
