; func_02045274 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9e0
        .extern data_0219d9e4
        .global func_02045274
        .arm
func_02045274:
    cmp r0, #0x0
    ldrne r2, _LIT0
    ldrne r2, [r2]
    strne r2, [r0]
    cmp r1, #0x0
    beq .L_dc
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x11
    addls pc, pc, r0, lsl #0x2
    b .L_d4
    b .L_d4
    b .L_a4
    b .L_74
    b .L_74
    b .L_74
    b .L_74
    b .L_80
    b .L_8c
    b .L_74
    b .L_a4
    b .L_98
    b .L_98
    b .L_98
    b .L_98
    b .L_b0
    b .L_bc
    b .L_c8
    b .L_bc
.L_74:
    mov r0, #0x6
    str r0, [r1]
    b .L_dc
.L_80:
    mov r0, #0x3
    str r0, [r1]
    b .L_dc
.L_8c:
    mov r0, #0x4
    str r0, [r1]
    b .L_dc
.L_98:
    mov r0, #0x1
    str r0, [r1]
    b .L_dc
.L_a4:
    mov r0, #0x7
    str r0, [r1]
    b .L_dc
.L_b0:
    mov r0, #0x5
    str r0, [r1]
    b .L_dc
.L_bc:
    mov r0, #0x6
    str r0, [r1]
    b .L_dc
.L_c8:
    mov r0, #0x2
    str r0, [r1]
    b .L_dc
.L_d4:
    mov r0, #0x0
    str r0, [r1]
.L_dc:
    ldr r0, _LIT1
    ldr r0, [r0]
    bx lr
_LIT0: .word data_0219d9e4
_LIT1: .word data_0219d9e0
