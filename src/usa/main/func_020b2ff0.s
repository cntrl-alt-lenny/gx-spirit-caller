; func_020b2ff0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b2ff0
        .arm
func_020b2ff0:
    and r2, r0, #-2147483648
    mov ip, r0, lsr #0x17
    mov r3, r0, lsl #0x9
    ands ip, ip, #0xff
    beq .L_3f4
    cmp ip, #0xff
    beq .L_420
.L_3e0:
    add ip, ip, #0x380
    mov r0, r3, lsl #0x14
    orr r1, r2, r3, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    bx lr
.L_3f4:
    cmp r3, #0x0
    bne .L_408
    mov r1, r2
    mov r0, #0x0
    bx lr
.L_408:
    mov r3, r3, lsr #0x1
    clz ip, r3
    movs r3, r3, lsl ip
    rsb ip, ip, #0x1
    add r3, r3, r3
    b .L_3e0
.L_420:
    cmp r3, #0x0
    bhi .L_438
    ldr r1, _LIT0
    orr r1, r1, r2
    mov r0, #0x0
    bx lr
.L_438:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    bx lr
_LIT0: .word 0x7ff00000
