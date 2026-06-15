; func_0200f4b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f4b4
        .arm
func_0200f4b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    cmp r0, #0x0
    ldrne r4, [r0, #0x98]
    cmpne r4, #0x0
    beq .L_8bc
    ldr r5, [r4]
    mov lr, #0x0
    cmp r5, #0x0
    bls .L_8b4
    mov r8, lr
.L_724:
    ldr r7, [r0, #0xa0]
    ldr r6, [r0, #0x98]
    ldr r4, [r7, r8]
    ldr r6, [r6, #0x4]
    bic r4, r4, #0x1
    ldr r6, [r6, lr, lsl #0x2]
    orr r4, r4, #0x1
    str r4, [r7, r8]
    cmp r3, #0x0
    add r7, r7, r8
    blt .L_764
    ldr r9, [r7]
    mov r4, r3, lsl #0x1f
    bic r9, r9, #0x20
    orr r4, r9, r4, lsr #0x1a
    str r4, [r7]
.L_764:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_8a4
    b .L_790
    b .L_850
    b .L_868
    b .L_880
    b .L_894
    b .L_824
    b .L_794
    b .L_840
.L_790:
    mov r2, #0x0
.L_794:
    mov r9, #0x400
    ldr r4, [r7, #0x4]
    rsb r9, r9, #0x0
    and r4, r4, r9
    str r4, [r7, #0x4]
    ldrh sl, [r6, #0x4]
    mov r4, #0x0
    sub sl, sl, #0x1
    cmp sl, #0x0
    ble .L_804
.L_7bc:
    ldr sl, [r6, #0x10]
    add sl, sl, r4, lsl #0x1
    ldrh sl, [sl, #0x2]
    cmp sl, r2
    bgt .L_804
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
    blt .L_7bc
.L_804:
    ldr r9, [r7, #0x4]
    ldr r4, _LIT0
    ldr r6, _LIT1
    and r9, r9, r4
    and r6, r9, r6
    mov r4, r2, lsl #0x16
    orr r4, r6, r4, lsr #0x2
    str r4, [r7, #0x4]
.L_824:
    ldr r4, [r7]
    bic r4, r4, #0x2
    bic r6, r4, #0x4
    bic r4, r6, #0x8
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_8a4
.L_840:
    ldr r4, [r7]
    bic r4, r4, #0x40
    str r4, [r7]
    b .L_8a4
.L_850:
    ldr r4, [r7]
    orr r6, r4, #0x2
    bic r4, r6, #0x4
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_8a4
.L_868:
    ldr r4, [r7]
    orr r6, r4, #0x4
    bic r4, r6, #0x2
    bic r4, r4, #0x8
    str r4, [r7]
    b .L_8a4
.L_880:
    ldr r4, [r7]
    orr r4, r4, #0x8
    bic r4, r4, #0x4
    str r4, [r7]
    b .L_8a4
.L_894:
    ldr r4, [r7]
    orr r4, r4, #0x10
    bic r4, r4, #0x2
    str r4, [r7]
.L_8a4:
    add lr, lr, #0x1
    cmp lr, r5
    add r8, r8, #0x8
    bcc .L_724
.L_8b4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8bc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xfff003ff
_LIT1: .word 0xc00fffff
