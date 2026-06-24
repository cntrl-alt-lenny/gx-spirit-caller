; func_0203f4f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094688
        .extern func_02098fec
        .extern func_020990b0
        .extern func_020991a4
        .global func_0203f4f4
        .arm
func_0203f4f4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x6c
    mov r5, r0
    add r0, sp, #0x14
    mov r4, r1
    bl func_020991a4
    add r0, sp, #0x14
    mov r1, r5
    mov r2, #0x18
    bl func_020990b0
    add r0, sp, #0x0
    add r1, sp, #0x14
    bl func_02098fec
    add r0, sp, #0x3
    mov r1, r4
    mov r2, #0xd
    bl func_02094688
    add sp, sp, #0x6c
    ldmia sp!, {r4, r5, pc}
