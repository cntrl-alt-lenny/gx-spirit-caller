; func_02082244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a17d8
        .extern data_021a17e0
        .extern data_021a1824
        .extern data_021a1894
        .extern MTX_Identity33_
        .extern MTX_Identity43_
        .extern MTX_Identity44_
        .global func_02082244
        .arm
func_02082244:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr r8, _LIT0
    ldr r1, _LIT1
    ldr r5, _LIT2
    ldr r4, _LIT3
    ldr r3, _LIT4
    ldr r2, _LIT5
    mov r7, #0x0
    mov r6, #0x2
    ldr r0, _LIT6
    str r8, [r1]
    str r7, [r1, #0x4]
    str r6, [r1, #0x48]
    str r5, [r1, #0x7c]
    str r4, [r1, #0x90]
    str r3, [r1, #0xa4]
    str r2, [r1, #0xb8]
    bl MTX_Identity43_
    ldr r0, _LIT7
    bl MTX_Identity44_
    mov r2, r7
    ldr r1, _LIT1
    ldr r7, _LIT8
    ldr r0, _LIT9
    ldr lr, _LIT10
    ldr r9, _LIT11
    ldr r8, _LIT12
    ldr r6, _LIT13
    ldr r5, _LIT14
    ldr r4, _LIT15
    ldr ip, _LIT16
    ldr r3, _LIT17
    str r0, [r1, #0x84]
    str lr, [r1, #0x80]
    mov lr, #0x4000001f
    ldr r0, _LIT18
    str r9, [r1, #0x88]
    str r8, [r1, #0x8c]
    str r7, [r1, #0x94]
    str r7, [r1, #0x98]
    str r6, [r1, #0x9c]
    str r5, [r1, #0xa0]
    str r4, [r1, #0xa8]
    str lr, [r1, #0xac]
    str ip, [r1, #0xb0]
    str r3, [r1, #0xb4]
    str r2, [r1, #0xe0]
    str r2, [r1, #0xe4]
    str r2, [r1, #0xe8]
    bl MTX_Identity33_
    mov r3, #0x1000
    ldr r0, _LIT1
    mov r2, #0x0
    rsb r1, r3, #0x0
    str r3, [r0, #0xec]
    str r3, [r0, #0xf0]
    str r3, [r0, #0xf4]
    str r2, [r0, #0xf8]
    str r2, [r0, #0xfc]
    str r2, [r0, #0x248]
    str r2, [r0, #0x244]
    str r2, [r0, #0x240]
    str r2, [r0, #0x254]
    str r2, [r0, #0x24c]
    str r3, [r0, #0x250]
    str r2, [r0, #0x25c]
    str r2, [r0, #0x258]
    str r1, [r0, #0x260]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x17101610
_LIT1: .word data_021a17d8
_LIT2: .word 0x32323232
_LIT3: .word 0x60293130
_LIT4: .word 0x33333333
_LIT5: .word 0x002a1b19
_LIT6: .word data_021a1824
_LIT7: .word data_021a17e0
_LIT8: .word 0x4210c210
_LIT9: .word 0x40000200
_LIT10: .word 0x2d8b62d8
_LIT11: .word 0x800001ff
_LIT12: .word 0xc0080000
_LIT13: .word 0x001f008f
_LIT14: .word 0xbfff0000
_LIT15: .word 0x00007fff
_LIT16: .word 0x800003e0
_LIT17: .word 0xc0007c00
_LIT18: .word data_021a1894
