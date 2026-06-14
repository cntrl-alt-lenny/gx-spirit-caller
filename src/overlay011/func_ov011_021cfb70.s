; func_ov011_021cfb70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .global func_ov011_021cfb70
        .arm
func_ov011_021cfb70:
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r0, [r0, #0x2b0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1c
    beq .L_24
    cmp r0, #0x1
    beq .L_3c
    bx lr
.L_24:
    ldr r1, [r2, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0x28000
    str r0, [r2, #0x274]
    bx lr
.L_3c:
    ldr r1, [r2, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    str r0, [r2, #0x274]
    bx lr
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
_LIT2: .word 0xffe01fff
