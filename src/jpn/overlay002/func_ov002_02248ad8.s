; func_ov002_02248ad8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202df24
        .extern func_ov002_02253370
        .global func_ov002_02248ad8
        .arm
func_ov002_02248ad8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    mov r7, r1
    mov r8, r0
    cmp r7, r2
    bgt .L_40
    bge .L_84
    ldr r1, _LIT1
    cmp r7, r1
    bgt .L_30
    subeq r7, r1, #0x2
    b .L_98
.L_30:
    add r0, r1, #0x75
    cmp r7, r0
    addeq r7, r1, #0x52
    b .L_98
.L_40:
    ldr r1, _LIT2
    cmp r7, r1
    bgt .L_74
    sub r0, r1, #0x5
    cmp r7, r0
    blt .L_98
    beq .L_8c
    sub r0, r1, #0x1
    cmp r7, r0
    beq .L_94
    cmp r7, r1
    subeq r7, r1, #0x5
    b .L_98
.L_74:
    add r0, r1, #0x93
    cmp r7, r0
    addeq r7, r1, #0x97
    b .L_98
.L_84:
    ldr r7, _LIT3
    b .L_98
.L_8c:
    sub r7, r1, #0x1
    b .L_98
.L_94:
    mov r7, r1
.L_98:
    ldr r0, _LIT4
    and r2, r8, #0x1
    mul r1, r2, r0
    ldr r0, _LIT5
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT6
    mov r9, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_c8:
    ldr r0, [r5]
    mov r1, r7
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_f4
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253370
.L_f4:
    ldr r0, [r6, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_c8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000139d
_LIT1: .word 0x00001293
_LIT2: .word 0x0000180c
_LIT3: .word 0x00000fe4
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf09c
_LIT6: .word data_ov002_022cf08c
