; func_0202b360 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6a60
        .extern func_0202b0b4
        .extern func_02038ad4
        .extern func_020928e8
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_0202b360
        .arm
func_0202b360:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    mov r5, r1
    bl func_0202b0b4
    mov r1, #0x0
    mov r4, r0, lsl #0x3
    str r1, [r5, #0x4]
    add r0, sp, #0x0
    str r1, [r5]
    bl func_02098388
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_02098038
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x0
    bl func_02097ea4
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x8
    bl func_02038ad4
    add r0, sp, #0x0
    bl func_02097ff0
    mov r0, r5
    mov r1, #0x8
    bl func_020928e8
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020c6a60
