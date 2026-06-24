; func_0202b30c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6980
        .extern func_0202b060
        .extern func_02038a84
        .extern func_02092800
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .global func_0202b30c
        .arm
func_0202b30c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    mov r5, r1
    bl func_0202b060
    mov r1, #0x0
    mov r4, r0, lsl #0x3
    str r1, [r5, #0x4]
    add r0, sp, #0x0
    str r1, [r5]
    bl func_02098294
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_02097f44
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x0
    bl func_02097db0
    add r0, sp, #0x0
    mov r1, r5
    mov r2, #0x8
    bl func_02038a84
    add r0, sp, #0x0
    bl func_02097efc
    mov r0, r5
    mov r1, #0x8
    bl func_02092800
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020c6980
