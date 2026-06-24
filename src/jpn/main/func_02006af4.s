; func_02006af4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .global func_02006af4
        .arm
func_02006af4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    mov r4, r0
    add r0, sp, #0x0
    bl func_02098294
    add r0, sp, #0x0
    mov r1, r4
    bl func_02097f44
    movs r4, r0
    beq .L_108
    add r0, sp, #0x0
    bl func_02097efc
.L_108:
    mov r0, r4
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
