; func_ov002_0226e0ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbd54
        .global func_ov002_0226e0ec
        .arm
func_ov002_0226e0ec:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    mov r4, r0
    cmp r1, ip
    bgt .L_78
    bge .L_1f4
    ldr r3, _LIT1
    cmp r1, r3
    bgt .L_54
    bge .L_164
    sub r2, r3, #0x45
    cmp r1, r2
    bgt .L_340
    sub r2, r3, #0x48
    cmp r1, r2
    blt .L_340
    beq .L_ec
    sub r2, r3, #0x45
    cmp r1, r2
    beq .L_11c
    b .L_340
.L_54:
    add r2, r3, #0x1
    cmp r1, r2
    bgt .L_68
    beq .L_194
    b .L_340
.L_68:
    sub r2, ip, #0x1
    cmp r1, r2
    beq .L_1c4
    b .L_340
.L_78:
    add r2, ip, #0x1f8
    cmp r1, r2
    bgt .L_c8
    bge .L_2b4
    ldr r3, _LIT2
    cmp r1, r3
    bgt .L_9c
    beq .L_224
    b .L_340
.L_9c:
    add r2, r3, #0x2
    cmp r1, r2
    bgt .L_340
    add r2, r3, #0x1
    cmp r1, r2
    blt .L_340
    beq .L_254
    add r2, r3, #0x2
    cmp r1, r2
    beq .L_284
    b .L_340
.L_c8:
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_dc
    beq .L_2e4
    b .L_340
.L_dc:
    add r2, r3, #0x1
    cmp r1, r2
    beq .L_314
    b .L_340
.L_ec:
    mov r1, #0x1580
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_11c:
    mov r1, #0x1580
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT4
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_164:
    mov r1, #0x1580
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_194:
    sub r1, r3, #0x49
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT5
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1c4:
    rsb r1, r3, #0x2f40
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT6
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1f4:
    sub r1, ip, #0x1
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT7
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_224:
    sub r1, r3, #0x70
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT8
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_254:
    sub r1, r3, #0x70
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT9
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_284:
    sub r1, r3, #0x70
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT10
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_2b4:
    add r1, ip, #0xa9
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT11
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_2e4:
    sub r1, r3, #0x150
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT12
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    bne .L_340
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_314:
    sub r1, r3, #0x150
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT13
    mov r0, r4
    bl func_ov002_021bbd54
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_340:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001954
_LIT1: .word 0x000015f9
_LIT2: .word 0x00001a6d
_LIT3: .word 0x00001b4d
_LIT4: .word 0x000015b0
_LIT5: .word 0x000015b3
_LIT6: .word 0x0000194b
_LIT7: .word 0x000015b4
_LIT8: .word 0x00001a74
_LIT9: .word 0x00001a70
_LIT10: .word 0x00001a75
_LIT11: .word 0x00001a73
_LIT12: .word 0x00001a71
_LIT13: .word 0x00001a72
