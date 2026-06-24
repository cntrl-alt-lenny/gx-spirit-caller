; func_020317e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020317e4
        .arm
func_020317e4:
    sub r1, r0, #0x4a
    sub r1, r1, #0x1600
    ldr r0, _LIT0
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_60
    b .L_30
    b .L_38
    b .L_40
    b .L_48
    b .L_50
    b .L_58
.L_30:
    add r0, r0, #0x12
    bx lr
.L_38:
    add r0, r0, #0x13
    bx lr
.L_40:
    add r0, r0, #0x14
    bx lr
.L_48:
    add r0, r0, #0x15
    bx lr
.L_50:
    add r0, r0, #0x16
    bx lr
.L_58:
    add r0, r0, #0x17
    bx lr
.L_60:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000164a
