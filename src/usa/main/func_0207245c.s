; func_0207245c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207245c
        .arm
func_0207245c:
    stmdb sp!, {r4, r5, r6, lr}
    ldrb r4, [r2, #0x8]
    mov ip, #0x0
    mov r3, ip
    mov r6, ip
    mov r5, ip
    cmp r4, #0xa
    beq .L_28
    cmp r4, #0xb
    movne r5, #0x1
.L_28:
    cmp r5, #0x0
    beq .L_4c
    ldrh lr, [r1, #0x2]
    ldrh r5, [r2, #0xa]
    mov r4, lr, asr #0x8
    orr r4, r4, lr, lsl #0x8
    mov lr, r4, lsl #0x10
    cmp r5, lr, lsr #0x10
    moveq r6, #0x1
.L_4c:
    cmp r6, #0x0
    beq .L_70
    ldrh r4, [r1]
    ldrh lr, [r2, #0x18]
    mov r1, r4, asr #0x8
    orr r1, r1, r4, lsl #0x8
    mov r1, r1, lsl #0x10
    cmp lr, r1, lsr #0x10
    moveq r3, #0x1
.L_70:
    cmp r3, #0x0
    beq .L_b0
    ldrh r1, [r0, #0xc]
    ldrh lr, [r0, #0xe]
    ldr r3, [r2, #0x1c]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, lr, asr #0x8
    mov r2, r0, lsr #0x10
    orr r0, r1, lr, lsl #0x8
    mov r1, r2, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    cmp r3, r0
    moveq ip, #0x1
.L_b0:
    mov r0, ip
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
