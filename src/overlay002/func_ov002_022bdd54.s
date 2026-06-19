; func_ov002_022bdd54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020c7b40
        .extern data_020c7b44
        .extern func_020059b0
        .extern func_0202bcb0
        .extern func_ov002_022bdde0
        .global func_ov002_022bdd54
        .arm
func_ov002_022bdd54:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    add r1, sp, #0x4
    mov r0, #0x0
    mov r2, #0x8
    ldr r4, _LIT0
    bl Fill32
    mov r0, r5
    bl func_0202bcb0
    strh r0, [sp, #0x4]
    ldr r1, _LIT1
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0]
    add r0, sp, #0x4
    mov r2, r1, lsl #0x10
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x8
    bl func_020059b0
    cmp r0, #0x0
    blt .L_74
    ldr r1, _LIT2
    ldr r1, [r1]
    cmp r0, r1
    addcc sp, sp, #0xc
    addcc r0, r4, r0, lsl #0x3
    ldmccia sp!, {r4, r5, pc}
.L_74:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020c7b44
_LIT1: .word func_ov002_022bdde0
_LIT2: .word data_020c7b40
