; func_020aacac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern data_021aa040
        .extern data_021aa064
        .extern data_021aa130
        .extern data_021aa464
        .extern func_0209268c
        .extern func_02092748
        .extern func_020927b8
        .extern func_020a6b54
        .global func_020aacac
        .arm
func_020aacac:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    cmp r5, #0x1
    blt .L_1364
    cmp r5, #0x7
    ble .L_136c
.L_1364:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_136c:
    ldr r0, _LIT0
    bl func_0209268c
    cmp r0, #0x0
    bne .L_13a0
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1, #0x1c]
    str r2, [r0, #0x1c]
    b .L_13f8
.L_13a0:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0x1c]
    ldr r0, [r0, #0x6c]
    cmp r1, r0
    bne .L_13d0
    ldr r0, _LIT3
    ldr r1, [r0, #0x1c]
    add r1, r1, #0x1
    str r1, [r0, #0x1c]
    b .L_13f8
.L_13d0:
    ldr r0, _LIT0
    bl func_020927b8
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1, #0x1c]
    str r2, [r0, #0x1c]
.L_13f8:
    ldr r1, _LIT4
    sub r2, r5, #0x1
    ldr r4, [r1, r2, lsl #0x2]
    cmp r4, #0x1
    movne r0, #0x0
    strne r0, [r1, r2, lsl #0x2]
    ldr r0, _LIT3
    ldr r1, [r0, #0x1c]
    subs r1, r1, #0x1
    str r1, [r0, #0x1c]
    bne .L_142c
    ldr r0, _LIT0
    bl func_02092748
.L_142c:
    cmp r4, #0x1
    beq .L_1440
    cmp r4, #0x0
    cmpeq r5, #0x1
    bne .L_1448
.L_1440:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1448:
    cmp r4, #0x0
    bne .L_1458
    mov r0, #0x0
    bl func_020a6b54
.L_1458:
    mov r0, r5
    blx r4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_021aa130
_LIT1: .word data_021a63d0
_LIT2: .word data_021aa040
_LIT3: .word data_021aa064
_LIT4: .word data_021aa464
