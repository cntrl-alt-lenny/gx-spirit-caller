; func_ov002_02207438 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a8
        .global func_ov002_02207438
        .arm
func_ov002_02207438:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mul ip, r3, r0
    ldr r0, [r1, ip]
    cmp r0, #0x2
    movcc r0, #0x0
    bxcc lr
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    moveq r0, #0x1
    bxeq lr
    ldr r0, _LIT2
    ldr r0, [r0, ip]
    cmp r0, #0x4
    bcc .L_64
    ldr r0, _LIT3
    ldr r0, [r0, ip]
    cmp r0, #0x0
    moveq r0, #0x1
    bxeq lr
.L_64:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf0a8
_LIT3: .word data_ov002_022cf0a0
