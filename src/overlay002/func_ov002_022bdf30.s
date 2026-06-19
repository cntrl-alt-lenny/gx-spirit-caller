; func_ov002_022bdf30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020c7ac0
        .extern data_020c7ac4
        .extern func_020059b0
        .extern func_ov002_022bdfb4
        .global func_ov002_022bdf30
        .arm
func_ov002_022bdf30:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    add r1, sp, #0x4
    mov r0, #0x0
    mov r2, #0x4
    ldr r4, _LIT0
    bl Fill32
    ldr r1, _LIT1
    strh r5, [sp, #0x4]
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0]
    add r0, sp, #0x4
    mov r2, r1, lsl #0x10
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_020059b0
    cmp r0, #0x0
    blt .L_6c
    ldr r1, _LIT2
    ldr r1, [r1]
    cmp r0, r1
    addcc sp, sp, #0x8
    addcc r0, r4, r0, lsl #0x2
    ldmccia sp!, {r3, r4, r5, pc}
.L_6c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020c7ac4
_LIT1: .word func_ov002_022bdfb4
_LIT2: .word data_020c7ac0
