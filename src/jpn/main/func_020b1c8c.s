; func_020b1c8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b1c8c
        .arm
func_020b1c8c:
    tst r1, #-2147483648
    bne .L_480
    ldr r2, _LIT0
    subs r2, r2, r1, lsr #0x14
    blt .L_498
    cmp r2, #0x40
    bge .L_474
    mov ip, r1, lsl #0xb
    orr ip, ip, #-2147483648
    orr ip, ip, r0, lsr #0x15
    cmp r2, #0x20
    ble .L_45c
    sub r2, r2, #0x20
    mov r1, #0x0
    mov r0, ip, lsr r2
    bx lr
.L_45c:
    mov r3, r0, lsl #0xb
    mov r1, ip, lsr r2
    mov r0, r3, lsr r2
    rsb r2, r2, #0x20
    orr r0, r0, ip, lsl r2
    bx lr
.L_474:
    mov r1, #0x0
    mov r0, #0x0
    bx lr
.L_480:
    cmn r1, #0x100000
    cmpeq r0, #0x0
    bhi .L_498
    mov r1, #0x0
    mov r0, #0x0
    bx lr
.L_498:
    mvn r1, #0x0
    mvn r0, #0x0
    bx lr
_LIT0: .word 0x0000043e
