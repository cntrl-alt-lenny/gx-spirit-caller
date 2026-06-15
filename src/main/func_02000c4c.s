; func_02000c4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3bc0
        .extern data_020c4204
        .extern func_020071a4
        .global func_02000c4c
        .arm
func_02000c4c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r1, [r2, r4, lsl #0x2]
    mvn r0, #0x0
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    tst r1, #-16777216
    ldrne r0, [r2, r4, lsl #0x2]
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    add r1, r0, r1, lsl #0x4
    ldr r0, [r1, #0x4]
    cmp r0, #0x0
    blt .L_4c
    ldr r1, [r1, #0x8]
    mov r2, #0x0
    bl func_020071a4
.L_4c:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1, r4, lsl #0x2]
    ldr r0, [r0, r1, lsl #0x4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_020c3bc0
_LIT1: .word data_020c4204
