; func_0202cffc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_0219ad48
        .extern func_02001d0c
        .extern func_02005088
        .extern func_0201d4b4
        .extern func_0201d530
        .extern func_0202b100
        .extern func_0202b1a8
        .extern func_0202ce78
        .extern func_02094504
        .extern func_02094550
        .global func_0202cffc
        .arm
func_0202cffc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0xc8
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d530
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x68]
    bl func_0201d4b4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0xc0
    bl func_02094504
    add r1, r4, #0x220
    mov r0, #0x0
    mov r2, #0x1800
    bl func_02094504
    ldr r0, _LIT1
    mov r1, #0x40
    mov r2, #0x3
    bl func_02001d0c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_268
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b1a8
    mov r2, #0x1
    mov ip, #0xc
    mov r3, r2
    add r1, r4, #0x220
    str ip, [sp]
    bl func_0202ce78
    b .L_298
.L_268:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b100
    mov r1, r0
    mov r2, #0x6
    ldr r0, _LIT1
    str r2, [sp]
    mov ip, #0xc
    add r2, r4, #0x220
    mov r3, #0x1
    str ip, [sp, #0x4]
    bl func_02005088
.L_298:
    ldr r0, _LIT1
    ldr r1, _LIT0
    ldr r2, [r0, #0x8]
    mov r0, #0x0
    add r2, r2, #0x6
    bic r2, r2, #0x7
    str r2, [r1, #0x8]
    ldr r1, [r1, #0xc]
    cmp r2, r1
    bgt .L_2d8
    sub r1, r1, r2
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
.L_2d8:
    mov lr, #0x0
    mov r6, #0x11
    mov r4, lr
    add r3, sp, #0x8
    mov ip, lr
.L_2ec:
    mov r5, ip
    add r2, r3, lr, lsl #0x6
.L_2f4:
    cmp r5, r0
    movlt r7, r4
    blt .L_310
    sub r1, r5, r0
    add r1, r6, r1
    mov r1, r1, lsl #0x10
    mov r7, r1, lsr #0x10
.L_310:
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    strh r7, [r1, r2]
    cmp r5, #0x20
    blt .L_2f4
    add lr, lr, #0x1
    cmp lr, #0x3
    add r6, r6, #0x40
    blt .L_2ec
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d4b4
    mov r1, r0
    add r0, sp, #0x8
    mov r2, #0xc0
    bl func_02094550
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x10]
    add sp, sp, #0xc8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219ad48
_LIT1: .word data_02102c90
_LIT2: .word data_02104f4c
