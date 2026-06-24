; func_0209d05c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209d05c
        .arm
func_0209d05c:
    ldr r3, _LIT0
.L_4:
    ldr r2, [r3]
    ands r2, r2, #-2147483648
    bne .L_4
    ldr r3, _LIT1
    mov ip, #0xc0
    ldr r2, _LIT2
    strb ip, [r3]
    mov ip, r0, lsr #0x18
    ldr r3, _LIT3
    strb ip, [r2]
    mov ip, r0, lsr #0x10
    ldr r2, _LIT4
    strb ip, [r3]
    mov ip, r0, lsr #0x8
    ldr r3, _LIT5
    strb ip, [r2]
    ldr r2, _LIT6
    strb r0, [r3]
    mov r3, r1, lsr #0x18
    ldr r0, _LIT7
    strb r3, [r2]
    mov r3, r1, lsr #0x10
    ldr r2, _LIT8
    strb r3, [r0]
    mov r3, r1, lsr #0x8
    ldr r0, _LIT9
    strb r3, [r2]
    strb r1, [r0]
    bx lr
_LIT0: .word 0x040001a4
_LIT1: .word 0x040001a1
_LIT2: .word 0x040001a8
_LIT3: .word 0x040001a9
_LIT4: .word 0x040001aa
_LIT5: .word 0x040001ab
_LIT6: .word 0x040001ac
_LIT7: .word 0x040001ad
_LIT8: .word 0x040001ae
_LIT9: .word 0x040001af
