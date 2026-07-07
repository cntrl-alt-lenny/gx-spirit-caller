; func_ov006_021c7c54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021ce530
        .global func_ov006_021c7c54
        .arm
func_ov006_021c7c54:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    ldr r4, [r0, #0x74]
    ldr r3, [r3, #0x4]
    mov ip, #0x14
    mov r3, r3, lsl #0x1d
    movs r3, r3, lsr #0x1d
    ldreq r5, _LIT1
    mov r3, #0x14
    ldrne r5, _LIT2
    mla r3, r4, r3, r5
    ldrb r4, [r3, #0x9]
    ldrb r5, [r3, #0x8]
    ldrsh r6, [r3, #0x2]
    smulbb r4, r4, ip
    smulbb r5, r5, ip
    cmp r6, #0x0
    movne ip, #0x3
    sub r2, r2, r4
    cmp r6, #0x1
    moveq r4, #0xac
    mov ip, ip, lsl #0x10
    movne r4, #0xbd
    sub r1, r1, r5
    cmp r1, #0x3
    mov r6, ip, asr #0x10
    mov lr, r4, lsl #0x10
    movlt r1, #0x3
    blt .L_8c
    ldr r4, [r0, #0x78]
    mov ip, #0x14
    mul r5, r4, ip
    rsb r4, r5, #0xfd
    cmp r1, r4
    movgt r1, r4
.L_8c:
    cmp r2, r6
    movlt r2, r6
    blt .L_b0
    ldr r4, [r0, #0x7c]
    mov ip, #0x14
    mul r5, r4, ip
    rsb r4, r5, lr, asr #0x10
    cmp r2, r4
    movgt r2, r4
.L_b0:
    str r1, [r0, #0x88]
    str r2, [r0, #0x8c]
    mov r1, #0x0
    str r1, [r0, #0x98]
    str r1, [r0, #0x9c]
    ldrsh r1, [r3, #0x2]
    cmp r1, #0x0
    cmpne r1, #0x1
    bne .L_e8
    ldr r2, [r0, #0x88]
    ldr r1, [r0, #0x90]
    add r1, r2, r1
    rsb r1, r1, #0x0
    str r1, [r0, #0x98]
.L_e8:
    ldr r3, [r0, #0x88]
    ldr r2, _LIT3
    ldr r1, [r0, #0x8c]
    sub r3, r3, #0x8
    sub r1, r1, #0x8
    rsb r4, r3, #0x0
    rsb r3, r1, #0x0
    mov r1, r2, lsl #0x10
    and r4, r4, r2
    and r3, r1, r3, lsl #0x10
    ldr r1, _LIT4
    orr r3, r4, r3
    str r3, [r1]
    ldr r5, [r0, #0x88]
    ldr r4, [r0, #0x90]
    ldr ip, [r0, #0x8c]
    ldr r3, [r0, #0x94]
    ldr r6, [r0, #0x98]
    ldr lr, [r0, #0x9c]
    add r4, r5, r4
    add r0, ip, r3
    add r3, r6, r4
    add r0, lr, r0
    rsb r4, r3, #0x0
    rsb r3, r0, #0x0
    mov r0, r2, lsl #0x10
    and r2, r4, r2
    and r0, r0, r3, lsl #0x10
    orr r0, r2, r0
    str r0, [r1, #0x4]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov006_021ce530
_LIT2: .word data_ov006_021ce530+0x258
_LIT3: .word 0x000001ff
_LIT4: .word 0x04001014
