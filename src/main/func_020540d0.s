; func_020540d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb10
        .extern func_020a6d54
        .global func_020540d0
        .arm
func_020540d0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r1
    mov r5, r0
    bmi .L_2f4
    ldr r0, [r5]
    cmp r4, r0
    blt .L_308
.L_2f4:
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x94
    bl func_020a6d54
.L_308:
    cmp r4, #0x0
    blt .L_31c
    ldr r0, [r5]
    cmp r4, r0
    blt .L_328
.L_31c:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_328:
    ldr r0, [r5, #0x14]
    ldr r1, [r5, #0x8]
    mla r0, r1, r4, r0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffb10
_LIT1: .word data_020ffb04
