; func_ov002_0228dddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b95c
        .extern func_ov002_02281494
        .global func_ov002_0228dddc
        .arm
func_ov002_0228dddc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    ldr r3, _LIT1
    and r4, r0, #0x1
    mla r0, r4, r2, r3
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b95c
    mov r4, r0
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_02281494
    rsb r1, r4, #0x3
    add r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
