; func_0208c3a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c2e8c
        .extern func_0208bec0
        .global func_0208c3a8
        .arm
func_0208c3a8:
    stmdb sp!, {r4, lr}
    cmp r0, #0x0
    ble .L_9c
    cmp r1, #0x0
    ble .L_4c
    cmp r1, r0
    movgt r2, r0
    movgt r4, #0x0
    movgt r0, #0x1
    bgt .L_14c
    cmp r1, r0
    movlt r2, r1
    movlt r1, r0
    ldrlt r4, _LIT0
    movlt r0, #0x0
    blt .L_14c
    ldr r0, _LIT1
    ldmia sp!, {r4, lr}
    bx lr
.L_4c:
    cmp r1, #0x0
    bge .L_90
    rsb r1, r1, #0x0
    cmp r1, r0
    movlt r2, r1
    movlt r1, r0
    ldrlt r4, _LIT0
    movlt r0, #0x1
    blt .L_14c
    cmp r1, r0
    movgt r2, r0
    ldrgt r4, _LIT2
    movgt r0, #0x0
    bgt .L_14c
    ldr r0, _LIT3
    ldmia sp!, {r4, lr}
    bx lr
.L_90:
    ldr r0, _LIT0
    ldmia sp!, {r4, lr}
    bx lr
.L_9c:
    cmp r0, #0x0
    bge .L_138
    cmp r1, #0x0
    rsb r0, r0, #0x0
    bge .L_ec
    rsb r1, r1, #0x0
    cmp r1, r0
    movgt r2, r0
    ldrgt r4, _LIT4
    movgt r0, #0x1
    bgt .L_14c
    cmp r1, r0
    movlt r2, r1
    movlt r1, r0
    ldrlt r4, _LIT5
    movlt r0, #0x0
    blt .L_14c
    ldr r0, _LIT6
    ldmia sp!, {r4, lr}
    bx lr
.L_ec:
    cmp r1, #0x0
    ble .L_12c
    cmp r1, r0
    movlt r2, r1
    movlt r1, r0
    ldrlt r4, _LIT5
    movlt r0, #0x1
    blt .L_14c
    cmp r1, r0
    movgt r4, #0x0
    movgt r2, r0
    movgt r0, r4
    bgt .L_14c
    mvn r0, #0xc90
    ldmia sp!, {r4, lr}
    bx lr
.L_12c:
    ldr r0, _LIT5
    ldmia sp!, {r4, lr}
    bx lr
.L_138:
    cmp r1, #0x0
    movge r0, #0x0
    ldrlt r0, _LIT2
    ldmia sp!, {r4, lr}
    bx lr
.L_14c:
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r0, #0x0
    beq .L_190
    mov r0, r2
    bl func_0208bec0
    mov r1, r0, asr #0x5
    ldr r0, _LIT7
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    add r0, r4, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    ldmia sp!, {r4, lr}
    bx lr
.L_190:
    mov r0, r2
    bl func_0208bec0
    mov r1, r0, asr #0x5
    ldr r0, _LIT7
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    sub r0, r4, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x00001922
_LIT1: .word 0x00000c91
_LIT2: .word 0x00003244
_LIT3: .word 0x000025b3
_LIT4: .word 0xffffcdbc
_LIT5: .word 0xffffe6de
_LIT6: .word 0xffffda4d
_LIT7: .word data_020c2e8c
