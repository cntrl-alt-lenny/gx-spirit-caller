; func_ov021_021aa4a0 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov021_021abea0
        .extern data_ov021_021ace80
        .extern data_ov021_021ad7d4
        .extern func_020071a4
        .global func_ov021_021aa4a0
        .arm
func_ov021_021aa4a0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_38
    blx r0
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x0
    strne r1, [r0, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_38:
    ldr r0, _LIT2
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    mov r0, #0x9
    ldr r2, _LIT3
    sub r1, r0, #0xa
    bl func_020071a4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov021_021ace80
_LIT1: .word data_ov021_021abea0
_LIT2: .word data_021040ac
_LIT3: .word data_ov021_021ad7d4
