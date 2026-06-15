; func_02081c84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02081c84
        .arm
func_02081c84:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r5, [r1]
    ldr r2, [r2, #0x2c]
    ldrh r4, [r3, #0x2]
    mov r2, r2, lsl #0x10
    add ip, r0, r5
    mov r5, r2, lsr #0x10
    ands r2, r4, #0x1
    ldrh r4, [r3]
    moveq r3, r5, lsl #0xf
    moveq r5, r3, lsr #0x10
    moveq r2, r4, lsl #0xf
    moveq r4, r2, lsr #0x10
    ldrb r3, [r1, #0x2]
    mov r2, #0x0
    cmp r3, #0x0
    bls .L_1ac
    add r3, r4, r5
    mov r3, r3, lsl #0x10
    add r6, r0, #0x4
    mov r4, r3, lsr #0x10
.L_17c:
    ldrh r5, [r0, #0xa]
    ldrb r3, [ip, r2]
    add r2, r2, #0x1
    ldrh lr, [r6, r5]
    add r5, r6, r5
    mla r3, lr, r3, r5
    ldr r3, [r3, #0x4]
    add r3, r0, r3
    strh r4, [r3, #0x1c]
    ldrb r3, [r1, #0x2]
    cmp r2, r3
    bcc .L_17c
.L_1ac:
    ldrb r0, [r1, #0x3]
    orr r0, r0, #0x1
    strb r0, [r1, #0x3]
    ldmia sp!, {r4, r5, r6, pc}
