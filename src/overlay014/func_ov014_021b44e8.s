; func_ov014_021b44e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_ov014_0223515c
        .extern func_02001d0c
        .extern func_02005088
        .extern func_020054a4
        .extern func_0202c0c0
        .extern func_0208df40
        .extern func_0208e1ac
        .extern func_0208e200
        .extern func_02094504
        .global func_ov014_021b44e8
        .arm
func_ov014_021b44e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r1, _LIT0
    str r0, [sp, #0x8]
    mov r0, #0x0
    mov r2, #0x18
    bl func_02094504
    bl func_0208e200
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0208e1ac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0208df40
    mov r5, r0
    mov r0, #0x0
    add r1, r5, #0x2940
    mov r2, #0x1c00
    bl func_02094504
    ldr r0, _LIT1
    mov r1, #0x1c
    mov r2, #0x8
    bl func_02001d0c
    ldr r0, _LIT2
    bl func_0202c0c0
    mov r3, #0x2
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    add r2, r5, #0x2940
    bl func_02005088
    ldr r1, _LIT1
    mov r0, #0x1d
    ldr r1, [r1, #0xc]
    add r2, r1, #0x14
    ldr r1, [sp, #0x8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    bl func_0202c0c0
    mov r4, r0
    mov r0, #0x1d
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0x70
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    ldr r0, [sp, #0x8]
    mov r1, r4
    ldr r2, [r0, #0xc]
    mov r0, #0xc
    str r2, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    add r2, r5, #0x2940
    bl func_02005088
    mov r0, #0x1e
    bl func_0202c0c0
    mov r4, r0
    mov r0, #0x1e
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r1, r0, #0x70
    ldr r0, [sp, #0x8]
    ldr r2, [r0, #0xc]
    add r0, r1, r1, lsr #0x1f
    mov r3, r0, asr #0x1
    str r2, [sp]
    mov r2, #0xc
    str r2, [sp, #0x4]
    ldr r0, _LIT1
    mov r1, r4
    add r2, r5, #0x2940
    add r3, r3, #0x70
    bl func_02005088
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0xc]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0xc]
    bl func_0208e200
    ldr r1, [sp, #0x8]
    add r5, r0, #0x44
    ldr r1, [r1, #0xc]
    mov r6, #0x0
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    mov r4, r0, asr #0x3
    adds r0, r2, r1, ror #0x1d
    addne r4, r4, #0x1
    ldr r2, _LIT3
    cmp r4, #0x0
    ble .L_1d4
    mov r3, r6
.L_19c:
    mov r7, r3
.L_1a0:
    add r0, r2, #0x1
    mov r1, r7, lsl #0x1
    orr r2, r2, #0x3000
    mov r0, r0, lsl #0x10
    add r7, r7, #0x1
    strh r2, [r5, r1]
    cmp r7, #0x1c
    mov r2, r0, lsr #0x10
    blt .L_1a0
    add r6, r6, #0x1
    cmp r6, r4
    add r5, r5, #0x40
    blt .L_19c
.L_1d4:
    bl func_0208e1ac
    add r1, r4, #0x2
    str r1, [sp, #0xc]
    cmp r1, #0x0
    add sl, r0, #0x2
    mov r8, #0x0
    ble .L_2a8
    ldr r2, _LIT4
    add r6, r4, #0x1
    sub r3, r2, #0x6
    sub ip, r2, #0x2
    sub lr, r2, #0x5
    sub r4, r2, #0x1
    sub r5, r2, #0x4
    mov fp, #0x148
    mov r7, #0x140
.L_214:
    mov r9, #0x0
.L_218:
    cmp r9, #0x0
    beq .L_22c
    cmp r9, #0x1d
    beq .L_248
    b .L_264
.L_22c:
    cmp r8, #0x0
    moveq r0, r7
    beq .L_27c
    cmp r8, r6
    movlt r0, r5
    movge r0, r4
    b .L_27c
.L_248:
    cmp r8, #0x0
    moveq r0, lr
    beq .L_27c
    cmp r8, r6
    movlt r0, ip
    movge r0, fp
    b .L_27c
.L_264:
    cmp r8, #0x0
    moveq r0, r3
    beq .L_27c
    cmp r8, r6
    movlt r0, #0x144
    movge r0, r2
.L_27c:
    orr r1, r0, #0x2000
    mov r0, r9, lsl #0x1
    strh r1, [sl, r0]
    add r9, r9, #0x1
    cmp r9, #0x1e
    blt .L_218
    ldr r0, [sp, #0xc]
    add r8, r8, #0x1
    add sl, sl, #0x40
    cmp r8, r0
    blt .L_214
.L_2a8:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    ldr r0, [r0, #0xc]
    ldr r3, _LIT6
    add r2, r0, #0x10
    ldr r0, [sp, #0x8]
    str r2, [r0, #0xc]
    and r0, r1, r2, lsl #0x10
    str r0, [r3]
    ldr r0, [sp, #0x8]
    sub r2, r3, #0x10
    ldr r0, [r0, #0xc]
    and r0, r1, r0, lsl #0x10
    str r0, [r3, #0x4]
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov014_0223515c
_LIT1: .word data_02102c90
_LIT2: .word 0x000006a8
_LIT3: .word 0x0000014a
_LIT4: .word 0x00000147
_LIT5: .word 0x01ff0000
_LIT6: .word 0x04001010
