; func_ov002_021ebacc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .global func_ov002_021ebacc
        .arm
func_ov002_021ebacc:
    cmp r2, #0x5
    movge r0, #0x0
    bxge lr
    ldr r3, _LIT0
    and r1, r1, #0x1
    mov r0, #0x14
    mul r3, r1, r3
    mul ip, r2, r0
    ldr r1, _LIT1
    add r0, r1, r3
    add r0, r0, ip
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    bxeq lr
    ldr r0, _LIT2
    add r0, r0, r3
    ldrh r0, [ip, r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
