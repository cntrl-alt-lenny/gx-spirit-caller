; func_02056264 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffe54
        .extern data_020ffe58
        .extern data_020ffe84
        .extern data_020ffe8c
        .extern data_020ffe98
        .extern data_020ffea8
        .extern data_020ffeb0
        .extern data_020ffed8
        .extern data_020ffee0
        .extern data_020ffee8
        .extern data_020fff18
        .extern func_020453cc
        .extern func_02055324
        .extern func_02056d1c
        .extern func_02057980
        .extern func_02057b00
        .extern func_020585d4
        .extern func_0205aecc
        .extern func_0205bc24
        .extern func_0205bccc
        .extern func_0205bd0c
        .extern func_0205ffc0
        .extern func_0205ffd4
        .extern func_020603cc
        .extern func_020604a4
        .extern func_020a7368
        .extern func_020a7388
        .extern func_020ab054
        .extern func_020ab0c4
        .extern func_020ace00
        .global func_02056264
        .arm
func_02056264:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov fp, #0x0
    mov r5, r0
    str fp, [sp, #0x18]
    ldr r4, [r5]
    mov r0, #0x800
    str r0, [sp, #0x8]
    add r9, r4, #0x1f0
    add r8, r4, #0x1e4
    mov sl, #0x1
    mov r0, #0x4
    str r0, [sp, #0xc]
    mov r6, #0xa
.L_234:
    mov r0, r5
    add r1, r4, #0x1f4
    bl func_0205aecc
    ldr r0, _LIT0
    str sl, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x1d4]
    mov r0, r5
    add r2, r4, #0x1f4
    add r3, sp, #0x18
    bl func_02057980
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sp, #0x18
    str r0, [sp]
    ldr r0, _LIT0
    add r2, r4, #0x1dc
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x1d4]
    mov r0, r5
    add r3, sp, #0x14
    bl func_02057b00
    cmp r0, #0x0
    beq .L_2d0
    cmp r0, #0x3
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2d0:
    ldr r0, [r4, #0x1dc]
    ldr r1, _LIT2
    bl func_020ab0c4
    movs r7, r0
    beq .L_494
.L_2e4:
    strb fp, [r7]
    ldr r1, _LIT3
    ldr r2, [r4, #0x1dc]
    mov r0, r5
    bl func_020604a4
    ldr r0, [r4, #0x1dc]
    sub r1, r7, r0
    str r1, [sp, #0x14]
    ldr r0, [r4, #0x1f0]
    cmp r1, r0
    ble .L_358
    cmp r1, #0x800
    ldrlt r1, [sp, #0x8]
    ldr r0, [r9]
    add r0, r0, r1
    str r0, [r9]
    ldr r1, [r4, #0x1f0]
    ldr r0, [r4, #0x1ec]
    add r1, r1, #0x1
    bl func_020453cc
    cmp r0, #0x0
    bne .L_354
    ldr r1, _LIT4
    mov r0, r5
    bl func_0205ffc0
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_354:
    str r0, [r4, #0x1ec]
.L_358:
    ldr r2, [sp, #0x14]
    ldr r0, [r4, #0x1ec]
    ldr r1, [r4, #0x1dc]
    add r2, r2, #0x1
    bl func_020a7368
    ldr r0, [r4, #0x1dc]
    add r1, r7, #0x7
    ldr r2, [r8]
    sub r0, r1, r0
    sub r0, r2, r0
    str r0, [r8]
    ldr r2, [r4, #0x1e4]
    ldr r0, [r4, #0x1dc]
    add r2, r2, #0x1
    bl func_020a7388
    ldr r7, [r4, #0x1ec]
    ldr r1, _LIT5
    mov r0, r7
    bl func_020ab0c4
    cmp r0, #0x0
    beq .L_404
    add r0, r0, #0x4
    bl func_020ace00
    mov r7, r0
    mov r0, r5
    add r1, sp, #0x10
    mov r2, r7
    bl func_0205bd0c
    cmp r0, #0x0
    bne .L_3e4
    ldr r1, _LIT6
    mov r2, r7
    mov r0, r5
    bl func_020604a4
    b .L_480
.L_3e4:
    mov r0, r5
    ldr r1, [sp, #0x10]
    ldr r2, [r4, #0x1ec]
    bl func_0205bc24
    cmp r0, #0x0
    beq .L_480
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_404:
    mov r1, r7
    mov r0, r5
    mov r2, sl
    bl func_020603cc
    cmp r0, #0x0
    addne sp, sp, #0x1c
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r7, [r4, #0x1ec]
    ldr r1, _LIT7
    ldr r2, [sp, #0xc]
    mov r0, r7
    bl func_020ab054
    cmp r0, #0x0
    bne .L_45c
    mov r1, r7
    mov r0, r5
    bl func_02056d1c
    cmp r0, #0x0
    beq .L_480
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_45c:
    ldr r1, _LIT8
    mov r0, r7
    mov r2, r6
    bl func_020ab054
    cmp r0, #0x0
    beq .L_480
    ldr r1, _LIT9
    mov r0, r5
    bl func_020604a4
.L_480:
    ldr r0, [r4, #0x1dc]
    ldr r1, _LIT2
    bl func_020ab0c4
    movs r7, r0
    bne .L_2e4
.L_494:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    beq .L_4d4
    ldr r2, _LIT10
    mov r3, #0x4
    mov r0, r5
    mov r1, #0x7
    str r3, [r4, #0x1d8]
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4d4:
    mov r0, r5
    bl func_0205bccc
    movs r7, r0
    beq .L_4ec
    mov r0, r6
    bl func_02055324
.L_4ec:
    cmp r7, #0x0
    bne .L_234
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ffe54
_LIT1: .word data_020ffe58
_LIT2: .word data_020ffe84
_LIT3: .word data_020ffe8c
_LIT4: .word data_020ffe98
_LIT5: .word data_020ffea8
_LIT6: .word data_020ffeb0
_LIT7: .word data_020ffed8
_LIT8: .word data_020ffee0
_LIT9: .word data_020ffee8
_LIT10: .word data_020fff18
