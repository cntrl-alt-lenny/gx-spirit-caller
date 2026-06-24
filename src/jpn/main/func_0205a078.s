; func_0205a078 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021006b0
        .extern data_021006c8
        .extern data_021006d4
        .extern data_021006dc
        .extern func_02057fc4
        .extern func_02057ffc
        .global func_0205a078
        .arm
func_0205a078:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r4, [r7]
    mov r5, r2
    mov r6, r1
    ldr r2, _LIT0
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT1
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r2, r6
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057fc4
    mov r0, r7
    add r1, r4, #0x1f4
    ldr r2, _LIT2
    bl func_02057ffc
    mov r2, r5
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057fc4
    mov r0, r7
    add r1, r4, #0x1f4
    ldr r2, _LIT3
    bl func_02057ffc
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021006b0
_LIT1: .word data_021006c8
_LIT2: .word data_021006d4
_LIT3: .word data_021006dc
