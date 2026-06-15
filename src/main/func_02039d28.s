; func_02039d28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219b384
        .extern data_0219c480
        .extern data_0219c494
        .extern data_0219c4e8
        .extern func_02038c54
        .extern func_02038d2c
        .extern func_02038e58
        .extern func_020399dc
        .extern func_0203a84c
        .extern func_0203aae8
        .extern func_0207cfdc
        .extern func_02089008
        .extern func_02092748
        .extern func_020927b8
        .global func_02039d28
        .arm
func_02039d28:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    mov r7, #0x0
    mov r6, r7
    bl func_020927b8
    ldr r8, _LIT1
    mov r5, r7
.L_10b0:
    ldr r0, [r8, #0x4]
    cmp r0, #0x0
    ldrneb r0, [r8, #0x58]
    cmpne r0, #0x1
    beq .L_11cc
    ldr r0, [r8, #0x8]
    add r7, r7, #0x1
    tst r0, #0x400
    mov r1, #0x0
    beq .L_10e4
    mov r1, #0x2
    tst r0, #0x200
    movne r1, #0x1
.L_10e4:
    cmp r1, r6
    movgt r6, r1
    bl func_02038c54
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [r8, #0x58]
    cmp r0, #0x4
    beq .L_11cc
    cmp r0, #0x3
    bne .L_1144
    ldr r1, [r8, #0x8]
    mov r0, r8
    bl func_020399dc
    cmp r0, #0x0
    beq .L_11cc
    movlt r0, #0x4
    strltb r0, [r8, #0x58]
    blt .L_11cc
.L_1134:
    mov r0, #0x1
    strb r0, [r8, #0x58]
    sub r7, r7, #0x1
    b .L_11cc
.L_1144:
    ldr sl, _LIT2
    mov r9, #0x0
    mov r4, #0x1
.L_1150:
    add r1, r8, r9, lsl #0x2
    ldr r0, [r1, #0x14]
    cmp r0, sl
    bne .L_1178
    ldr r0, [r8, #0x10]
    cmp r0, #0x0
    beq .L_1134
    mov r0, #0x3
    strb r0, [r8, #0x58]
    b .L_11cc
.L_1178:
    ldr r2, [r1, #0x34]
    cmp r2, #0x0
    bne .L_1198
    ldrh r1, [r8, #0x54]
    tst r1, r4, lsl r9
    bne .L_1198
    bl func_0203a84c
    mov r2, r0
.L_1198:
    cmp r2, #0x0
    ldrnesb r1, [r2, #0x1d]
    cmpne r1, #0x1
    beq .L_11c0
    mvn r0, #0x0
    cmp r1, r0
    bne .L_11cc
    mov r0, r8
    bl func_0203aae8
    b .L_11cc
.L_11c0:
    add r9, r9, #0x1
    cmp r9, #0x8
    blt .L_1150
.L_11cc:
    add r5, r5, #0x1
    cmp r5, #0x20
    add r8, r8, #0x5c
    blt .L_10b0
    cmp r7, #0x0
    bgt .L_1204
    ldr r1, _LIT3
    mov r2, #0x0
    ldr r0, _LIT0
    strh r2, [r1]
    bl func_02092748
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1204:
    ldr r0, _LIT3
    mov r8, #0x0
    ldrh r0, [r0]
    mov r7, r8
    mov sl, r8
    bic r1, r0, #0x80
    ldr r0, _LIT3
    strh r1, [r0]
    mvn r5, #0x0
    mov fp, r5, lsl #0x9
    sub r4, r5, #0x29
.L_1230:
    bl func_02038c54
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    ldrh r0, [r0]
    tst r0, #0x80
    bne .L_1440
    ldr r0, _LIT4
    mov r1, sl
    bl func_0207cfdc
    movs sl, r0
    bne .L_1288
    cmp r7, #0x0
    bne .L_1440
    cmp r8, #0x0
    bne .L_1280
    subs r6, r6, #0x1
    bmi .L_1440
.L_1280:
    mov r8, #0x0
    b .L_1230
.L_1288:
    ldrsb r1, [sl, #0x1d]
    cmp r1, #0x1
    beq .L_1230
    ldrb r0, [sl, #0x1f]
    cmp r0, r6
    blt .L_1230
    cmp r1, #0x2
    add r8, r8, #0x1
    beq .L_12c0
    cmp r1, #0x3
    beq .L_1300
    cmp r1, #0x4
    beq .L_12d0
    b .L_1230
.L_12c0:
    ldr r0, [sl, #0xc]
    str r0, [sl, #0x10]
    mov r0, #0x4
    strb r0, [sl, #0x1d]
.L_12d0:
    mov r0, sl
    bl func_02038d2c
    cmp r0, #0x0
    beq .L_1230
    str r0, [sl, #0x8]
    str sl, [r0, #0x4]
    ldrb r1, [sl, #0x1f]
    strh r1, [r0, #0xa]
    mov r1, #0x1
    strh r1, [r0, #0x8]
    mov r0, #0x3
    strb r0, [sl, #0x1d]
.L_1300:
    ldr r9, [sl, #0x8]
    cmp r9, #0x0
    bne .L_131c
    strb r5, [sl, #0x1d]
    mov r0, #0x0
    str r0, [sl, #0x8]
    b .L_1230
.L_131c:
    ldrsh r0, [r9, #0x8]
    cmp r0, #0x1
    bne .L_13c8
    ldr r3, [sl, #0x10]
    ldr r0, [sl, #0xc]
    cmp r3, #0x0
    sub r1, r0, r3
    beq .L_13c8
    cmp r3, #0x200
    ble .L_1350
    mov r3, #0x200
    cmp r1, #0x0
    moveq r3, fp
.L_1350:
    ldr r0, _LIT5
    ldrh r0, [r0]
    rsb r0, r0, #0xb6
    cmp r0, r4
    addle r0, r0, #0x7
    addle r0, r0, #0x100
    cmp r0, #0x0
    bge .L_138c
    mov r0, #0x4
    strb r0, [sl, #0x1d]
    ldr r1, [sl, #0x8]
    mov r0, #0x0
    str r0, [r1, #0x4]
    str r0, [sl, #0x8]
    b .L_13c8
.L_138c:
    str r1, [sp]
    ldr r1, [sl, #0x18]
    mov r0, r9
    str r1, [sp, #0x4]
    ldr r1, [sl, #0x14]
    add r2, sl, #0x20
    bl func_02038e58
    cmp r0, #0x0
    strlth r5, [r9, #0x8]
    blt .L_13c8
    ldr r1, [sl, #0x10]
    sub r0, r1, r0
    str r0, [sl, #0x10]
    mov r0, #0x0
    strh r0, [r9, #0x8]
.L_13c8:
    ldrsh r1, [r9, #0x8]
    add r0, r1, #0x1
    cmp r0, #0x1
    bhi .L_1230
    cmp r1, #0x0
    strneb r5, [sl, #0x1d]
    bne .L_142c
    mov r0, #0x4
    strb r0, [sl, #0x1d]
    ldr r0, [sl, #0x10]
    cmp r0, #0x0
    bne .L_142c
    mov r7, #0x1
    sub r8, r8, #0x1
    bl OS_DisableIrq
    mov r1, r7
    strb r1, [sl, #0x1d]
    mov r9, r0
    ldr r0, [sl, #0x14]
    tst r0, #0x8000000
    bne .L_1424
    add r1, sl, #0x20
    bl func_02089008
.L_1424:
    mov r0, r9
    bl OS_RestoreIrq
.L_142c:
    ldr r1, [sl, #0x8]
    mov r0, #0x0
    str r0, [r1, #0x4]
    str r0, [sl, #0x8]
    b .L_1230
.L_1440:
    ldr r0, _LIT0
    bl func_02092748
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b384
_LIT1: .word data_0219c4e8
_LIT2: .word 0x0000ffff
_LIT3: .word data_0219c480
_LIT4: .word data_0219c494
_LIT5: .word 0x04000006
