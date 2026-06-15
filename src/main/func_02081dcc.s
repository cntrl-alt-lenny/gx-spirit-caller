; func_02081dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208bfa8
        .global func_02081dcc
        .arm
func_02081dcc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov fp, r1
    mov r9, r3
    ldr r1, [r9]
    mov sl, r0
    and r0, r1, #0x1c000000
    cmp r0, #0x14000000
    ldrh r3, [fp]
    ldrne r1, [r2, #0x8]
    mov r8, #0x0
    add r0, sl, r3
    str r0, [sp, #0x4]
    ldrne r0, _LIT0
    andne r0, r1, r0
    strne r0, [sp]
    ldreq r1, [r2, #0x18]
    ldreq r0, _LIT0
    andeq r0, r1, r0
    streq r0, [sp]
    ldrb r0, [fp, #0x2]
    cmp r0, #0x0
    bls .L_36c
    mov r4, #0x1000
    add r5, sl, #0x4
.L_2d4:
    ldrh r6, [sl, #0xa]
    ldr r0, [sp, #0x4]
    ldr r1, [r9]
    ldrb r2, [r0, r8]
    ldrh r3, [r5, r6]
    ldr r0, [sp]
    add r6, r5, r6
    add r0, r1, r0
    mla r1, r3, r2, r6
    ldr r1, [r1, #0x4]
    add r6, sl, r1
    ldr r1, [r6, #0x14]
    orr r0, r1, r0
    str r0, [r6, #0x14]
    ldr r3, [r9, #0x4]
    ldr r0, _LIT1
    ldrh r1, [r6, #0x20]
    and r2, r3, r0
    and r7, r0, r3, lsr #0xb
    cmp r2, r1
    moveq r0, r4
    beq .L_338
    mov r0, r2, lsl #0xc
    mov r1, r1, lsl #0xc
    bl func_0208bfa8
.L_338:
    str r0, [r6, #0x24]
    ldrh r1, [r6, #0x22]
    cmp r7, r1
    moveq r0, r4
    beq .L_358
    mov r0, r7, lsl #0xc
    mov r1, r1, lsl #0xc
    bl func_0208bfa8
.L_358:
    str r0, [r6, #0x28]
    ldrb r0, [fp, #0x2]
    add r8, r8, #0x1
    cmp r8, r0
    bcc .L_2d4
.L_36c:
    ldrb r0, [fp, #0x3]
    orr r0, r0, #0x1
    strb r0, [fp, #0x3]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x000007ff
