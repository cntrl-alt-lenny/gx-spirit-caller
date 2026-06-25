; func_02009478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02020fb4
        .extern data_02104e5c
        .extern func_02007214
        .extern func_02007224
        .extern func_02090780
        .extern func_020907d8
        .extern func_0209bee0
        .extern func_0209bef0
        .extern func_0209bfd8
        .extern func_0209c6e8
        .global func_02009478
        .arm
func_02009478:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r5, r0
    bl func_0209bfd8
    cmp r0, #0x0
    beq .L_310
    bl func_02090780
    mov r4, r0
    mvn r0, #0x2
    cmp r4, r0
    beq .L_310
    ldr r2, _LIT0
    ldr r1, _LIT1
    mov r0, r5
    str r2, [sp, #0x18]
    bl func_02007224
    mov r1, r4, lsl #0x10
    str r0, [sp, #0x1c]
    mov r0, r1, lsr #0x10
    bl func_0209bef0
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    add r1, sp, #0x14
    mov r3, r0
    mov r2, #0x4
    str r0, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT2
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_2f8
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r1, #0xa
    str r1, [sp, #0xc]
    mov ip, #0x2
    add r0, sp, #0x18
    mov r1, #0x8000
    mov r2, #0x8
    str ip, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT2
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_2f8
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov ip, #0xa
    mov r0, r5
    ldr r1, _LIT3
    ldr r2, _LIT1
    str ip, [sp, #0xc]
    mov r5, #0x2
    str r5, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT2
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orr r1, r1, r2
    str r1, [r0, #0x4]
.L_2f8:
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bee0
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020907d8
.L_310:
    bl func_02007214
    cmp r0, #0x0
    beq .L_320
    bl .L_02020fb4
.L_320:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x59474652
_LIT1: .word 0x000013b0
_LIT2: .word data_02104e5c
_LIT3: .word 0x00008008
