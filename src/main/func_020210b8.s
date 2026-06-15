; func_020210b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02194340
        .extern data_02194374
        .extern func_020212cc
        .extern func_02021bac
        .extern func_02023188
        .global func_020210b8
        .arm
func_020210b8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    ldr r6, _LIT1
    mov r5, #0x0
.L_3c8:
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_3dc
    mov r0, r6
    bl func_020212cc
.L_3dc:
    add r0, r6, #0x218
    add r5, r5, #0x1
    cmp r5, #0x8
    add r6, r0, #0x400
    blt .L_3c8
    bl func_02023188
    bl func_02021bac
    ldr r2, _LIT2
    mov r1, r4
    mov r0, #0x0
    bl Fill32
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02194340
_LIT1: .word data_02194374
_LIT2: .word 0x000030f4
