; func_02045948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f4
        .extern func_02092fc8
        .extern func_02093a20
        .global func_02045948
        .arm
func_02045948:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r1, #0x0
    ldr r3, [r2, #0x4]
    ldr ip, [r2]
    cmp r3, r1
    mov r4, r0
    cmpeq ip, r1
    bne .L_c4
    ldr r0, [r2, #0xc]
    ldr r3, [r2, #0x8]
    cmp r0, r1
    cmpeq r3, r1
    bne .L_c4
    ldr r0, [r2, #0x14]
    ldr r2, [r2, #0x10]
    cmp r0, r1
    cmpeq r2, r1
    bne .L_c4
    add r0, sp, #0x0
    bl func_02093a20
    bl func_02092fc8
    ldr r2, [sp]
    ldr r3, [sp, #0x4]
    mov lr, r2, lsr #0x18
    mov r2, r1, lsl #0x18
    orr lr, lr, r3, lsl #0x8
    mvn r1, #-16777216
    mov ip, r3, lsr #0x18
    and r1, lr, r1
    orr r3, r1, r0, lsl #0x18
    and r1, ip, #0x0
    orr r2, r2, r0, lsr #0x8
    orr r1, r1, r2
    str r1, [sp, #0x4]
    ldr ip, _LIT0
    add r0, sp, #0x0
    str r3, [sp]
    ldmia r0, {r2, r3}
    stmia ip, {r2, r3}
    ldr r3, _LIT1
    ldr r2, _LIT2
    ldr r1, _LIT3
    mov r0, #0x0
    str r3, [ip, #0x8]
    str r2, [ip, #0xc]
    str r1, [ip, #0x10]
    str r0, [ip, #0x14]
.L_c4:
    ldr r1, _LIT0
    ldr r3, [r1, #0x8]
    ldr r2, [r1]
    ldr r0, [r1, #0x4]
    umull lr, ip, r3, r2
    mla ip, r3, r0, ip
    ldr r0, [r1, #0xc]
    ldr r3, [r1, #0x10]
    mla ip, r0, r2, ip
    adds r2, r3, lr
    ldr r0, [r1, #0x14]
    str r2, [r1]
    adc r0, r0, ip
    cmp r4, #0x0
    str r0, [r1, #0x4]
    movne r3, #0x0
    umullne r2, r1, r0, r4
    mlane r1, r0, r3, r1
    mlane r1, r3, r4, r1
    movne r0, r1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d9f4
_LIT1: .word 0x6c078965
_LIT2: .word 0x5d588b65
_LIT3: .word 0x00269ec3
