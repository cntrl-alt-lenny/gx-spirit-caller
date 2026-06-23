; func_ov011_021cd63c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_ov011_021cd61c
        .global func_ov011_021cd63c
        .arm
func_ov011_021cd63c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    bne .L_34
    ldr r0, [r1, #0x268]
    mov r1, r0, lsl #0x17
    mov r2, r0, lsl #0x13
    mov r0, r2, lsr #0x1c
    mov r1, r1, lsr #0x1c
    bl func_ov011_021cd61c
    ldmia sp!, {r3, pc}
.L_34:
    ldr r0, [r1, #0x214]
    mov r1, #0x0
    mov r2, #0x1000
    mov r3, #0x80
    .word 0xebff9824
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
