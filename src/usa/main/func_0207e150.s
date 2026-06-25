; func_0207e150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0804
        .global func_0207e150
        .arm
func_0207e150:
    stmdb sp!, {r4, lr}
    cmp r0, #0x0
    moveq r0, #0x8
    addne r0, r0, #0x7
    ldr ip, _LIT0
    bicne r0, r0, #0x7
    cmp r0, ip
    mov r3, #0x0
    movcs r0, #0x0
    ldmcsia sp!, {r4, pc}
    cmp r2, #0x1
    bne .L_a8
    ldr r2, _LIT1
    cmp r1, #0x0
    ldr ip, [r2]
    andne r2, ip, #0x7
    rsbne r2, r2, #0x8
    andne r4, r2, #0x7
    andeq r2, ip, #0xf
    rsbeq r2, r2, #0x10
    andeq r4, r2, #0xf
    ldr r2, _LIT1
    add lr, r0, r4
    ldr r2, [r2, #0x4]
    sub r2, r2, ip
    cmp r2, lr
    bcc .L_a0
    cmp r1, #0x0
    add r1, ip, lr
    beq .L_84
    cmp r1, #0x10000
    movhi ip, #0x0
    bhi .L_110
.L_84:
    ldr r1, _LIT1
    add r3, ip, r4
    ldr r2, [r1]
    mov ip, #0x1
    add r2, r2, lr
    str r2, [r1]
    b .L_110
.L_a0:
    mov ip, #0x0
    b .L_110
.L_a8:
    ldr r2, _LIT1
    ldr ip, [r2, #0x4]
    cmp ip, r0
    bcc .L_10c
    sub r2, ip, r0
    cmp r1, #0x0
    andne r4, r2, #0x7
    andeq r4, r2, #0xf
    ldr r2, _LIT1
    add lr, r0, r4
    ldr r2, [r2]
    sub r2, ip, r2
    cmp r2, lr
    bcc .L_10c
    cmp r1, #0x0
    beq .L_f4
    cmp ip, #0x10000
    movhi ip, #0x0
    bhi .L_110
.L_f4:
    ldr r1, _LIT1
    mov ip, #0x1
    ldr r2, [r1, #0x4]
    sub r3, r2, lr
    str r3, [r1, #0x4]
    b .L_110
.L_10c:
    mov ip, #0x0
.L_110:
    cmp ip, #0x0
    ldrne r1, _LIT2
    movne r2, r0, lsr #0x3
    andne r0, r1, r3, lsr #0x3
    orrne r0, r0, r2, lsl #0x10
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0007fff8
_LIT1: .word data_021a0804
_LIT2: .word 0x0000ffff
