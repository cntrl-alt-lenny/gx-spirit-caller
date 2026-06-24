; func_02047b94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219db94
        .extern data_0219db98
        .extern data_0219db9c
        .extern func_020404dc
        .extern func_0204543c
        .extern func_0204545c
        .extern func_0204547c
        .extern func_0204591c
        .extern func_0205311c
        .extern func_0205312c
        .extern func_0205314c
        .extern func_020531bc
        .extern func_02053308
        .extern func_02053654
        .extern func_02092fc8
        .extern func_02094500
        .extern func_02094688
        .extern func_020aad04
        .global func_02047b94
        .arm
func_02047b94:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    mov r5, r0
    mov r4, r1
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x48
    bl func_02094500
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    str r5, [r2]
    str r4, [r1]
    ldr r0, [r0, #0x1c]
    bl func_0205311c
    cmp r0, #0x0
    beq .L_284
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x1c]
    add r2, r1, #0x248
    ldr r1, [r0, #0x24]
    add r0, r0, #0x10
    bl func_02053308
    b .L_338
.L_284:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x3c
    bl func_0205312c
    cmp r0, #0x0
    bne .L_2ec
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x1c]
    add r0, r0, #0x4
    bl func_0205314c
    cmp r0, #0x0
    beq .L_2d8
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x1c]
    add r3, r1, #0x3c
    add r0, r0, #0x4
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    b .L_320
.L_2d8:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x3c
    bl func_020531bc
    b .L_320
.L_2ec:
    bl func_02092fc8
    ldr r2, _LIT3
    ldr r3, _LIT4
    umull ip, r4, r0, r2
    mla r4, r0, r3, r4
    ldr r3, _LIT0
    ldr r0, _LIT5
    mla r4, r1, r2, r4
    adds r0, ip, r0
    ldr r3, [r3]
    adc r1, r4, #0x0
    add r0, r3, #0x3c
    bl func_02053654
.L_320:
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0xc]
    add r0, r2, #0x3c
    add r2, r2, #0x248
    bl func_02053308
.L_338:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    bl func_0204591c
    ldr r1, _LIT0
    mov r2, r0, lsl #0x1
    ldr r1, [r1]
    add r2, r2, #0x2
    ldr r0, [r1, #0x10]
    add r1, sp, #0x0
    bl func_02094688
    ldr r0, _LIT0
    ldr r1, _LIT6
    ldr r2, [r0]
    add r0, sp, #0x34
    add r1, r2, r1
    bl func_020aad04
    ldr r4, _LIT7
    ldr r3, _LIT8
    ldr r1, _LIT9
    mov r0, #0x0
    mov r2, #0x4
    str r4, [sp, #0x40]
    str r3, [sp, #0x44]
    bl func_0204545c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    str r4, [r0, #0x24]
    bl func_02092fc8
    ldr r2, _LIT0
    ldr r2, [r2]
    str r0, [r2, #0x28]
    str r1, [r2, #0x2c]
    mov r1, r4
    add r0, sp, #0x0
    bl func_020404dc
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219db98
_LIT1: .word data_0219db9c
_LIT2: .word data_0219db94
_LIT3: .word 0x6c078965
_LIT4: .word 0x5d588b65
_LIT5: .word 0x00269ec3
_LIT6: .word 0x00000251
_LIT7: .word func_0204547c
_LIT8: .word func_0204543c
_LIT9: .word 0x00001c10
