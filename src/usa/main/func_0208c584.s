; func_0208c584 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c2f90
        .extern func_0208bec0
        .global func_0208c584
        .arm
func_0208c584:
    stmdb sp!, {r4, lr}
    cmp r0, #0x0
    ble .L_278
    cmp r1, #0x0
    ble .L_228
    cmp r1, r0
    movgt r3, r0
    movgt r4, #0x0
    movgt r0, #0x1
    bgt .L_33c
    cmp r1, r0
    movlt r3, r1
    movlt r1, r0
    movlt r4, #0x4000
    movlt r0, #0x0
    blt .L_33c
    mov r0, #0x2000
    ldmia sp!, {r4, lr}
    bx lr
.L_228:
    cmp r1, #0x0
    bge .L_26c
    rsb r1, r1, #0x0
    cmp r1, r0
    movlt r3, r1
    movlt r1, r0
    movlt r4, #0x4000
    movlt r0, #0x1
    blt .L_33c
    cmp r1, r0
    movgt r3, r0
    movgt r4, #0x8000
    movgt r0, #0x0
    bgt .L_33c
    mov r0, #0x6000
    ldmia sp!, {r4, lr}
    bx lr
.L_26c:
    mov r0, #0x4000
    ldmia sp!, {r4, lr}
    bx lr
.L_278:
    cmp r0, #0x0
    bge .L_328
    cmp r1, #0x0
    rsb r2, r0, #0x0
    bge .L_2d4
    rsb r1, r1, #0x0
    cmp r1, r2
    movgt r0, #0x8000
    rsbgt r4, r0, #0x0
    movgt r3, r2
    movgt r0, #0x1
    bgt .L_33c
    cmp r1, r2
    bge .L_2c8
    mov r0, #0x4000
    mov r3, r1
    mov r1, r2
    rsb r4, r0, #0x0
    mov r0, #0x0
    b .L_33c
.L_2c8:
    mov r0, #0xa000
    ldmia sp!, {r4, lr}
    bx lr
.L_2d4:
    cmp r1, #0x0
    ble .L_31c
    cmp r1, r2
    bge .L_2fc
    mov r0, #0x4000
    mov r3, r1
    mov r1, r2
    rsb r4, r0, #0x0
    mov r0, #0x1
    b .L_33c
.L_2fc:
    cmp r1, r2
    movgt r4, #0x0
    movgt r3, r2
    movgt r0, r4
    bgt .L_33c
    mov r0, #0xe000
    ldmia sp!, {r4, lr}
    bx lr
.L_31c:
    mov r0, #0xc000
    ldmia sp!, {r4, lr}
    bx lr
.L_328:
    cmp r1, #0x0
    movge r0, #0x0
    movlt r0, #0x8000
    ldmia sp!, {r4, lr}
    bx lr
.L_33c:
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    cmp r0, #0x0
    beq .L_380
    mov r0, r3
    bl func_0208bec0
    mov r1, r0, asr #0x5
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    add r0, r4, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, lr}
    bx lr
.L_380:
    mov r0, r3
    bl func_0208bec0
    mov r1, r0, asr #0x5
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    sub r0, r4, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_020c2f90
