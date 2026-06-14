; func_ov019_021b4f1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .global func_ov019_021b4f1c
        .arm
func_ov019_021b4f1c:
    ldr r0, [r0, #0xc0]
    cmp r0, #0x7
    bgt .L_38
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    bx lr
    bx lr
    bx lr
    b .L_44
    b .L_58
    bx lr
    b .L_6c
    bx lr
    b .L_94
.L_38:
    cmp r0, #0x2d
    moveq r0, #0x49
    bx lr
.L_44:
    ldr r1, _LIT0
    ldr r1, [r1, #0x928]
    cmp r1, #0x24
    movcs r0, #0x4a
    bx lr
.L_58:
    ldr r1, _LIT0
    ldr r1, [r1, #0x928]
    cmp r1, #0x29
    movcs r0, #0x5e
    bx lr
.L_6c:
    ldr r1, _LIT0
    ldr r2, [r1, #0x928]
    cmp r2, #0x17
    movhi r0, #0x4b
    bxhi lr
    bxne lr
    ldr r1, [r1, #0x92c]
    cmp r1, #0x4
    movcs r0, #0x4b
    bx lr
.L_94:
    ldr r1, _LIT0
    ldr r2, [r1, #0x928]
    cmp r2, #0x2b
    movhi r0, #0x3f
    bxhi lr
    bxne lr
    ldr r1, [r1, #0x92c]
    cmp r1, #0x3
    movcs r0, #0x3f
    bx lr
_LIT0: .word data_02104f4c
