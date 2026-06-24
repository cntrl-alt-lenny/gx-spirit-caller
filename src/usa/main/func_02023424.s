; func_02023424 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_0219a7fc
        .extern func_0208e504
        .global func_02023424
        .arm
func_02023424:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_230
    ldr r0, [r4]
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4]
.L_230:
    mov r3, #0x4000000
    ldr r1, [r3]
    ldr r0, [r3]
    and r1, r1, #0x1f00
    mov r2, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r2, #0x1
    orr r0, r1, r0, lsl #0x8
    ldr r2, _LIT2
    str r0, [r3]
    mov r0, #0x0
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp]
    bl func_0208e504
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_0219a7fc
_LIT1: .word data_0219a7fc
_LIT2: .word 0x00007fff
