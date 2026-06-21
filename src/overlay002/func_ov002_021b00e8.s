; func_ov002_021b00e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern data_ov002_022cf184
        .extern data_ov002_022cf188
        .global func_ov002_021b00e8
        .arm
func_ov002_021b00e8:
    sub r1, r1, #0xc
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_80
    b .L_20
    b .L_38
    b .L_50
    b .L_68
.L_20:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT1
    ldr r0, [r0, r1]
    bx lr
.L_38:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    bx lr
.L_50:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT3
    ldr r0, [r0, r1]
    bx lr
.L_68:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT4
    ldr r0, [r0, r1]
    bx lr
.L_80:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf184
_LIT2: .word data_ov002_022cf17c
_LIT3: .word data_ov002_022cf180
_LIT4: .word data_ov002_022cf188
