; func_ov002_021fd838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b86c
        .extern func_ov002_02257cac
        .global func_ov002_021fd838
        .arm
func_ov002_021fd838:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r2, r1, lsl #0x1e
    movs r2, r2, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, r1, lsl #0x1a
    movs r1, r1, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    bl func_ov002_02257cac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_1bc
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_84
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    ldrneh r1, [r4]
    ldrne r0, _LIT0
    cmpne r1, r0
    beq .L_1bc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_84:
    ldrh r0, [r4]
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_11c
    bge .L_19c
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_d8
    bge .L_19c
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_c8
    bge .L_19c
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_19c
    b .L_1b4
.L_c8:
    sub r1, r2, #0x7
    cmp r0, r1
    beq .L_19c
    b .L_1b4
.L_d8:
    sub r1, r3, #0xc7
    cmp r0, r1
    bgt .L_f8
    bge .L_19c
    add r1, r2, #0xb
    cmp r0, r1
    beq .L_19c
    b .L_1b4
.L_f8:
    add r1, r2, #0x1b8
    cmp r0, r1
    bgt .L_10c
    beq .L_19c
    b .L_1b4
.L_10c:
    sub r1, r3, #0x80
    cmp r0, r1
    beq .L_19c
    b .L_1b4
.L_11c:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_15c
    bge .L_19c
    sub r1, r2, #0xd3
    cmp r0, r1
    bgt .L_14c
    bge .L_19c
    add r1, r3, #0x62
    cmp r0, r1
    beq .L_19c
    b .L_1b4
.L_14c:
    sub r1, r2, #0x9d
    cmp r0, r1
    beq .L_19c
    b .L_1b4
.L_15c:
    add r1, r2, #0xd0
    cmp r0, r1
    bgt .L_17c
    bge .L_19c
    add r1, r2, #0xb7
    cmp r0, r1
    beq .L_19c
    b .L_1b4
.L_17c:
    add r1, r2, #0x10c
    cmp r0, r1
    bgt .L_190
    beq .L_19c
    b .L_1b4
.L_190:
    add r1, r2, #0x194
    cmp r0, r1
    bne .L_1b4
.L_19c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    beq .L_1bc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1b4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1bc:
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x2
    cmpne r0, #0x3
    cmpne r0, #0x4
    bne .L_2a8
    ldrh r2, [r4]
    ldr r1, _LIT6
    cmp r2, r1
    bgt .L_20c
    bge .L_2a8
    ldr r0, _LIT7
    cmp r2, r0
    bgt .L_1fc
    beq .L_2a8
    b .L_238
.L_1fc:
    sub r0, r1, #0x9e
    cmp r2, r0
    beq .L_2a8
    b .L_238
.L_20c:
    ldr r0, _LIT8
    cmp r2, r0
    bgt .L_22c
    bge .L_2a8
    add r0, r1, #0xe1
    cmp r2, r0
    beq .L_2a8
    b .L_238
.L_22c:
    ldr r0, _LIT9
    cmp r2, r0
    beq .L_2a8
.L_238:
    ldrh r2, [r4, #0x2]
    mov r0, r2, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_2a8
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r3, _LIT10
    ldr r0, _LIT11
    and r1, r1, #0x1
    mla ip, r1, r0, r3
    mov r2, r2, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r0, #0x14
    ldrh r1, [r4, #0x4]
    mul r0, r3, r0
    mov r2, r1, lsl #0x11
    add r1, ip, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsr #0x17
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_2a8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001909
_LIT1: .word 0x000014b2
_LIT2: .word 0x00001238
_LIT3: .word 0x00001103
_LIT4: .word 0x00000fee
_LIT5: .word 0x0000173f
_LIT6: .word 0x0000150d
_LIT7: .word 0x00001232
_LIT8: .word 0x000017af
_LIT9: .word 0x000019d8
_LIT10: .word data_ov002_022cf08c
_LIT11: .word 0x00000868
