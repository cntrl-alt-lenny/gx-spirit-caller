; func_0202bf3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c69e8
        .extern data_0219a85c
        .extern func_0202b060
        .extern func_02038a84
        .extern func_02092800
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .global func_0202bf3c
        .arm
func_0202bf3c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    bl func_0202b060
    ldr r1, _LIT0
    ldr r1, [r1]
    ldr r1, [r1, #0x2c]
    add r2, r1, r0, lsl #0x2
    ldr r4, [r1, r0, lsl #0x2]
    ldr r1, [r2, #0x4]
    add r0, sp, #0x0
    sub r5, r1, r4
    bl func_02098294
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_02097f44
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r4
    mov r4, r0
    add r0, sp, #0x0
    mov r2, #0x0
    bl func_02097db0
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r5
    bl func_02038a84
    add r0, sp, #0x0
    bl func_02097efc
    mov r1, r5
    mov r0, r4
    bl func_02092800
    mov r0, r4
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219a85c
_LIT1: .word data_020c69e8
