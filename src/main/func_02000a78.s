; func_02000a78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_027e0000
        .extern data_027e0021
        .global func_02000a78
        .arm
func_02000a78:
    mrc p15, 0, r0, c1, c0, 0
    ldr r1, _LIT0
    bic r0, r0, r1
    mcr p15, 0, r0, c1, c0, 0
    mov r0, #0x0
    mcr p15, 0, r0, c7, c5, 0
    mcr p15, 0, r0, c7, c6, 0
    mcr p15, 0, r0, c7, c10, 4
    ldr r0, _LIT1
    mcr p15, 0, r0, c6, c0, 0
    ldr r0, _LIT2
    mcr p15, 0, r0, c6, c1, 0
    ldr r0, _LIT3
    mcr p15, 0, r0, c6, c2, 0
    ldr r0, _LIT4
    mcr p15, 0, r0, c6, c3, 0
    ldr r0, _LIT5
    orr r0, r0, #0x1a
    orr r0, r0, #0x1
    mcr p15, 0, r0, c6, c4, 0
    ldr r0, _LIT6
    mcr p15, 0, r0, c6, c5, 0
    ldr r0, _LIT7
    mcr p15, 0, r0, c6, c6, 0
    ldr r0, _LIT8
    mcr p15, 0, r0, c6, c7, 0
    mov r0, #0x20
    mcr p15, 0, r0, c9, c1, 1
    ldr r0, _LIT5
    orr r0, r0, #0xa
    mcr p15, 0, r0, c9, c1, 0
    mov r0, #0x42
    mcr p15, 0, r0, c2, c0, 1
    mov r0, #0x42
    mcr p15, 0, r0, c2, c0, 0
    mov r0, #0x2
    mcr p15, 0, r0, c3, c0, 0
    ldr r0, _LIT9
    mcr p15, 0, r0, c5, c0, 3
    ldr r0, _LIT10
    mcr p15, 0, r0, c5, c0, 2
    mrc p15, 0, r0, c1, c0, 0
    ldr r1, _LIT11
    orr r0, r0, r1
    mcr p15, 0, r0, c1, c0, 0
    bx lr
_LIT0: .word 0x000f9005
_LIT1: .word 0x04000033
_LIT2: .word 0x0200002d
_LIT3: .word data_027e0021
_LIT4: .word 0x08000035
_LIT5: .word data_027e0000
_LIT6: .word 0x0100002f
_LIT7: .word 0xffff001d
_LIT8: .word 0x027ff017
_LIT9: .word 0x05100011
_LIT10: .word 0x15111011
_LIT11: .word 0x0005707d
