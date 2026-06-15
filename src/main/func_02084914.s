; func_02084914 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02084914
        .arm
func_02084914:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x8]
    ands r0, r0, #0x200
    bne .L_21d8
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
    bne .L_20e4
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
    b .L_20e8
.L_20e4:
    mov r0, #0x0
.L_20e8:
    cmp r0, #0x0
    bne .L_214c
    ldr ip, [r6, #0x4]
    ldr r1, [ip, #0x18]
    cmp r1, #0x0
    beq .L_2138
    mov r0, r4, lsr #0x5
    add r0, ip, r0, lsl #0x2
    and r2, r4, #0x1f
    mov r3, #0x1
    mov r2, r3, lsl r2
    ldr r0, [r0, #0x4c]
    ands r0, r2, r0
    beq .L_2138
    ldr r0, [r6, #0xb8]
    ldr r3, [ip, #0x1c]
    mov r2, r4
    blx r3
    cmp r0, #0x0
    bne .L_214c
.L_2138:
    ldr r1, [r6]
    ldr r0, [r6, #0xb8]
    ldrb r1, [r1, #0x2]
    and r1, r1, #0x1
    str r1, [r0]
.L_214c:
    cmp r5, #0x2
    bne .L_2188
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
    b .L_218c
.L_2188:
    mov r0, #0x0
.L_218c:
    cmp r0, #0x0
    bne .L_21b8
    ldr r0, [r6, #0xb8]
    ldr r0, [r0]
    cmp r0, #0x0
    ldrne r0, [r6, #0x8]
    orrne r0, r0, #0x1
    strne r0, [r6, #0x8]
    ldreq r0, [r6, #0x8]
    biceq r0, r0, #0x1
    streq r0, [r6, #0x8]
.L_21b8:
    cmp r5, #0x3
    bne .L_21d8
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x14]
    blx r1
.L_21d8:
    ldr r0, [r6]
    add r0, r0, #0x3
    str r0, [r6]
    ldmia sp!, {r4, r5, r6, pc}
