; func_0202ab88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202ab88
        .arm
func_0202ab88:
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_104
    b .L_20
    b .L_28
    b .L_94
    b .L_9c
.L_20:
    mov r1, #0x1
    b .L_2c
.L_28:
    mov r1, #0x2
.L_2c:
    ldrh r0, [r0, #0xea]
    mov r2, r0, lsl #0x1f
    movs r2, r2, lsr #0x1f
    beq .L_6c
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_6c
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r0, [r3]
    and ip, r2, #0xe000
    bic r2, r0, #0xe000
    orr r0, r1, ip, lsr #0xd
    orr r0, r2, r0, lsl #0xd
    str r0, [r3]
    b .L_104
.L_6c:
    mov r3, #0x4000000
    ldr r0, [r3]
    ldr r2, [r3]
    and ip, r0, #0xe000
    mvn r0, r1
    bic r1, r2, #0xe000
    and r0, r0, ip, lsr #0xd
    orr r0, r1, r0, lsl #0xd
    str r0, [r3]
    b .L_104
.L_94:
    mov ip, #0x1
    b .L_a0
.L_9c:
    mov ip, #0x2
.L_a0:
    ldrh r0, [r0, #0xea]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_e0
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_e0
    ldr r2, _LIT0
    ldr r1, [r2]
    ldr r0, [r2]
    and r3, r1, #0xe000
    bic r1, r0, #0xe000
    orr r0, ip, r3, lsr #0xd
    orr r0, r1, r0, lsl #0xd
    str r0, [r2]
    b .L_104
.L_e0:
    ldr r3, _LIT0
    mvn r0, ip
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0xe000
    bic r1, r1, #0xe000
    and r0, r0, r2, lsr #0xd
    orr r0, r1, r0, lsl #0xd
    str r0, [r3]
.L_104:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x04001000
