; func_020a202c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .global func_020a202c
        .arm
func_020a202c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldrh r4, [r1, #0x12]
    cmp r2, r4
    addcs sp, sp, #0x4
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, lr}
    bxcs lr
    mov ip, #0x2
.L_1e8:
    add r4, r1, ip, lsl #0x1
    ldrh r4, [r4, #0xc]
    cmp r2, r4
    bcs .L_208
    sub r4, ip, #0x1
    mov ip, r4, lsl #0x18
    movs ip, ip, asr #0x18
    bpl .L_1e8
.L_208:
    cmp ip, #0x0
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, lr}
    bxlt lr
    ldr r4, _LIT0
    add r5, r1, ip, lsl #0x1
    ldr lr, [r4]
    ldrh r5, [r5, #0xc]
    add lr, lr, #0x1000
    ldr lr, [lr, #0x318]
    sub r5, r2, r5
    mul r2, r5, lr
    add r3, r3, #0xc
    add r5, r3, ip, lsl #0x4
    ldr r3, [r5, #0x8]
    sub r3, r3, r2
    str r3, [r0, #0x4]
    ldr r3, [r4]
    ldr r4, [r0, #0x4]
    add r3, r3, #0x1000
    ldr r3, [r3, #0x318]
    cmp r4, r3
    strhi r3, [r0, #0x4]
    ldr r1, [r1, ip, lsl #0x2]
    add r1, r2, r1
    str r1, [r0, #0x8]
    ldr r1, [r5]
    add r1, r2, r1
    str r1, [r0]
    strb ip, [r0, #0xc]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a98fc
