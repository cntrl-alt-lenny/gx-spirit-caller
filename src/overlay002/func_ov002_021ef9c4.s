; func_ov002_021ef9c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_021ef9c4
        .arm
func_ov002_021ef9c4:
    cmp r2, #0x4
    movgt r0, #0x0
    bxgt lr
    ldr r3, _LIT0
    ldr ip, _LIT1
    and r1, r1, #0x1
    mla r3, r1, r3, ip
    mov r1, #0x14
    mul ip, r2, r1
    add r1, r3, #0x30
    ldr r3, [r1, ip]
    mov r1, r3, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    bxeq lr
    ldrh r1, [r0, #0x4]
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x11
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
