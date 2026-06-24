; func_020547f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054840
        .extern func_0207cebc
        .extern func_0207cec8
        .extern func_0207ced4
        .global func_020547f4
        .arm
func_020547f4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x68
    mov r6, r0
    add r0, sp, #0x10
    mov r5, r1
    mov r4, r2
    bl func_0207ced4
    add r0, sp, #0x10
    mov r1, r6
    mov r2, r5
    bl func_0207cec8
    add r0, sp, #0x0
    add r1, sp, #0x10
    bl func_0207cebc
    add r0, sp, #0x0
    mov r1, r4
    bl func_02054840
    add sp, sp, #0x68
    ldmia sp!, {r4, r5, r6, pc}
