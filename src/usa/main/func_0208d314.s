; func_0208d314 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d314
        .arm
func_0208d314:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0xa]
    ldrh r3, [r1]
    cmp r0, #0x30
    strh r0, [r1, #0xa]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bgt .L_19c
    cmp r0, #0x30
    bge .L_1f4
    cmp r0, #0x10
    bgt .L_190
    cmp r0, #0x10
    bge .L_200
    cmp r0, #0x0
    b .L_20c
.L_190:
    cmp r0, #0x20
    beq .L_1d8
    b .L_20c
.L_19c:
    cmp r0, #0x60
    bgt .L_1c0
    cmp r0, #0x60
    bge .L_1cc
    cmp r0, #0x40
    ldreq r0, _LIT1
    moveq r1, #0x83
    streqb r1, [r0]
    b .L_20c
.L_1c0:
    cmp r0, #0x70
    beq .L_1e8
    b .L_20c
.L_1cc:
    ldr r0, _LIT1
    mov r1, #0x8b
    strb r1, [r0]
.L_1d8:
    ldr r0, _LIT2
    mov r1, #0x83
    strb r1, [r0]
    b .L_20c
.L_1e8:
    ldr r0, _LIT1
    mov r1, #0x9b
    strb r1, [r0]
.L_1f4:
    ldr r0, _LIT2
    mov r1, #0x93
    strb r1, [r0]
.L_200:
    ldr r0, _LIT3
    mov r1, #0x83
    strb r1, [r0]
.L_20c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000246
_LIT2: .word 0x04000245
_LIT3: .word 0x04000244
