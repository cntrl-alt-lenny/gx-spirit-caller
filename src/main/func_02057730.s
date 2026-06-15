; func_02057730 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fff84
        .extern data_020fffa0
        .extern data_02100080
        .extern data_0210008c
        .extern data_0210009c
        .extern func_02058038
        .extern func_02058070
        .global func_02057730
        .arm
func_02057730:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6]
    ldr r2, _LIT0
    mov r5, r1
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, _LIT1
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, [r4, #0x198]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT2
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, [r5]
    bl func_02058038
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT3
    bl func_02058070
    ldr r2, [r5, #0x10]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT4
    bl func_02058070
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100080
_LIT1: .word data_020fff84
_LIT2: .word data_0210008c
_LIT3: .word data_0210009c
_LIT4: .word data_020fffa0
