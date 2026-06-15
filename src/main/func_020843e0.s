; func_020843e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef3c
        .extern data_021a18b8
        .extern data_021a1b20
        .extern func_02084e0c
        .global func_020843e0
        .arm
func_020843e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x20
    mov r8, r0
    mov r6, r3
    strb r6, [r8, #0xad]
    ldr r3, [r8, #0x8]
    add r0, r8, #0xf4
    orr r3, r3, #0x8
    str r3, [r8, #0x8]
    str r0, [r8, #0xb0]
    ldr r0, [r8, #0x1c]
    mov r4, r1
    cmp r0, #0x0
    ldrneb r5, [r8, #0x90]
    mov r7, r2
    moveq r5, #0x0
    cmp r5, #0x1
    bne .L_1ba8
    ldr r1, [r8, #0x8]
    mov r0, r8
    bic r1, r1, #0x40
    str r1, [r8, #0x8]
    ldr r1, [r8, #0x1c]
    blx r1
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    ldrneb r5, [r8, #0x90]
    ldr r0, [r8, #0x8]
    moveq r5, #0x0
    and r0, r0, #0x40
    b .L_1bac
.L_1ba8:
    mov r0, #0x0
.L_1bac:
    cmp r0, #0x0
    bne .L_1e60
    ldr r0, [r8, #0x4]
    ldr r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_1bd8
    ldr r1, [r8, #0x8]
    ands r1, r1, #0x80
    moveq r1, #0x38
    mlaeq r4, r6, r1, r0
    beq .L_1e5c
.L_1bd8:
    cmp r4, #0x20
    beq .L_1be8
    cmp r4, #0x40
    bne .L_1c24
.L_1be8:
    mov r1, r6, lsr #0x5
    add r1, r8, r1, lsl #0x2
    and r2, r6, #0x1f
    mov r3, #0x1
    mov r2, r3, lsl r2
    ldr r1, [r1, #0xbc]
    ands r1, r2, r1
    beq .L_1c24
    cmp r0, #0x0
    movne r1, #0x38
    mlane r4, r6, r1, r0
    ldreq r1, _LIT0
    moveq r0, #0x38
    mlaeq r4, r6, r0, r1
    b .L_1e5c
.L_1c24:
    cmp r0, #0x0
    beq .L_1c5c
    add r4, r8, #0xbc
    mov r3, r6, lsr #0x5
    ldr r2, [r4, r3, lsl #0x2]
    and r0, r6, #0x1f
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    str r0, [r4, r3, lsl #0x2]
    ldr r1, [r8, #0x4]
    mov r0, #0x38
    ldr r1, [r1, #0x38]
    mla r4, r6, r0, r1
    b .L_1c90
.L_1c5c:
    cmp r4, #0x40
    addne r4, r8, #0xf4
    bne .L_1c90
    add lr, r8, #0xbc
    mov ip, r6, lsr #0x5
    ldr r1, _LIT0
    ldr r4, [lr, ip, lsl #0x2]
    mov r0, #0x38
    and r2, r6, #0x1f
    mov r3, #0x1
    orr r2, r4, r3, lsl r2
    mla r4, r6, r0, r1
    str r2, [lr, ip, lsl #0x2]
.L_1c90:
    mov r0, #0x0
    str r0, [r4]
    ldr r3, [r8, #0xd8]
    ldrh r0, [r3, #0xa]
    add r2, r3, #0x4
    ldrh r1, [r2, r0]
    add r0, r2, r0
    mla r0, r1, r6, r0
    ldr r0, [r0, #0x4]
    ldr r1, _LIT1
    add r0, r3, r0
    ldrh r0, [r0, #0x1e]
    ands r0, r0, #0x20
    ldrne r0, [r4]
    orrne r0, r0, #0x20
    strne r0, [r4]
    ldrh r2, [r7, #0x1e]
    ldr r0, _LIT2
    ldr ip, [r1, #0x94]
    mov r2, r2, asr #0x6
    and r2, r2, #0x7
    ldr lr, [r0, r2, lsl #0x2]
    ldr r2, [r7, #0x4]
    mvn r3, lr
    and r3, ip, r3
    and r2, r2, lr
    orr r2, r3, r2
    str r2, [r4, #0x4]
    ldrh ip, [r7, #0x1e]
    ldr r3, [r1, #0x98]
    ldr r2, [r7, #0x8]
    mov ip, ip, asr #0x9
    and ip, ip, #0x7
    ldr ip, [r0, ip, lsl #0x2]
    mvn r0, ip
    and r3, r3, r0
    and r0, r2, ip
    orr r0, r3, r0
    str r0, [r4, #0x8]
    ldr r3, [r7, #0x10]
    ldr r0, [r7, #0xc]
    ldr r2, [r1, #0x9c]
    mvn r1, r3
    and r1, r2, r1
    and r0, r0, r3
    orr r0, r1, r0
    str r0, [r4, #0xc]
    ldr r0, [r7, #0x14]
    str r0, [r4, #0x10]
    ldrh r0, [r7, #0x1c]
    str r0, [r4, #0x14]
    ldrh r1, [r7, #0x1e]
    ands r0, r1, #0x1
    beq .L_1df0
    ands r1, r1, #0x2
    ldrne r1, [r4]
    add r0, r7, #0x2c
    orrne r1, r1, #0x1
    strne r1, [r4]
    bne .L_1d94
    ldr r1, [r0]
    str r1, [r4, #0x18]
    ldr r1, [r0, #0x4]
    add r0, r0, #0x8
    str r1, [r4, #0x1c]
.L_1d94:
    ldrh r1, [r7, #0x1e]
    ands r1, r1, #0x4
    ldrne r1, [r4]
    orrne r1, r1, #0x2
    strne r1, [r4]
    bne .L_1dc0
    ldrsh r1, [r0]
    strh r1, [r4, #0x20]
    ldrsh r1, [r0, #0x2]
    add r0, r0, #0x4
    strh r1, [r4, #0x22]
.L_1dc0:
    ldrh r1, [r7, #0x1e]
    ands r1, r1, #0x8
    ldreq r1, [r0]
    streq r1, [r4, #0x24]
    ldreq r0, [r0, #0x4]
    streq r0, [r4, #0x28]
    ldrne r0, [r4]
    orrne r0, r0, #0x4
    strne r0, [r4]
    ldr r0, [r4]
    orr r0, r0, #0x8
    str r0, [r4]
.L_1df0:
    ldr r0, [r8, #0x4]
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_1e30
    mov r2, r6, lsr #0x5
    add r2, r0, r2, lsl #0x2
    and r3, r6, #0x1f
    mov ip, #0x1
    mov r3, ip, lsl r3
    ldr r2, [r2, #0x3c]
    ands r2, r3, r2
    beq .L_1e30
    ldr r3, [r0, #0xc]
    mov r0, r4
    mov r2, r6
    blx r3
.L_1e30:
    ldr r0, [r4]
    ands r0, r0, #0x18
    beq .L_1e5c
    ldrh r0, [r7, #0x20]
    strh r0, [r4, #0x2c]
    ldrh r0, [r7, #0x22]
    strh r0, [r4, #0x2e]
    ldr r0, [r7, #0x24]
    str r0, [r4, #0x30]
    ldr r0, [r7, #0x28]
    str r0, [r4, #0x34]
.L_1e5c:
    str r4, [r8, #0xb0]
.L_1e60:
    cmp r5, #0x2
    bne .L_1e9c
    ldr r1, [r8, #0x8]
    mov r0, r8
    bic r1, r1, #0x40
    str r1, [r8, #0x8]
    ldr r1, [r8, #0x1c]
    blx r1
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    ldrneb r5, [r8, #0x90]
    ldr r0, [r8, #0x8]
    moveq r5, #0x0
    and r0, r0, #0x40
    b .L_1ea0
.L_1e9c:
    mov r0, #0x0
.L_1ea0:
    cmp r0, #0x0
    bne .L_1f4c
    ldr r4, [r8, #0xb0]
    ldr r1, [r4, #0xc]
    ands r0, r1, #0x1f0000
    beq .L_1f40
    ldr r0, [r4]
    ands r0, r0, #0x20
    bicne r0, r1, #0x1f0000
    strne r0, [r4, #0xc]
    ldr r0, [r8, #0x8]
    bic r0, r0, #0x2
    str r0, [r8, #0x8]
    ldr r0, [r8, #0x8]
    ands r0, r0, #0x100
    bne .L_1f4c
    ldr r0, _LIT3
    ldr r3, _LIT4
    str r0, [sp]
    ldr r2, [r4, #0x4]
    add r1, sp, #0x4
    str r2, [sp, #0x4]
    ldr r6, [r4, #0x8]
    mov r2, #0x6
    str r6, [sp, #0x8]
    ldr r6, [r4, #0xc]
    str r6, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r3, [r4, #0x10]
    str r3, [sp, #0x14]
    ldr r3, [r4, #0x14]
    str r3, [sp, #0x18]
    bl func_02084e0c
    ldr r0, [r4]
    ands r0, r0, #0x18
    beq .L_1f4c
    ldr r1, [r8, #0xf0]
    mov r0, r4
    blx r1
    b .L_1f4c
.L_1f40:
    ldr r0, [r8, #0x8]
    orr r0, r0, #0x2
    str r0, [r8, #0x8]
.L_1f4c:
    cmp r5, #0x3
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [r8, #0x8]
    mov r0, r8
    bic r1, r1, #0x40
    str r1, [r8, #0x8]
    ldr r1, [r8, #0x1c]
    blx r1
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021a1b20
_LIT1: .word data_021a18b8
_LIT2: .word data_020bef3c
_LIT3: .word 0x00293130
_LIT4: .word 0x00002b2a
