; func_0207a24c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .extern func_0207ae40
        .extern func_0207af50
        .extern func_0207b054
        .extern func_0207cc4c
        .extern func_0207cce8
        .extern func_020927e4
        .global func_0207a24c
        .arm
func_0207a24c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_4d8
    cmp r0, #0x4
    b .L_5a4
.L_4d8:
    ldrh r0, [r4, #0x4]
    cmp r0, #0xe
    beq .L_4f0
    cmp r0, #0xf
    beq .L_548
    b .L_578
.L_4f0:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0xc
    bne .L_51c
    mov r0, #0x8
    bl func_0207af50
    bl func_0207ae40
    ldmia sp!, {r4, lr}
    bx lr
.L_51c:
    mov r0, #0x9
    bl func_0207af50
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    ldr r3, _LIT1
    mov r2, r0
    add r1, r1, #0x2140
    bl func_0207b054
    ldmia sp!, {r4, lr}
    bx lr
.L_548:
    ldr r0, [r4, #0x8]
    ldrh r0, [r0, #0xe]
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    bl func_0207cce8
    ldr r0, [r4, #0x8]
    mov r1, #0x620
    bl func_020927e4
    ldr r0, [r4, #0x8]
    bl func_0207cc4c
    ldmia sp!, {r4, lr}
    bx lr
.L_578:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT0
    ldrh r2, [r4, #0x4]
    ldr r0, [r0]
    ldr r3, _LIT2
    add r1, r0, #0x2140
    mov r0, #0x7
    bl func_0207b054
    ldmia sp!, {r4, lr}
    bx lr
.L_5a4:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT0
    ldr r3, _LIT3
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b054
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word 0x00000872
_LIT2: .word 0x00000881
_LIT3: .word 0x0000088c
