; func_ov002_022888dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202b89c
        .global func_ov002_022888dc
        .arm
func_ov002_022888dc:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x16
    bne .L_f0
    ldr r1, [r0, #0x14]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    ldr r1, _LIT1
    cmp r0, r1
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, pc}
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0170
_LIT1: .word 0x000005dc
