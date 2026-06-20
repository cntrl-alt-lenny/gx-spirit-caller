; func_ov002_02264b84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c8368
        .extern data_ov002_022c836c
        .extern data_ov002_022cd744
        .extern data_ov002_022d016c
        .extern func_ov002_021ae4bc
        .extern func_ov002_021b97d4
        .extern func_ov002_021d5b80
        .extern func_ov002_021e30b4
        .extern func_ov002_021fd81c
        .global func_ov002_02264b84
        .arm
func_ov002_02264b84:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r4, _LIT0
    mov sl, r0
    ldr r9, [r4, #0xd28]
    cmp r9, #0x5
    bcs .L_c8
    bcs .L_148
    mov r0, sl, lsl #0x1f
    and r0, r0, #-2147483648
    ldr r6, _LIT1
    orr r8, r0, #0xa500000
    mov r5, #0x0
.L_30:
    ldr r7, [r6, r9, lsl #0x3]
    mov r1, r5
    mov r0, r7, lsl #0x10
    mov r2, r5
    orr r0, r8, r0, lsr #0x10
    bl func_ov002_021fd81c
    cmp r0, #0x0
    beq .L_b0
    ldr r0, _LIT2
    ldr r0, [r0, sl, lsl #0x2]
    cmp r0, #0x0
    bne .L_8c
    ldr r0, _LIT3
    ldr r0, [r0, r9, lsl #0x3]
    cmp r0, #0x0
    beq .L_8c
    mov r0, sl
    mov r1, r7
    bl func_ov002_021b97d4
    mov r1, r0
    mov r0, #0xfa
    bl func_ov002_021ae4bc
    b .L_98
.L_8c:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0xd44]
.L_98:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x5
    str r2, [r1, #0xd28]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b0:
    ldr r0, [r4, #0xd28]
    add r9, r0, #0x1
    str r9, [r4, #0xd28]
    cmp r9, #0x5
    bcc .L_30
    b .L_148
.L_c8:
    ldr r1, [r4, #0xd44]
    sub r3, r9, #0x5
    cmp r1, #0x0
    beq .L_104
    ldr r0, _LIT1
    mov r1, sl, lsl #0x1f
    ldr r0, [r0, r3, lsl #0x3]
    and r2, r1, #-2147483648
    mov r1, #0x0
    orr r3, r2, #0xa500000
    mov r0, r0, lsl #0x10
    mov r2, r1
    orr r0, r3, r0, lsr #0x10
    bl func_ov002_021e30b4
    b .L_128
.L_104:
    ldr r2, _LIT1
    mov r1, #0xb
    ldr r2, [r2, r3, lsl #0x3]
    mov r3, #0x0
    bl func_ov002_021d5b80
    mov r0, r4
    ldr r1, [r0, #0xd28]
    add r1, r1, #0x1
    str r1, [r0, #0xd28]
.L_128:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd28]
    sub r1, r1, #0x5
    str r1, [r0, #0xd28]
    cmp r1, #0x5
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_148:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022c8368
_LIT2: .word data_ov002_022cd744
_LIT3: .word data_ov002_022c836c
