; func_02027738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202838c
        .global func_02027738
        .arm
func_02027738:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0xde]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldr r2, [r0, #0xb4]
    ldr r1, [r0, #0xb8]
    ldrsh r3, [r0, #0xd4]
    mov r2, r2, asr #0x4
    mov r1, r1, asr #0x4
    cmp r3, #0x7
    rsb r2, r2, #0x0
    rsb r1, r1, #0x0
    addls pc, pc, r3, lsl #0x2
    b .L_750
    b .L_654
    b .L_674
    b .L_694
    b .L_6b4
    b .L_6d4
    b .L_6f4
    b .L_714
    b .L_734
.L_654:
    ldr r3, _LIT0
    ldr lr, _LIT1
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
    b .L_750
.L_674:
    ldr r3, _LIT0
    ldr lr, _LIT2
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
    b .L_750
.L_694:
    ldr r3, _LIT0
    ldr lr, _LIT3
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
    b .L_750
.L_6b4:
    ldr r3, _LIT0
    ldr lr, _LIT4
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
    b .L_750
.L_6d4:
    ldr r3, _LIT0
    ldr lr, _LIT5
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
    b .L_750
.L_6f4:
    ldr r3, _LIT0
    ldr lr, _LIT6
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
    b .L_750
.L_714:
    ldr r3, _LIT0
    ldr lr, _LIT7
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
    b .L_750
.L_734:
    ldr r3, _LIT0
    ldr lr, _LIT8
    mov ip, r3, lsl #0x10
    and r2, r2, r3
    and r1, ip, r1, lsl #0x10
    orr r1, r2, r1
    str r1, [lr]
.L_750:
    ldrh r1, [r0, #0xde]
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1f
    ldrne r1, [r0, #0xd0]
    cmpne r1, #0x0
    beq .L_76c
    bl func_0202838c
.L_76c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x000001ff
_LIT1: .word 0x04000010
_LIT2: .word 0x04000014
_LIT3: .word 0x04000018
_LIT4: .word 0x0400001c
_LIT5: .word 0x04001010
_LIT6: .word 0x04001014
_LIT7: .word 0x04001018
_LIT8: .word 0x0400101c
