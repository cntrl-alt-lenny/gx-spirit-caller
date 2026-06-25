; func_020561f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffd74
        .extern data_020ffd78
        .extern data_020ffda4
        .extern data_020ffdac
        .extern data_020ffdb8
        .extern data_020ffdc8
        .extern data_020ffdd0
        .extern data_020ffdf8
        .extern data_020ffe00
        .extern data_020ffe08
        .extern data_020ffe38
        .extern func_0204537c
        .extern func_020552b0
        .extern func_02056ca8
        .extern func_0205790c
        .extern func_02057a8c
        .extern func_02058560
        .extern func_0205ae58
        .extern func_0205bbb0
        .extern func_0205bc58
        .extern func_0205bc98
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_02060358
        .extern func_02060430
        .extern func_020a7274
        .extern func_020a7294
        .extern func_020aaf60
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_020561f0
        .arm
func_020561f0:
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
.L_38:
    mov r0, r5
    add r1, r4, #0x1f4
    bl func_0205ae58
    ldr r0, _LIT0
    str sl, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x1d4]
    mov r0, r5
    add r2, r4, #0x1f4
    add r3, sp, #0x18
    bl func_0205790c
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
    bl func_02057a8c
    cmp r0, #0x0
    beq .L_d4
    cmp r0, #0x3
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x1c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    ldr r0, [r4, #0x1dc]
    ldr r1, _LIT2
    bl func_020aafd0
    movs r7, r0
    beq .L_298
.L_e8:
    strb fp, [r7]
    ldr r1, _LIT3
    ldr r2, [r4, #0x1dc]
    mov r0, r5
    bl func_02060430
    ldr r0, [r4, #0x1dc]
    sub r1, r7, r0
    str r1, [sp, #0x14]
    ldr r0, [r4, #0x1f0]
    cmp r1, r0
    ble .L_15c
    cmp r1, #0x800
    ldrlt r1, [sp, #0x8]
    ldr r0, [r9]
    add r0, r0, r1
    str r0, [r9]
    ldr r1, [r4, #0x1f0]
    ldr r0, [r4, #0x1ec]
    add r1, r1, #0x1
    bl func_0204537c
    cmp r0, #0x0
    bne .L_158
    ldr r1, _LIT4
    mov r0, r5
    bl func_0205ff4c
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_158:
    str r0, [r4, #0x1ec]
.L_15c:
    ldr r2, [sp, #0x14]
    ldr r0, [r4, #0x1ec]
    ldr r1, [r4, #0x1dc]
    add r2, r2, #0x1
    bl func_020a7274
    ldr r0, [r4, #0x1dc]
    add r1, r7, #0x7
    ldr r2, [r8]
    sub r0, r1, r0
    sub r0, r2, r0
    str r0, [r8]
    ldr r2, [r4, #0x1e4]
    ldr r0, [r4, #0x1dc]
    add r2, r2, #0x1
    bl func_020a7294
    ldr r7, [r4, #0x1ec]
    ldr r1, _LIT5
    mov r0, r7
    bl func_020aafd0
    cmp r0, #0x0
    beq .L_208
    add r0, r0, #0x4
    bl func_020acd0c
    mov r7, r0
    mov r0, r5
    add r1, sp, #0x10
    mov r2, r7
    bl func_0205bc98
    cmp r0, #0x0
    bne .L_1e8
    ldr r1, _LIT6
    mov r2, r7
    mov r0, r5
    bl func_02060430
    b .L_284
.L_1e8:
    mov r0, r5
    ldr r1, [sp, #0x10]
    ldr r2, [r4, #0x1ec]
    bl func_0205bbb0
    cmp r0, #0x0
    beq .L_284
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_208:
    mov r1, r7
    mov r0, r5
    mov r2, sl
    bl func_02060358
    cmp r0, #0x0
    addne sp, sp, #0x1c
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r7, [r4, #0x1ec]
    ldr r1, _LIT7
    ldr r2, [sp, #0xc]
    mov r0, r7
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_260
    mov r1, r7
    mov r0, r5
    bl func_02056ca8
    cmp r0, #0x0
    beq .L_284
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_260:
    ldr r1, _LIT8
    mov r0, r7
    mov r2, r6
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_284
    ldr r1, _LIT9
    mov r0, r5
    bl func_02060430
.L_284:
    ldr r0, [r4, #0x1dc]
    ldr r1, _LIT2
    bl func_020aafd0
    movs r7, r0
    bne .L_e8
.L_298:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    beq .L_2d8
    ldr r2, _LIT10
    mov r3, #0x4
    mov r0, r5
    mov r1, #0x7
    str r3, [r4, #0x1d8]
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2d8:
    mov r0, r5
    bl func_0205bc58
    movs r7, r0
    beq .L_2f0
    mov r0, r6
    bl func_020552b0
.L_2f0:
    cmp r7, #0x0
    bne .L_38
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ffd74
_LIT1: .word data_020ffd78
_LIT2: .word data_020ffda4
_LIT3: .word data_020ffdac
_LIT4: .word data_020ffdb8
_LIT5: .word data_020ffdc8
_LIT6: .word data_020ffdd0
_LIT7: .word data_020ffdf8
_LIT8: .word data_020ffe00
_LIT9: .word data_020ffe08
_LIT10: .word data_020ffe38
