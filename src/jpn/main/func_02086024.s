; func_02086024 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_021a1a3c
        .extern data_021a2840
        .extern data_021a2844
        .extern data_021a2848
        .extern data_021a284c
        .extern data_021a2850
        .extern data_021a2854
        .global func_02086024
        .arm
func_02086024:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ands r0, r3, #0x4
    ldrb r4, [r2, #0x1]
    ldrb r0, [r2, #0x2]
    beq .L_a0
    ldr r2, [r5]
    ldr r1, _LIT0
    orr r2, r2, #0x1
    str r2, [r5]
    ldr r3, [r1]
    mov r1, r0, lsr #0x5
    add r1, r3, r1, lsl #0x2
    and r2, r0, #0x1f
    mov r6, #0x1
    mov r2, r6, lsl r2
    ldr r1, [r1, #0xc4]
    ands r1, r2, r1
    beq .L_74
    add r3, r3, #0xc4
    mov r2, r4, lsr #0x5
    ldr r1, [r3, r2, lsl #0x2]
    and r0, r4, #0x1f
    orr r0, r1, r6, lsl r0
    str r0, [r3, r2, lsl #0x2]
    ldr r0, [r5]
    orr r0, r0, #0x18
    str r0, [r5]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_74:
    ldr r1, _LIT1
    mov r2, #0x18
    mla r6, r0, r2, r1
    mla r1, r4, r2, r1
    mov r0, r6
    bl Copy32
    mov r0, r6
    add r1, r5, #0x10
    mov r2, #0x18
    bl Copy32
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a0:
    ldr r3, [r1]
    ldr r2, _LIT0
    str r3, [r5, #0x4]
    ldr r3, [r1, #0x4]
    mov r7, r0, lsr #0x5
    str r3, [r5, #0x8]
    ldr r3, [r1, #0x8]
    and r8, r0, #0x1f
    str r3, [r5, #0xc]
    ldr r6, [r2]
    mov r3, #0x1
    add r2, r6, r7, lsl #0x2
    mov r7, r3, lsl r8
    ldr r2, [r2, #0xc4]
    ands r2, r7, r2
    beq .L_12c
    ldr r3, _LIT1
    mov r2, #0x18
    mov r0, r1
    mla r1, r4, r2, r3
    bl Copy32
    ldr r0, _LIT0
    mov r2, r4, lsr #0x5
    ldr r1, [r0]
    and r0, r4, #0x1f
    add r3, r1, #0xc4
    mov r1, #0x1
    mvn r0, r1, lsl r0
    ldr r1, [r3, r2, lsl #0x2]
    and r0, r1, r0
    str r0, [r3, r2, lsl #0x2]
    ldr r0, [r5]
    orr r0, r0, #0x18
    str r0, [r5]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_12c:
    mov r2, #0x18
    mul ip, r0, r2
    and r7, r4, #0x1f
    ldr r0, _LIT1
    add r6, r6, #0xc4
    mov lr, r4, lsr #0x5
    mvn r7, r3, lsl r7
    ldr r8, [r6, lr, lsl #0x2]
    mul r3, r4, r2
    and r4, r8, r7
    str r4, [r6, lr, lsl #0x2]
    ldr r7, [r1]
    ldr r4, [r0, ip]
    ldr r6, _LIT2
    smull r8, r4, r7, r4
    mov r7, r8, lsr #0xc
    orr r7, r7, r4, lsl #0x14
    str r7, [r0, r3]
    ldr r8, [r1, #0x4]
    ldr r4, [r6, ip]
    ldr r7, _LIT3
    smull lr, r4, r8, r4
    mov r8, lr, lsr #0xc
    orr r8, r8, r4, lsl #0x14
    str r8, [r6, r3]
    ldr r8, [r1, #0x8]
    ldr r4, [r7, ip]
    ldr r6, _LIT4
    smull lr, r4, r8, r4
    mov r8, lr, lsr #0xc
    orr r8, r8, r4, lsl #0x14
    str r8, [r7, r3]
    ldr r7, [r1, #0xc]
    ldr r4, [r6, ip]
    ldr lr, _LIT5
    smull r8, r4, r7, r4
    mov r7, r8, lsr #0xc
    orr r7, r7, r4, lsl #0x14
    str r7, [r6, r3]
    ldr r7, [r1, #0x10]
    ldr r4, [lr, ip]
    ldr r6, _LIT6
    smull r8, r4, r7, r4
    add r0, r0, ip
    mov r7, r8, lsr #0xc
    orr r7, r7, r4, lsl #0x14
    str r7, [lr, r3]
    ldr lr, [r1, #0x14]
    ldr r4, [r6, ip]
    add r1, r5, #0x10
    smull r5, r4, lr, r4
    mov r5, r5, lsr #0xc
    orr r5, r5, r4, lsl #0x14
    str r5, [r6, r3]
    bl Copy32
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021a1a3c
_LIT1: .word data_021a2840
_LIT2: .word data_021a2844
_LIT3: .word data_021a2848
_LIT4: .word data_021a284c
_LIT5: .word data_021a2850
_LIT6: .word data_021a2854
