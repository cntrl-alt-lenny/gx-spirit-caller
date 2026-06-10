; func_ov002_0225a51c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022d016c
        .extern func_ov002_021d479c
        .global func_ov002_0225a51c
        .arm
func_ov002_0225a51c:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    mov r2, #0x1
    str r2, [r3, #0xd2c]
    mov ip, #0x0
    ldr r2, _LIT1
    str ip, [r3, #0xd30]
    ldr r2, [r2, #0x18]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r0, #0x0
    movne ip, #0x8000
    orr r0, ip, #0x1b
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x1
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd3f4
