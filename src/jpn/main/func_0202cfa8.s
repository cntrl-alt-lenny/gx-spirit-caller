; func_0202cfa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_0219ac68
        .extern func_02001cec
        .extern func_0200506c
        .extern func_0201d460
        .extern func_0201d4dc
        .extern func_0202b0ac
        .extern func_0202b154
        .extern func_0202ce24
        .extern func_02094410
        .extern func_0209445c
        .global func_0202cfa8
        .arm
func_0202cfa8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0xc8
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d4dc
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x68]
    bl func_0201d460
    mov r1, r0
    mov r0, #0x0
    mov r2, #0xc0
    bl func_02094410
    add r1, r4, #0x220
    mov r0, #0x0
    mov r2, #0x1800
    bl func_02094410
    ldr r0, _LIT1
    mov r1, #0x40
    mov r2, #0x3
    bl func_02001cec
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_214
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b154
    mov r2, #0x1
    mov ip, #0xc
    mov r3, r2
    add r1, r4, #0x220
    str ip, [sp]
    bl func_0202ce24
    b .L_244
.L_214:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b0ac
    mov r1, r0
    mov r2, #0x6
    ldr r0, _LIT1
    str r2, [sp]
    mov ip, #0xc
    add r2, r4, #0x220
    mov r3, #0x1
    str ip, [sp, #0x4]
    bl func_0200506c
.L_244:
    ldr r0, _LIT1
    ldr r1, _LIT0
    ldr r2, [r0, #0x8]
    mov r0, #0x0
    add r2, r2, #0x6
    bic r2, r2, #0x7
    str r2, [r1, #0x8]
    ldr r1, [r1, #0xc]
    cmp r2, r1
    bgt .L_284
    sub r1, r1, r2
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
.L_284:
    mov lr, #0x0
    mov r6, #0x11
    mov r4, lr
    add r3, sp, #0x8
    mov ip, lr
.L_298:
    mov r5, ip
    add r2, r3, lr, lsl #0x6
.L_2a0:
    cmp r5, r0
    movlt r7, r4
    blt .L_2bc
    sub r1, r5, r0
    add r1, r6, r1
    mov r1, r1, lsl #0x10
    mov r7, r1, lsr #0x10
.L_2bc:
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    strh r7, [r1, r2]
    cmp r5, #0x20
    blt .L_2a0
    add lr, lr, #0x1
    cmp lr, #0x3
    add r6, r6, #0x40
    blt .L_298
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d460
    mov r1, r0
    add r0, sp, #0x8
    mov r2, #0xc0
    bl func_0209445c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x10]
    add sp, sp, #0xc8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219ac68
_LIT1: .word data_02102bb0
_LIT2: .word data_02104e6c
