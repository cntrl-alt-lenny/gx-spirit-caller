; func_02056bc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffea4
        .extern data_020ffec0
        .extern data_020fff0c
        .extern data_020fff14
        .extern data_020fff18
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_0206043c
        .global func_02056bc0
        .arm
func_02056bc0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov r7, r0
    mov r5, r2
    mov r6, r1
    ldr r2, _LIT1
    add r0, sp, #0x0
    mov r1, r3
    ldr r4, [r7]
    bl func_0206043c
    ldr r2, _LIT2
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r7
    mov r2, r5
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT3
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT4
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r2, r6
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT5
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r7
    add r1, r4, #0x1f4
    add r2, sp, #0x0
    bl func_02057ffc
    ldr r2, _LIT6
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00000db4
_LIT1: .word 0x00000dad
_LIT2: .word data_020fff0c
_LIT3: .word data_020ffea4
_LIT4: .word data_020fff14
_LIT5: .word data_020fff18
_LIT6: .word data_020ffec0
