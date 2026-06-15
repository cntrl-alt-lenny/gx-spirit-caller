; func_ov004_021dba08 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov004_0220b500
        .extern data_ov004_0221159c
        .extern data_ov004_022915a0
        .extern data_ov004_022915e8
        .extern func_0200197c
        .extern func_02001d68
        .extern func_0200592c
        .extern func_020062cc
        .extern func_02006314
        .extern func_02008888
        .extern func_0200a994
        .extern func_0200a9dc
        .extern func_0202adf8
        .extern func_0202c0c0
        .extern func_02045618
        .extern func_020458d8
        .extern func_0208c884
        .extern func_0208c8b0
        .extern func_0208c940
        .extern func_0208cfa4
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208e2f4
        .extern func_02093820
        .extern func_02094504
        .extern func_020945f4
        .extern func_ov004_021d8648
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .extern func_ov004_021e7e30_unk
        .global func_ov004_021dba08
        .arm
func_ov004_021dba08:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r1, #0x0
    bl func_020945f4
    mov r3, #0x10
    ldr r2, _LIT0
    ldr r0, _LIT2
    rsb r1, r3, #0x0
    str r3, [r2, #0x5c]
    bl func_0208c884
    ldr r1, _LIT0
    ldr r0, _LIT3
    ldr r1, [r1, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r1, _LIT4
    ldrh r0, [r1]
    orr r0, r0, #0x8000
    strh r0, [r1]
    bl func_0200592c
    ldr r1, _LIT5
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    ldr r4, _LIT6
    ldr r1, _LIT7
    ldr r2, [r4]
    mov r0, #0x4
    bic r2, r2, #0x1f00
    str r2, [r4]
    ldr r3, [r4]
    mov r2, #0x80000
    bic r3, r3, #0xe000
    str r3, [r4]
    bl func_0200197c
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT9
    bl func_0202adf8
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    mov r0, #0x100
    bl func_0208cfa4
    mov r0, #0x0
    bl func_0208c8b0
    mov r2, r4
    ldr r1, [r2]
    ldr r0, _LIT10
    orr r1, r1, #0x10000
    str r1, [r2]
    bl func_ov004_021d8648
    mov r1, #0x1c
    add r0, r4, #0x50
    sub r2, r1, #0x2c
    bl func_0208e2f4
    add r0, r4, #0x6c
    mov r1, #0x0
    bl func_0208c884
    mov r0, #0xe8
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT10
    mov r2, #0x1
    bl func_ov004_021d8798
    bl func_02008888
    ldr r0, _LIT10
    bl func_ov004_021d8cd0
    bl func_0200a9dc
    bl func_02006314
    bl func_02045618
    mov r4, #0x1
    mov r0, #0x40000
    mov r1, #0x4
    mov r2, #0x0
    mov r5, r4
    bl Task_PostLocked
    mov r6, r0
    mov r0, #0x2
    bl func_020458d8
    ldr r0, _LIT11
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_314
    cmp r0, #0x1
    beq .L_31c
    cmp r0, #0x2
    moveq r4, #0x0
    b .L_320
.L_314:
    mov r4, #0x10
    b .L_320
.L_31c:
    mov r4, #0x20
.L_320:
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_380
    b .L_354
    b .L_35c
    b .L_364
    b .L_36c
    b .L_374
    b .L_37c
.L_354:
    mov r5, #0x0
    b .L_380
.L_35c:
    mov r5, #0x1
    b .L_380
.L_364:
    mov r5, #0x3
    b .L_380
.L_36c:
    mov r5, #0x2
    b .L_380
.L_374:
    mov r5, #0x4
    b .L_380
.L_37c:
    mov r5, #0x5
.L_380:
    cmp r5, #0x0
    moveq r4, #0x10
    beq .L_394
    cmp r4, #0x10
    moveq r4, #0x0
.L_394:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov004_021e7e30_unk
    mov r0, r6
    bl Task_InvokeLocked
    bl func_020062cc
    bl func_0200a994
    bl func_02093820
    bl func_0208c940
    ldr r2, _LIT6
    mov r0, #0x1
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x0000609c
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
_LIT4: .word 0x04000304
_LIT5: .word 0x05000400
_LIT6: .word 0x04001000
_LIT7: .word data_ov004_0221159c
_LIT8: .word data_02104f4c
_LIT9: .word data_ov004_022915a0
_LIT10: .word data_ov004_022915e8
_LIT11: .word data_021040ac
