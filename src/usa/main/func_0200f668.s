; func_0200f668 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f668
        .arm
func_0200f668:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    cmp r0, #0x0
    ldrne r4, [r0, #0xa4]
    cmpne r4, #0x0
    beq .L_598
    ldr r5, [r4]
    mov lr, #0x0
    cmp r5, #0x0
    bls .L_590
    mov r8, lr
.L_400:
    ldr r7, [r0, #0xa8]
    ldr r6, [r0, #0xa4]
    ldr r4, [r7, r8]
    ldr r6, [r6, #0x4]
    bic r4, r4, #0x1
    ldr r6, [r6, lr, lsl #0x2]
    orr r4, r4, #0x1
    str r4, [r7, r8]
    cmp r3, #0x0
    add r7, r7, r8
    blt .L_440
    ldr r9, [r7]
    mov r4, r3, lsl #0x1f
    bic r9, r9, #0x20
    orr r4, r9, r4, lsr #0x1a
    str r4, [r7]
.L_440:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_580
    b .L_46c
    b .L_52c
    b .L_544
    b .L_55c
    b .L_570
    b .L_500
    b .L_470
    b .L_51c
.L_46c:
    mov r2, #0x0
.L_470:
    mov r9, #0x400
    ldr r4, [r7, #0x4]
    rsb r9, r9, #0x0
    and r4, r4, r9
    str r4, [r7, #0x4]
    ldrh sl, [r6, #0x4]
    mov r4, #0x0
    sub sl, sl, #0x1
    cmp sl, #0x0
    ble .L_4e0
.L_498:
    ldr sl, [r6, #0xc]
    add sl, sl, r4, lsl #0x1
    ldrh sl, [sl, #0x2]
    cmp sl, r2
    bgt .L_4e0
    ldr ip, [r7, #0x4]
    add r4, r4, #0x1
    mov sl, ip, lsl #0x16
    and ip, ip, r9
    mov sl, sl, asr #0x16
    add sl, sl, #0x1
    and sl, sl, r9, lsr #0x16
    orr sl, ip, sl
    str sl, [r7, #0x4]
    ldrh ip, [r6, #0x4]
    sub ip, ip, #0x1
    cmp r4, ip
    blt .L_498
.L_4e0:
    ldr r9, [r7, #0x4]
    ldr r4, _LIT0
    ldr r6, _LIT1
    and r9, r9, r4
    and r6, r9, r6
    mov r4, r2, lsl #0x16
    orr r4, r6, r4, lsr #0x2
    str r4, [r7, #0x4]
.L_500:
    ldr r4, [r7]
    bic r4, r4, #0x2
    bic r6, r4, #0x4
    bic r4, r6, #0x8
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_580
.L_51c:
    ldr r4, [r7]
    bic r4, r4, #0x40
    str r4, [r7]
    b .L_580
.L_52c:
    ldr r4, [r7]
    orr r6, r4, #0x2
    bic r4, r6, #0x4
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_580
.L_544:
    ldr r4, [r7]
    orr r6, r4, #0x4
    bic r4, r6, #0x2
    bic r4, r4, #0x8
    str r4, [r7]
    b .L_580
.L_55c:
    ldr r4, [r7]
    orr r4, r4, #0x8
    bic r4, r4, #0x4
    str r4, [r7]
    b .L_580
.L_570:
    ldr r4, [r7]
    orr r4, r4, #0x10
    bic r4, r4, #0x2
    str r4, [r7]
.L_580:
    add lr, lr, #0x1
    cmp lr, r5
    add r8, r8, #0x8
    bcc .L_400
.L_590:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_598:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xfff003ff
_LIT1: .word 0xc00fffff
