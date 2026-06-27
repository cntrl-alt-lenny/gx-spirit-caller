; func_ov002_021b3b30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0570
        .global func_ov002_021b3b30
        .arm
func_ov002_021b3b30:
    cmp r0, #0x0
    beq .L_b04
    ldr r3, _LIT0
.L_ad0:
    add ip, r3, r0, lsl #0x3
    ldrh r2, [ip, #0x2]
    ldrh r0, [ip, #0x6]
    mov r2, r2, lsl #0x1c
    mov r2, r2, lsr #0x1c
    cmp r2, #0x6
    bcs .L_afc
    ldrh r2, [ip]
    cmp r2, r1
    moveq r0, ip
    bxeq lr
.L_afc:
    cmp r0, #0x0
    bne .L_ad0
.L_b04:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d0570
