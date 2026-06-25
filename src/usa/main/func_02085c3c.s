; func_02085c3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a1a3c
        .extern data_021a284c
        .extern data_021a2850
        .extern data_021a2854
        .global func_02085c3c
        .arm
func_02085c3c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov ip, r0
    ands r0, r3, #0x4
    ldrb r3, [r2, #0x3]
    beq .L_54
    ldr r1, [ip]
    ands r0, r3, #0x2
    orr r0, r1, #0x1
    str r0, [ip]
    beq .L_cc
    ldr r0, _LIT0
    ldrb r7, [r2, #0x1]
    ldr r0, [r0]
    mov r1, #0x1
    add r6, r0, #0xc4
    mov r5, r7, lsr #0x5
    ldr r4, [r6, r5, lsl #0x2]
    and r0, r7, #0x1f
    orr r0, r4, r1, lsl r0
    str r0, [r6, r5, lsl #0x2]
    b .L_cc
.L_54:
    ldr r4, [r1]
    ands r0, r3, #0x2
    str r4, [ip, #0x4]
    ldr r0, [r1, #0x4]
    str r0, [ip, #0x8]
    ldr r0, [r1, #0x8]
    str r0, [ip, #0xc]
    beq .L_cc
    ldr lr, _LIT0
    ldrb r0, [r2, #0x1]
    ldr r4, [lr]
    mov lr, #0x18
    add r8, r4, #0xc4
    mov r7, r0, lsr #0x5
    and r4, r0, #0x1f
    mov r5, #0x1
    mvn r4, r5, lsl r4
    ldr r6, [r8, r7, lsl #0x2]
    mul r5, r0, lr
    and r0, r6, r4
    str r0, [r8, r7, lsl #0x2]
    ldr r4, [r1, #0xc]
    ldr r0, _LIT1
    ldr lr, _LIT2
    str r4, [r0, r5]
    ldr r4, [r1, #0x10]
    ldr r0, _LIT3
    str r4, [lr, r5]
    ldr r1, [r1, #0x14]
    str r1, [r0, r5]
.L_cc:
    ands r0, r3, #0x1
    beq .L_130
    ldrb r0, [r2, #0x2]
    ldr r2, [ip]
    ldr r1, _LIT0
    orr r2, r2, #0x20
    str r2, [ip]
    ldr r2, [r1]
    mov r1, r0, lsr #0x5
    add r1, r2, r1, lsl #0x2
    and r2, r0, #0x1f
    mov r3, #0x1
    mov r2, r3, lsl r2
    ldr r1, [r1, #0xc4]
    ands r1, r2, r1
    ldrne r0, [ip]
    orrne r0, r0, #0x8
    strne r0, [ip]
    bne .L_130
    ldr r2, _LIT1
    mov r1, #0x18
    mla r1, r0, r1, r2
    add r3, ip, #0x10
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
.L_130:
    ldr r0, [ip]
    orr r0, r0, #0x10
    str r0, [ip]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021a1a3c
_LIT1: .word data_021a284c
_LIT2: .word data_021a2850
_LIT3: .word data_021a2854
