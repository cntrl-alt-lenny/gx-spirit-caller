; func_ov002_021bac78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .global func_ov002_021bac78
        .arm
func_ov002_021bac78:
    ldr r2, _LIT0
    and ip, r0, #0x1
    mul r3, ip, r2
    mov r0, #0x14
    mul ip, r1, r0
    ldr r2, _LIT1
    add r0, r2, r3
    ldrh r1, [ip, r0]
    mov r0, #0x0
    cmp r1, #0x0
    bxeq lr
    ldr r1, _LIT2
    add r1, r1, r3
    ldr r2, [ip, r1]
    mov r1, r2, lsr #0x2
    orr r1, r1, r2, lsr #0x1
    tst r1, #0x1
    moveq r0, #0x1
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word data_ov002_022cf0cc
