; func_02085074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021020f4
        .extern data_021020f8
        .extern data_021020fc
        .extern data_02102100
        .extern func_02081b5c
        .extern func_02081ee4
        .extern func_02081f48
        .extern func_02081f50
        .extern func_02081f5c
        .extern func_02082030
        .extern func_02082044
        .extern func_02082050
        .extern func_020854a4
        .extern func_020854e4
        .global func_02085074
        .arm
func_02085074:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r1, [r5]
    ldr r0, _LIT0
    cmp r1, r0
    bhi .L_58
    cmp r1, r0
    bcs .L_214
    ldr r0, _LIT1
    cmp r1, r0
    bhi .L_48
    cmp r1, r0
    bcs .L_214
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_214
    b .L_220
.L_48:
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_214
    b .L_220
.L_58:
    ldr r0, _LIT4
    cmp r1, r0
    bhi .L_7c
    cmp r1, r0
    bcs .L_214
    ldr r0, _LIT5
    cmp r1, r0
    beq .L_88
    b .L_220
.L_7c:
    ldr r0, _LIT6
    cmp r1, r0
    bne .L_220
.L_88:
    mov fp, #0x1
    mov r0, r5
    mov r9, fp
    mov r8, fp
    bl func_020854a4
    movs r4, r0
    beq .L_1e0
    bl func_02082050
    mov r7, r0
    mov r0, r4
    bl func_02082044
    mov r6, r0
    mov r0, r4
    bl func_02081f50
    mov sl, r0
    cmp r7, #0x0
    beq .L_f0
    ldr r0, _LIT7
    mov r1, #0x0
    ldr r3, [r0]
    mov r0, r7
    mov r2, r1
    blx r3
    movs r7, r0
    moveq fp, #0x0
    b .L_f4
.L_f0:
    mov r7, #0x0
.L_f4:
    cmp r6, #0x0
    beq .L_120
    ldr r1, _LIT7
    mov r0, r6
    ldr r3, [r1]
    mov r1, #0x1
    mov r2, #0x0
    blx r3
    movs r6, r0
    moveq r9, #0x0
    b .L_124
.L_120:
    mov r6, #0x0
.L_124:
    cmp sl, #0x0
    beq .L_154
    ldr r1, _LIT8
    ldrh r2, [r4, #0x20]
    ldr r3, [r1]
    mov r0, sl
    and r1, r2, #0x8000
    mov r2, #0x0
    blx r3
    movs sl, r0
    moveq r8, #0x0
    b .L_158
.L_154:
    mov sl, #0x0
.L_158:
    cmp fp, #0x0
    beq .L_170
    cmp r9, #0x0
    beq .L_170
    cmp r8, #0x0
    bne .L_1ac
.L_170:
    ldr r1, _LIT9
    mov r0, sl
    ldr r1, [r1]
    blx r1
    ldr r1, _LIT10
    mov r0, r6
    ldr r1, [r1]
    blx r1
    ldr r1, _LIT10
    mov r0, r7
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ac:
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02082030
    mov r0, r4
    mov r1, sl
    bl func_02081f48
    mov r0, r4
    mov r1, #0x1
    bl func_02081f5c
    mov r0, r4
    mov r1, #0x1
    bl func_02081ee4
.L_1e0:
    ldr r1, [r5]
    ldr r0, _LIT5
    cmp r1, r0
    bne .L_208
    mov r0, r5
    bl func_020854e4
    cmp r4, #0x0
    beq .L_208
    mov r1, r4
    bl func_02081b5c
.L_208:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_214:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_220:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x30415642
_LIT1: .word 0x30414d42
_LIT2: .word 0x30414342
_LIT3: .word 0x30415442
_LIT4: .word 0x30505442
_LIT5: .word 0x30444d42
_LIT6: .word 0x30585442
_LIT7: .word data_021020f4
_LIT8: .word data_021020fc
_LIT9: .word data_02102100
_LIT10: .word data_021020f8
