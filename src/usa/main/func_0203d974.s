; func_0203d974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203d560
        .extern func_0203d690
        .extern func_02094500
        .global func_0203d974
        .arm
func_0203d974:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrb r2, [r5, #0xd13]
    add r3, r5, #0x470
    mov r1, #0xc0
    mla r4, r2, r1, r3
    bl func_0203d690
    ldr r1, _LIT0
    strb r0, [r5, #0xd0d]
    add r0, r5, r1
    mov r1, #0x0
    mov r2, #0x52
    bl func_02094500
    ldr r2, _LIT0
    ldrb r1, [r5, #0xd0d]
    mov r0, r5
    add r2, r5, r2
    bl func_0203d560
    cmp r0, #0x0
    beq .L_3a8
    ldrb r0, [r5, #0xd0b]
    bic r0, r0, #0xc
    orr r0, r0, #0x4
    strb r0, [r5, #0xd0b]
    ldrh r0, [r4, #0x2c]
    mov r0, r0, asr #0x4
    ands r0, r0, #0x1
    bne .L_374
    ldrb r1, [r5, #0xd13]
    mov r2, #0x3
    add sp, sp, #0x4
    add r1, r5, r1, lsl #0x2
    strb r2, [r1, #0x444]
    mov r0, #0x9
    ldmia sp!, {r4, r5, pc}
.L_374:
    ldrb r0, [r5, #0xd0d]
    cmp r0, #0x6
    bne .L_3e4
    ldrb r0, [r4, #0x15]
    cmp r0, #0x0
    bne .L_3e4
    ldrb r1, [r5, #0xd13]
    mov r2, #0x3
    add sp, sp, #0x4
    add r1, r5, r1, lsl #0x2
    strb r2, [r1, #0x444]
    mov r0, #0x9
    ldmia sp!, {r4, r5, pc}
.L_3a8:
    ldrb r0, [r5, #0xd0b]
    bic r0, r0, #0xc
    strb r0, [r5, #0xd0b]
    ldrh r0, [r4, #0x2c]
    mov r0, r0, asr #0x4
    and r0, r0, #0x1
    cmp r0, #0x1
    bne .L_3e4
    ldrb r1, [r5, #0xd13]
    mov r2, #0x3
    add sp, sp, #0x4
    add r1, r5, r1, lsl #0x2
    strb r2, [r1, #0x444]
    mov r0, #0x9
    ldmia sp!, {r4, r5, pc}
.L_3e4:
    mov r0, #0x0
    strb r0, [r5, #0xd15]
    strb r0, [r5, #0xd14]
    mov r0, #0x8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00000cb8
