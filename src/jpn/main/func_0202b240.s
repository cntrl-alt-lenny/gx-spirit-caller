; func_0202b240 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c696c
        .extern data_0219a85c
        .extern data_0219a868
        .extern func_0202b060
        .extern func_0202b0d8
        .extern func_02038a84
        .extern func_0209281c
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02098294
        .global func_0202b240
        .arm
func_0202b240:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    bl func_0202b060
    ldr r1, _LIT0
    ldr r1, [r1]
    ldr r1, [r1, #0x8]
    add r0, r1, r0, lsl #0x3
    ldr r4, [r0, #0x4]
    ldr r1, [r0, #0xc]
    add r0, sp, #0x0
    sub r5, r1, r4
    bl func_02098294
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_0202b0d8
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x0
    bl func_02097db0
    ldr r0, _LIT2
    mov r1, #0x400
    bl func_0209281c
    ldr r1, _LIT2
    mov r2, r5
    add r0, sp, #0x0
    bl func_02038a84
    add r0, sp, #0x0
    bl func_02097efc
    ldr r0, _LIT2
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219a85c
_LIT1: .word data_020c696c
_LIT2: .word data_0219a868
