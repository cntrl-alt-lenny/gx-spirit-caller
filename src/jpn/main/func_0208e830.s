; func_0208e830 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e45c
        .extern func_0208e6c4
        .extern func_0208e774
        .global func_0208e830
        .arm
func_0208e830:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0208e774
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldr r1, _LIT1
.L_1c:
    ldr r0, [r1]
    ands r0, r0, #0x8000000
    bne .L_1c
    ldr r0, _LIT2
    mov r3, #0x0
    strh r3, [r0]
    ldr r2, _LIT3
    str r3, [r1]
    str r3, [r2]
    ldrh ip, [r0]
    ldr r2, _LIT4
    ldr r3, _LIT5
    orr ip, ip, #0x2000
    strh ip, [r0]
    ldrh ip, [r0]
    orr ip, ip, #0x1000
    strh ip, [r0]
    ldrh ip, [r0]
    and r2, ip, r2
    strh r2, [r0]
    ldrh r2, [r0]
    bic r2, r2, #0x3000
    orr r2, r2, #0x10
    strh r2, [r0]
    ldrh r2, [r0]
    and r2, r2, r3
    strh r2, [r0]
    ldr r0, [r1]
    orr r0, r0, #0x8000
    str r0, [r1]
    ldr r0, [r1]
    bic r0, r0, #-1073741824
    orr r0, r0, #-2147483648
    str r0, [r1]
    bl func_0208e6c4
    ldr r0, _LIT6
    mov r3, #0x0
    ldr r2, _LIT7
    ldr r1, _LIT8
    str r3, [r0]
    ldr r0, _LIT9
    strh r2, [r1]
    ldr r1, _LIT10
    strh r3, [r0]
    ldr r0, _LIT11
    str r3, [r1]
    ldr r1, _LIT12
    strh r3, [r0]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    bl func_0208e45c
    ldr r2, _LIT13
    ldr r0, _LIT14
    ldr r1, _LIT15
    str r2, [r0]
    mov r2, #0x0
    ldr r0, _LIT16
    str r2, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x04000504
_LIT1: .word 0x04000600
_LIT2: .word 0x04000060
_LIT3: .word 0x04000010
_LIT4: .word 0xffffcffd
_LIT5: .word 0x0000cffb
_LIT6: .word 0x04000350
_LIT7: .word 0x00007fff
_LIT8: .word 0x04000354
_LIT9: .word 0x04000356
_LIT10: .word 0x04000358
_LIT11: .word 0x0400035c
_LIT12: .word 0x04000008
_LIT13: .word 0x001f0080
_LIT14: .word 0x040004a4
_LIT15: .word 0x040004a8
_LIT16: .word 0x040004ac
