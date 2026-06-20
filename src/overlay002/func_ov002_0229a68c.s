; func_ov002_0229a68c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c40
        .extern data_ov002_022cd73c
        .global func_ov002_0229a68c
        .arm
func_ov002_0229a68c:
    ldr r2, _LIT0
    mov r3, #0x1
    ldr r2, [r2, #0xb88]
    cmp r2, #0x1
    cmpne r2, #0x2
    movne r3, #0x0
    cmp r3, #0x0
    ldreq r1, _LIT0
    streq r0, [r1, #0xb9c]
    bxeq lr
    cmp r0, #0x1
    beq .L_22c
    cmp r0, #0x2
    beq .L_270
    b .L_2b8
.L_22c:
    ldr r0, _LIT1
    ldr r3, _LIT2
    ldr ip, [r0, #0x4]
    ldr r2, [r3, ip, lsl #0x2]
    add r2, r2, #0x1
    str r2, [r3, ip, lsl #0x2]
    cmp r2, #0x2
    bcs .L_254
    cmp r1, #0x8
    bne .L_264
.L_254:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0xb9c]
    bx lr
.L_264:
    mov r1, #0x4
    str r1, [r0, #0x10]
    b .L_2c4
.L_270:
    ldr r0, _LIT1
    ldr r3, _LIT2
    ldr r2, [r0, #0x4]
    eor ip, r2, #0x1
    ldr r2, [r3, ip, lsl #0x2]
    add r2, r2, #0x1
    str r2, [r3, ip, lsl #0x2]
    cmp r2, #0x2
    bcs .L_29c
    cmp r1, #0x8
    bne .L_2ac
.L_29c:
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0xb9c]
    bx lr
.L_2ac:
    mov r1, #0x3
    str r1, [r0, #0x10]
    b .L_2c4
.L_2b8:
    ldr r0, _LIT1
    mov r1, #0x2
    str r1, [r0, #0x10]
.L_2c4:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb90]
    cmp r1, #0x2
    bcs .L_2e0
    ldr r0, [r0, #0xbb4]
    cmp r0, #0x0
    bxne lr
.L_2e0:
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr r1, [r0, #0x4]
    eor r0, r1, #0x1
    ldr r1, [r2, r1, lsl #0x2]
    ldr r0, [r2, r0, lsl #0x2]
    sub r0, r1, r0
    cmp r0, #0x0
    ble .L_314
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0xb9c]
    bx lr
.L_314:
    bge .L_328
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0xb9c]
    bx lr
.L_328:
    ldr r0, _LIT0
    ldr r1, [r0, #0xbb4]
    cmp r1, #0x0
    movlt r1, #0x3
    strlt r1, [r0, #0xb9c]
    bx lr
_LIT0: .word data_021040ac
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_02104c40
