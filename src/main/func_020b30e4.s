; func_020b30e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b30e4
        .arm
func_020b30e4:
    and r2, r0, #-2147483648
    mov ip, r0, lsr #0x17
    mov r3, r0, lsl #0x9
    ands ip, ip, #0xff
    beq .L_79c
    cmp ip, #0xff
    beq .L_7c8
.L_788:
    add ip, ip, #0x380
    mov r0, r3, lsl #0x14
    orr r1, r2, r3, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    bx lr
.L_79c:
    cmp r3, #0x0
    bne .L_7b0
    mov r1, r2
    mov r0, #0x0
    bx lr
.L_7b0:
    mov r3, r3, lsr #0x1
    clz ip, r3
    movs r3, r3, lsl ip
    rsb ip, ip, #0x1
    add r3, r3, r3
    b .L_788
.L_7c8:
    cmp r3, #0x0
    bhi .L_7e0
    ldr r1, _LIT0
    orr r1, r1, r2
    mov r0, #0x0
    bx lr
.L_7e0:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    bx lr
_LIT0: .word 0x7ff00000
