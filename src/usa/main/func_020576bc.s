; func_020576bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffea4
        .extern data_020ffec0
        .extern data_020fffa0
        .extern data_020fffac
        .extern data_020fffbc
        .extern func_02057fc4
        .extern func_02057ffc
        .global func_020576bc
        .arm
func_020576bc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6]
    ldr r2, _LIT0
    mov r5, r1
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT1
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT2
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, [r5]
    bl func_02057fc4
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT3
    bl func_02057ffc
    ldr r2, [r5, #0x10]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT4
    bl func_02057ffc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020fffa0
_LIT1: .word data_020ffea4
_LIT2: .word data_020fffac
_LIT3: .word data_020fffbc
_LIT4: .word data_020ffec0
