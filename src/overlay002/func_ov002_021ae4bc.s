; func_ov002_021ae4bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202b100
        .extern func_ov002_0229ade0
        .extern func_ov002_0229ce5c
        .global func_ov002_021ae4bc
        .arm
func_ov002_021ae4bc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    mov r4, r1
    ldr r1, _LIT0
    mov r2, r4, lsl #0x2
    ldrh r1, [r1, r2]
    mov r5, r0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, r5
    bl func_ov002_0229ce5c
    add r2, sp, #0x0
    mov r3, r4
    mov r0, #0x31
    mov r1, #0x1
    bl func_ov002_0229ade0
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0250
