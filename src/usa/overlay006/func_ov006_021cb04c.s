; func_ov006_021cb04c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201d6bc
        .extern func_02094688
        .global func_ov006_021cb04c
        .arm
func_ov006_021cb04c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r5, [sp, #0x30]
    mov sl, r0
    mov r0, r5, asr #0x2
    add r0, r5, r0, lsr #0x1d
    ldr r4, [sl, #0x14]
    mov r0, r0, asr #0x3
    mul r0, r4, r0
    mov r6, r3, asr #0x2
    mov r4, r5, lsr #0x1f
    add r9, r3, r6, lsr #0x1d
    mov r7, r3, lsr #0x1f
    rsb r6, r7, r3, lsl #0x1d
    rsb r8, r4, r5, lsl #0x1d
    add r9, r0, r9, asr #0x3
    ldr r0, [sl, r1, lsl #0x2]
    add r1, r4, r8, ror #0x1d
    ldr r3, [sl, #0x48]
    add r7, r7, r6, ror #0x1d
    mov r5, r2
    str r1, [sp]
    add r6, r3, r9, lsl #0x5
    bl func_0201d6bc
    add r0, r0, r5, lsl #0x5
    str r0, [sp, #0x4]
    mov fp, #0x0
.L_6c:
    ldr r0, [sp]
    mov r8, #0x0
    add r9, r0, fp
    mov r1, r9, lsr #0x1f
    rsb r0, r1, r9, lsl #0x1d
    add r5, r1, r0, ror #0x1d
    ldr r0, [sp, #0x4]
    add r4, r0, fp, lsl #0x2
.L_8c:
    cmp r9, #0x8
    ldrge r0, [sl, #0x14]
    add lr, r7, r8
    movge r0, r0, lsl #0x5
    movlt r0, #0x0
    cmp lr, #0x8
    movge r1, #0x20
    movlt r1, #0x0
    add r0, r6, r0
    add r0, r0, r1
    mov r1, lr, lsr #0x1f
    add ip, r0, r5, lsl #0x2
    rsb r0, r1, lr, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    add r0, r0, r0, lsr #0x1f
    ldrb r2, [ip, r0, asr #0x1]
    mov r1, r8, lsr #0x1f
    mov r3, r0, asr #0x1
    rsb r0, r1, r8, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    strb r2, [sp, #0x8]
    add r0, r8, r8, lsr #0x1f
    ldreqb r0, [r4, r0, asr #0x1]
    andeq r1, r0, #0xf
    beq .L_100
    ldrb r0, [r4, r0, asr #0x1]
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r1, r0, #0xff
.L_100:
    cmp r1, #0x0
    beq .L_15c
    cmp r1, #0xf
    ldreq r0, [sl, #0x4c]
    andeq r1, r0, #0xff
    mov r0, lr, lsr #0x1f
    rsb r2, r0, lr, lsl #0x1f
    adds r0, r0, r2, ror #0x1f
    bne .L_13c
    ldrb r0, [sp, #0x8]
    and r0, r0, #0xf0
    and r0, r0, #0xff
    orr r0, r0, r1
    strb r0, [sp, #0x8]
    b .L_14c
.L_13c:
    ldrb r0, [sp, #0x8]
    and r0, r0, #0xf
    orr r0, r0, r1, lsl #0x4
    strb r0, [sp, #0x8]
.L_14c:
    add r1, ip, r3
    add r0, sp, #0x8
    mov r2, #0x1
    bl func_02094688
.L_15c:
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_8c
    add fp, fp, #0x1
    cmp fp, #0x8
    blt .L_6c
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
