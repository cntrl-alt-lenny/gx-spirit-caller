; func_ov002_0220971c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .global func_ov002_0220971c
        .arm
func_ov002_0220971c:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov ip, r2, lsr #0x1f
    and r2, ip, #0x1
    mul r3, r2, r0
    ldr r1, [r1, r3]
    cmp r1, #0x0
    bne .L_12c
    rsb r1, ip, #0x1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
.L_12c:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf098
