; func_0200f498 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f498
        .arm
func_0200f498:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    cmp r0, #0x0
    ldrne r4, [r0, #0x98]
    cmpne r4, #0x0
    beq .L_3c8
    ldr r5, [r4]
    mov lr, #0x0
    cmp r5, #0x0
    bls .L_3c0
    mov r8, lr
.L_230:
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
    blt .L_270
    ldr r9, [r7]
    mov r4, r3, lsl #0x1f
    bic r9, r9, #0x20
    orr r4, r9, r4, lsr #0x1a
    str r4, [r7]
.L_270:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_3b0
    b .L_29c
    b .L_35c
    b .L_374
    b .L_38c
    b .L_3a0
    b .L_330
    b .L_2a0
    b .L_34c
.L_29c:
    mov r2, #0x0
.L_2a0:
    mov r9, #0x400
    ldr r4, [r7, #0x4]
    rsb r9, r9, #0x0
    and r4, r4, r9
    str r4, [r7, #0x4]
    ldrh sl, [r6, #0x4]
    mov r4, #0x0
    sub sl, sl, #0x1
    cmp sl, #0x0
    ble .L_310
.L_2c8:
    ldr sl, [r6, #0x10]
    add sl, sl, r4, lsl #0x1
    ldrh sl, [sl, #0x2]
    cmp sl, r2
    bgt .L_310
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
    blt .L_2c8
.L_310:
    ldr r9, [r7, #0x4]
    ldr r4, _LIT0
    ldr r6, _LIT1
    and r9, r9, r4
    and r6, r9, r6
    mov r4, r2, lsl #0x16
    orr r4, r6, r4, lsr #0x2
    str r4, [r7, #0x4]
.L_330:
    ldr r4, [r7]
    bic r4, r4, #0x2
    bic r6, r4, #0x4
    bic r4, r6, #0x8
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_3b0
.L_34c:
    ldr r4, [r7]
    bic r4, r4, #0x40
    str r4, [r7]
    b .L_3b0
.L_35c:
    ldr r4, [r7]
    orr r6, r4, #0x2
    bic r4, r6, #0x4
    bic r4, r4, #0x10
    str r4, [r7]
    b .L_3b0
.L_374:
    ldr r4, [r7]
    orr r6, r4, #0x4
    bic r4, r6, #0x2
    bic r4, r4, #0x8
    str r4, [r7]
    b .L_3b0
.L_38c:
    ldr r4, [r7]
    orr r4, r4, #0x8
    bic r4, r4, #0x4
    str r4, [r7]
    b .L_3b0
.L_3a0:
    ldr r4, [r7]
    orr r4, r4, #0x10
    bic r4, r4, #0x2
    str r4, [r7]
.L_3b0:
    add lr, lr, #0x1
    cmp lr, r5
    add r8, r8, #0x8
    bcc .L_230
.L_3c0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xfff003ff
_LIT1: .word 0xc00fffff
