; func_ov002_021fbf30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .global func_ov002_021fbf30
        .arm
func_ov002_021fbf30:
    ldr r3, _LIT0
    mov r2, #0x0
    ldr ip, [r3, #0x490]
    cmp ip, #0x0
    bls .L_a0
.L_7c:
    ldrh r1, [r3, #0x4]
    mov r1, r1, lsl #0x11
    cmp r0, r1, lsr #0x17
    moveq r0, #0x1
    bxeq lr
    add r2, r2, #0x1
    cmp r2, ip
    add r3, r3, #0x18
    bcc .L_7c
.L_a0:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022ce288
