; func_0202b294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6a4c
        .extern data_0219a93c
        .extern data_0219a948
        .extern func_0202b0b4
        .extern func_0202b12c
        .extern func_02038ad4
        .extern func_02092904
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098388
        .global func_0202b294
        .arm
func_0202b294:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    bl func_0202b0b4
    ldr r1, _LIT0
    ldr r1, [r1]
    ldr r1, [r1, #0x8]
    add r0, r1, r0, lsl #0x3
    ldr r4, [r0, #0x4]
    ldr r1, [r0, #0xc]
    add r0, sp, #0x0
    sub r5, r1, r4
    bl func_02098388
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_0202b12c
    add r0, sp, #0x0
    mov r1, r4
    mov r2, #0x0
    bl func_02097ea4
    ldr r0, _LIT2
    mov r1, #0x400
    bl func_02092904
    ldr r1, _LIT2
    mov r2, r5
    add r0, sp, #0x0
    bl func_02038ad4
    add r0, sp, #0x0
    bl func_02097ff0
    ldr r0, _LIT2
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219a93c
_LIT1: .word data_020c6a4c
_LIT2: .word data_0219a948
