; func_020a22a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c353c
        .extern func_02094688
        .extern func_020a20e8
        .global func_020a22a0
        .arm
func_020a22a0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r2, #0x22c0000
    mov r5, r1
    str r2, [sp]
    mov r6, r0
    ldr r0, [r5, #0x24]
    ldr r4, _LIT0
    str r0, [r6]
    ldr r0, [r5, #0x34]
    add r8, r5, #0x160
    str r0, [r6, #0x4]
    add sl, r6, #0xc
    mov r9, #0x0
    add r7, sp, #0x0
.L_568:
    mov r0, r5
    mov r1, r4
    mov r2, sl
    mov r3, r7
    bl func_020a20e8
    add r9, r9, #0x1
    cmp r9, #0x3
    add sl, sl, #0x10
    add r4, r4, #0x4
    blt .L_568
    mov r0, r8
    add r1, r6, #0x3c
    mov r2, #0x88
    bl func_02094688
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_020c353c
