; func_0208482c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208482c
        .arm
func_0208482c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x8]
    ands r0, r0, #0x200
    bne .L_178
    ldr r1, [r6]
    add r0, r6, #0x184
    ldrb r1, [r1, #0x1]
    strb r1, [r6, #0xac]
    ldr r1, [r6, #0x8]
    ldrb r4, [r6, #0xac]
    orr r1, r1, #0x4
    str r1, [r6, #0x8]
    str r0, [r6, #0xb8]
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    ldrneb r5, [r6, #0x8e]
    moveq r5, #0x0
    cmp r5, #0x1
    bne .L_84
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x14]
    blx r1
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    ldrneb r5, [r6, #0x8e]
    ldr r0, [r6, #0x8]
    moveq r5, #0x0
    and r0, r0, #0x40
    b .L_88
.L_84:
    mov r0, #0x0
.L_88:
    cmp r0, #0x0
    bne .L_ec
    ldr ip, [r6, #0x4]
    ldr r1, [ip, #0x18]
    cmp r1, #0x0
    beq .L_d8
    mov r0, r4, lsr #0x5
    add r0, ip, r0, lsl #0x2
    and r2, r4, #0x1f
    mov r3, #0x1
    mov r2, r3, lsl r2
    ldr r0, [r0, #0x4c]
    ands r0, r2, r0
    beq .L_d8
    ldr r0, [r6, #0xb8]
    ldr r3, [ip, #0x1c]
    mov r2, r4
    blx r3
    cmp r0, #0x0
    bne .L_ec
.L_d8:
    ldr r1, [r6]
    ldr r0, [r6, #0xb8]
    ldrb r1, [r1, #0x2]
    and r1, r1, #0x1
    str r1, [r0]
.L_ec:
    cmp r5, #0x2
    bne .L_128
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x14]
    blx r1
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    ldrneb r5, [r6, #0x8e]
    ldr r0, [r6, #0x8]
    moveq r5, #0x0
    and r0, r0, #0x40
    b .L_12c
.L_128:
    mov r0, #0x0
.L_12c:
    cmp r0, #0x0
    bne .L_158
    ldr r0, [r6, #0xb8]
    ldr r0, [r0]
    cmp r0, #0x0
    ldrne r0, [r6, #0x8]
    orrne r0, r0, #0x1
    strne r0, [r6, #0x8]
    ldreq r0, [r6, #0x8]
    biceq r0, r0, #0x1
    streq r0, [r6, #0x8]
.L_158:
    cmp r5, #0x3
    bne .L_178
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x14]
    blx r1
.L_178:
    ldr r0, [r6]
    add r0, r0, #0x3
    str r0, [r6]
    ldmia sp!, {r4, r5, r6, pc}
