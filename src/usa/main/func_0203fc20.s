; func_0203fc20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe550
        .extern data_020fe560
        .extern data_0219d8f4
        .extern data_0219d8f8
        .extern func_0203f918
        .extern func_02040dec
        .extern func_02044c68
        .extern func_02044e08
        .extern func_02044e58
        .global func_0203fc20
        .arm
func_0203fc20:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r2, r0, #0x1000
    ldr r0, [r2, #0x314]
    ldr r5, [r2, #0x20c]
    ldr r4, [r2, #0x210]
    bl func_02040dec
    cmp r0, #0x1
    beq .L_358
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0xe
    ldmia sp!, {r4, r5, pc}
.L_358:
    bl func_0203f918
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0xe
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r2, [r0, #0x8]
    cmp r2, r1
    bge .L_42c
    ldr r0, _LIT2
    cmp r2, r0
    bne .L_420
    ldr r0, _LIT3
    ldr r1, _LIT4
    blx r5
    movs r5, r0
    bne .L_3c8
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_3c8:
    add r1, r5, #0x1f
    ldr r0, _LIT5
    bic r1, r1, #0x1f
    bl func_02044e08
    cmp r0, #0x1
    beq .L_410
    ldr r0, _LIT6
    mov r1, r5
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0xf
    ldmia sp!, {r4, r5, pc}
.L_410:
    ldr r0, _LIT6
    mov r1, r5
    mov r2, #0x0
    blx r4
.L_420:
    add sp, sp, #0x4
    mov r0, #0x15
    ldmia sp!, {r4, r5, pc}
.L_42c:
    ldr r0, _LIT7
    cmp r2, r0
    beq .L_448
    ldr r0, _LIT8
    cmp r2, r0
    beq .L_470
    b .L_4e0
.L_448:
    ldr r0, _LIT5
    bl func_02044c68
    ldr r0, _LIT0
    ldr r2, _LIT7
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x10
    ldmia sp!, {r4, r5, pc}
.L_470:
    ldr r0, _LIT3
    mov r1, #0x700
    blx r5
    movs r5, r0
    bne .L_4a4
    ldr r0, _LIT0
    ldr r2, _LIT8
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x11
    ldmia sp!, {r4, r5, pc}
.L_4a4:
    add r0, r5, #0x1f
    bic r0, r0, #0x1f
    bl func_02044e58
    ldr r0, _LIT6
    mov r1, r5
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    ldr r2, _LIT8
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x11
    ldmia sp!, {r4, r5, pc}
.L_4e0:
    mov r0, #0x12
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219d8f4
_LIT1: .word 0x00004e84
_LIT2: .word 0x00004e22
_LIT3: .word data_020fe550
_LIT4: .word 0x0000071f
_LIT5: .word data_0219d8f8
_LIT6: .word data_020fe560
_LIT7: .word 0x00004e88
_LIT8: .word 0x00004e8c
