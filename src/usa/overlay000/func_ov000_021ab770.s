; func_ov000_021ab770 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ab770
        .arm
func_ov000_021ab770:
    cmp r0, #0x0
    beq .L_124
    cmp r0, #0x1
    beq .L_148
    bx lr
.L_124:
    ldr r1, _LIT0
    ldrh r0, [r1]
    and r2, r0, #0xc0
    mov r2, r2, asr #0x6
    sub r2, r2, #0x2
    cmp r2, #0x1
    bicls r0, r0, #0xc0
    strlsh r0, [r1]
    bx lr
.L_148:
    ldr r1, _LIT1
    ldrh r0, [r1]
    and r2, r0, #0xc0
    mov r2, r2, asr #0x6
    sub r2, r2, #0x2
    cmp r2, #0x1
    bicls r0, r0, #0xc0
    strlsh r0, [r1]
    bx lr
_LIT0: .word 0x04000050
_LIT1: .word 0x04001050
