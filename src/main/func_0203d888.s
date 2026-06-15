; func_0203d888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203d6a8
        .extern func_0203d6c4
        .extern func_0207b5f8
        .extern func_0207b9c0
        .extern func_020930b0
        .global func_0203d888
        .arm
func_0203d888:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_0207b5f8
    ldrb r2, [r6, #0xd13]
    add r3, r6, #0x470
    mov r1, #0xc0
    mla r5, r2, r1, r3
    cmp r0, #0x3
    bne .L_2b4
    mov r0, r6
    bl func_0203d6c4
    ldrb r1, [r6, #0xd15]
    mov r4, r0
    add r0, r1, #0x1
    strb r0, [r6, #0xd15]
    ldrb r1, [r6, #0xd15]
    cmp r1, #0x3
    bls .L_210
    mov r0, #0x0
    strb r0, [r6, #0xd15]
    ldrb r1, [r6, #0xd13]
    mov r2, #0x1
    mov r0, #0x9
    add r1, r6, r1, lsl #0x2
    strb r2, [r1, #0x444]
    ldmia sp!, {r4, r5, r6, pc}
.L_210:
    cmp r1, #0x1
    beq .L_290
    ldrb r0, [r6, #0xd14]
    cmp r0, #0x1
    ldreqb r0, [r6, #0xd0b]
    biceq r0, r0, #0xc
    streqb r0, [r6, #0xd0b]
    beq .L_290
    cmp r0, #0x2
    bne .L_258
    mov r0, #0x0
    strb r0, [r6, #0xd15]
    ldrb r1, [r6, #0xd13]
    mov r2, #0x3
    mov r0, #0x9
    add r1, r6, r1, lsl #0x2
    strb r2, [r1, #0x444]
    ldmia sp!, {r4, r5, r6, pc}
.L_258:
    cmp r0, #0x3
    bne .L_280
    mov r0, #0x0
    strb r0, [r6, #0xd15]
    ldrb r1, [r6, #0xd13]
    mov r2, #0x4
    mov r0, #0x9
    add r1, r6, r1, lsl #0x2
    strb r2, [r1, #0x444]
    ldmia sp!, {r4, r5, r6, pc}
.L_280:
    cmp r1, #0x3
    ldreqb r0, [r6, #0xd0b]
    biceq r0, r0, #0xc
    streqb r0, [r6, #0xd0b]
.L_290:
    mov r0, r6
    bl func_0203d6a8
    mov r2, r0
    ldr r1, _LIT0
    mov r0, r5
    add r1, r6, r1
    orr r2, r4, r2
    bl func_0207b9c0
    b .L_2d8
.L_2b4:
    cmp r0, #0x9
    bne .L_2d8
    mov r0, #0x0
    strb r0, [r6, #0xd15]
    bl func_020930b0
    str r0, [r6, #0xcb0]
    str r1, [r6, #0xcb4]
    mov r0, #0xa
    ldmia sp!, {r4, r5, r6, pc}
.L_2d8:
    mov r0, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000cb8
