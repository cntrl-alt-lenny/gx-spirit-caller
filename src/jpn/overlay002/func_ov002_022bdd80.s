; func_ov002_022bdd80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020c8da0
        .extern data_020c8da4
        .extern func_02005994
        .extern func_0202bc5c
        .extern func_ov002_022bde10
        .global func_ov002_022bdd80
        .arm
func_ov002_022bdd80:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov r5, r0
    add r1, sp, #0x4
    mov r0, #0x0
    mov r2, #0x24
    ldr r4, _LIT0
    bl Fill32
    mov r0, r5
    bl func_0202bc5c
    strh r0, [sp, #0x4]
    ldr r1, _LIT1
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0]
    add r0, sp, #0x4
    mov r2, r1, lsl #0x10
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x24
    bl func_02005994
    cmp r0, #0x0
    blt .L_78
    ldr r1, _LIT2
    ldr r1, [r1]
    cmp r0, r1
    movcc r1, #0x24
    addcc sp, sp, #0x28
    mlacc r0, r1, r0, r4
    ldmccia sp!, {r3, r4, r5, pc}
.L_78:
    mov r0, #0x0
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020c8da4
_LIT1: .word func_ov002_022bde10
_LIT2: .word data_020c8da0
