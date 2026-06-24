; func_02060250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101164
        .extern data_02101174
        .extern data_02101180
        .extern data_0210121c
        .extern data_0210122c
        .extern func_020a6c60
        .extern func_020aace8
        .extern func_020aafd0
        .global func_02060250
        .arm
func_02060250:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r5, r0
    mov r8, r1
    mov r4, r2
    mov r7, r3
    bne .L_2c
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_2c:
    cmp r8, #0x0
    bne .L_48
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6c60
.L_48:
    cmp r4, #0x0
    bne .L_64
    ldr r0, _LIT5
    ldr r1, _LIT1
    ldr r3, _LIT6
    mov r2, #0x0
    bl func_020a6c60
.L_64:
    cmp r7, #0x0
    bgt .L_80
    ldr r0, _LIT7
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x110
    bl func_020a6c60
.L_80:
    ldrsb r6, [r8]
    mov r0, r5
    mov r1, r8
    bl func_020aafd0
    movs r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    bl func_020aace8
    add r3, r5, r0
    sub r0, r7, #0x1
    mov r2, #0x0
    b .L_bc
.L_b4:
    strb r1, [r4, r2]
    add r2, r2, #0x1
.L_bc:
    cmp r2, r0
    bge .L_d8
    ldrsb r1, [r3, r2]
    cmp r1, #0x0
    beq .L_d8
    cmp r1, r6
    bne .L_b4
.L_d8:
    mov r0, #0x0
    strb r0, [r4, r2]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0210121c
_LIT1: .word data_02101164
_LIT2: .word 0x0000010d
_LIT3: .word data_02101174
_LIT4: .word 0x0000010e
_LIT5: .word data_02101180
_LIT6: .word 0x0000010f
_LIT7: .word data_0210122c
