; func_02026590 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219a80c
        .extern func_0200c40c
        .extern func_020215d8
        .extern func_0202160c
        .extern func_020221d0
        .extern func_0202582c
        .global func_02026590
        .arm
func_02026590:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0xac]
    ldr r0, [r5, #0xdc]
    ldr lr, [r5, #0xb4]
    ldr ip, [r5, #0xe4]
    ldr r4, [r5, #0xb0]
    ldr r3, [r5, #0xe0]
    ldr r2, [r5, #0xa4]
    add r0, r1, r0
    str r0, [r2, #0x34]
    add r0, r4, r3
    str r0, [r2, #0x38]
    add r0, lr, ip
    str r0, [r2, #0x3c]
    ldr r0, [r5, #0xb8]
    ldr r2, [r5, #0xbc]
    mov r0, r0, lsl #0x14
    ldr r1, [r5, #0xc0]
    mov r3, r2, lsl #0x14
    mov r2, r1, lsl #0x14
    ldr r1, [r5, #0xa4]
    mov r0, r0, lsr #0x10
    strh r0, [r1, #0x40]
    mov r0, r3, lsr #0x10
    strh r0, [r1, #0x42]
    mov r0, r2, lsr #0x10
    strh r0, [r1, #0x44]
    ldr r1, [r5, #0xc4]
    ldr r0, [r5, #0xa4]
    add r3, r5, #0x100
    str r1, [r0, #0x48]
    ldr r2, [r5, #0xc8]
    ldr r1, [r5, #0xa4]
    mov r0, #0x0
    str r2, [r1, #0x4c]
    ldr r4, [r5, #0xcc]
    ldr r1, [r5, #0xa4]
    mov r2, r0
    str r4, [r1, #0x50]
    ldrh r4, [r3, #0x6a]
    ldr lr, [r5, #0xa4]
    ldr r1, _LIT0
    mov r4, r4, lsl #0x1c
    ldr ip, [lr, #0x7c]
    mov r4, r4, lsr #0x1f
    bic ip, ip, #0x2000000
    mov r4, r4, lsl #0x1f
    orr r4, ip, r4, lsr #0x6
    str r4, [lr, #0x7c]
    ldrsh r4, [r3, #0x62]
    cmp r4, #0x0
    beq .L_114
    cmp r4, #0x1
    beq .L_f0
    cmp r4, #0x2
    ldreqsh r1, [r1, #0x30]
    ldreqsh r0, [r3, #0x64]
    addeq r2, r1, r0
    b .L_114
.L_f0:
    ldrsh ip, [r1, #0x34]
    ldrsh lr, [r1, #0x2c]
    ldrsh r3, [r1, #0x2e]
    add r2, ip, #0x1
    strh r2, [r1, #0x34]
    ldrsh r4, [r1, #0x34]
    add r2, lr, ip
    cmp r4, r3
    strgeh r0, [r1, #0x34]
.L_114:
    ldr r3, [r5, #0xa4]
    mov r1, r2, lsl #0x1a
    ldr r2, [r3, #0x7c]
    add r0, r5, #0x100
    bic r2, r2, #0x7e0
    orr r1, r2, r1, lsr #0x15
    str r1, [r3, #0x7c]
    ldrsh r0, [r0, #0x62]
    ldr r3, [r5, #0xa4]
    cmp r0, #0x0
    moveq r0, #0x1
    ldr r2, [r3, #0x7c]
    movne r0, #0x0
    mov r1, r0, lsl #0x1f
    bic r2, r2, #0x20000000
    orr r1, r2, r1, lsr #0x2
    str r1, [r3, #0x7c]
    add r0, r5, #0x100
    ldrh r0, [r0, #0x6a]
    ldr r1, [r5, #0xd0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    mov r4, r1, asr #0x4
    add r0, r5, #0x100
    ldrh r1, [r0, #0x6a]
    moveq r4, #0x0
    mov r1, r1, lsl #0x17
    movs r1, r1, lsr #0x1f
    beq .L_1c4
    ldrsh r6, [r0, #0x66]
    cmp r6, #0x0
    bge .L_1a8
    mov r0, r5
    bl func_0202582c
    cmp r0, #0x0
    movne r4, #0x0
    b .L_1c4
.L_1a8:
    bl func_020215d8
    mov r2, r6
    mov r1, #0x3
    bl func_0202160c
    bl func_0202582c
    cmp r0, #0x0
    movne r4, #0x0
.L_1c4:
    cmp r4, #0x1f
    ldreq r1, [r5, #0xa4]
    ldreq r0, [r1, #0x60]
    biceq r0, r0, #0x40
    beq .L_1fc
    ldr r2, [r5, #0xa4]
    and r0, r4, #0x1f
    ldr r1, [r2, #0x7c]
    bic r1, r1, #0x1f
    orr r0, r1, r0
    str r0, [r2, #0x7c]
    ldr r1, [r5, #0xa4]
    ldr r0, [r1, #0x60]
    orr r0, r0, #0x40
.L_1fc:
    str r0, [r1, #0x60]
    bl func_020221d0
    add r1, r5, #0x100
    ldr r2, [r5, #0xe8]
    ldrsh r1, [r1, #0x60]
    mov r6, r2, asr #0x4
    mov r4, r0
    cmp r6, r1
    beq .L_238
    ldr r0, [r5, #0xa4]
    mov r2, r6
    mov r1, #0x0
    bl func_0200c40c
    add r0, r5, #0x100
    strh r6, [r0, #0x60]
.L_238:
    str r4, [r5, #0x15c]
    add r0, r5, #0x100
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    ldreq r1, [r5, #0xa4]
    ldreq r0, [r1, #0x60]
    biceq r0, r0, #0x2000
    beq .L_274
    ldr r0, [r5, #0xa4]
    ldr r1, _LIT1
    strh r1, [r0, #0x64]
    ldr r1, [r5, #0xa4]
    ldr r0, [r1, #0x60]
    orr r0, r0, #0x2000
.L_274:
    str r0, [r1, #0x60]
    add r0, r5, #0x100
    ldrh r1, [r0, #0x6a]
    ldr r3, [r5, #0xa4]
    mov r1, r1, lsl #0x19
    ldr r2, [r3, #0x7c]
    mov r1, r1, lsr #0x1f
    bic r2, r2, #0x40000000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x1
    str r1, [r3, #0x7c]
    ldrh r0, [r0, #0x6a]
    mov r1, r0, lsl #0x18
    movs r1, r1, lsr #0x1f
    bne .L_2bc
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_2c4
.L_2bc:
    mov r0, #0x1
    b .L_2c8
.L_2c4:
    mov r0, #0x0
.L_2c8:
    ldr r3, [r5, #0xa4]
    mov r1, r0, lsl #0x1f
    ldr r2, [r3, #0x60]
    add r0, r5, #0x100
    bic r2, r2, #0x100
    orr r1, r2, r1, lsr #0x17
    str r1, [r3, #0x60]
    ldrh r1, [r0, #0x6a]
    ldr r3, [r5, #0xa4]
    mov r1, r1, lsl #0x16
    ldr r2, [r3, #0x60]
    mov r1, r1, lsr #0x1f
    bic r2, r2, #0x10
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x1b
    str r1, [r3, #0x60]
    ldrh r1, [r0, #0x6a]
    ldr r3, [r5, #0xa4]
    mov r1, r1, lsl #0x10
    ldr r2, [r3, #0x60]
    mov r1, r1, lsr #0x1c
    bic r2, r2, #0x1e0000
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0xb
    str r1, [r3, #0x60]
    ldr r2, [r5, #0xa4]
    ldr r1, [r2, #0x60]
    orr r1, r1, #0x80
    str r1, [r2, #0x60]
    ldrh r0, [r0, #0x6a]
    ldr r3, [r5, #0xa4]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    ldr r2, [r3, #0x7c]
    moveq r0, #0x0
    mov r1, r0, lsl #0x1c
    bic r2, r2, #0x1e00000
    orr r1, r2, r1, lsr #0x7
    mov r0, #0x1
    str r1, [r3, #0x7c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219a80c
_LIT1: .word 0x00007fff
