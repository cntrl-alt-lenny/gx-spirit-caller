; func_0202a718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202abdc
        .extern func_0208c884
        .extern func_0208e29c
        .extern func_0208e318
        .global func_0202a718
        .arm
func_0202a718:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r0, [r4, #0xea]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_64c
    ldr r0, [r4, #0xd8]
    cmp r0, #0x1
    beq .L_434
    cmp r0, #0x2
    beq .L_460
    cmp r0, #0x3
    beq .L_5a0
    b .L_64c
.L_434:
    ldr r1, [r4, #0x68]
    ldr r0, _LIT0
    mov r1, r1, lsl #0xc
    mov r1, r1, asr #0x10
    bl func_0208c884
    ldr r1, [r4, #0x6c]
    ldr r0, _LIT1
    mov r1, r1, lsl #0xc
    mov r1, r1, asr #0x10
    bl func_0208c884
    b .L_64c
.L_460:
    ldrsh r5, [r4, #0xdc]
    ldr r0, [r4, #0x74]
    ldr r1, [r4, #0x78]
    ldr r2, [r4, #0x80]
    ldr r3, [r4, #0x84]
    cmp r5, #0x3
    mov r0, r0, asr #0x4
    mov r1, r1, asr #0x4
    mov r2, r2, asr #0x4
    mov r3, r3, asr #0x4
    addls pc, pc, r5, lsl #0x2
    b .L_55c
    b .L_4a0
    b .L_4d0
    b .L_500
    b .L_530
.L_4a0:
    mov r6, r0, lsl #0x8
    mov r5, r1, lsl #0x8
    and lr, r6, #0xff00
    and r6, r2, #0xff
    ldr ip, _LIT2
    orr lr, lr, r6
    and r6, r5, #0xff00
    and r5, r3, #0xff
    strh lr, [ip]
    orr r5, r6, r5
    strh r5, [ip, #0x4]
    b .L_55c
.L_4d0:
    mov r6, r0, lsl #0x8
    mov r5, r1, lsl #0x8
    and lr, r6, #0xff00
    and r6, r2, #0xff
    ldr ip, _LIT3
    orr lr, lr, r6
    and r6, r5, #0xff00
    and r5, r3, #0xff
    strh lr, [ip]
    orr r5, r6, r5
    strh r5, [ip, #0x4]
    b .L_55c
.L_500:
    mov r6, r0, lsl #0x8
    mov r5, r1, lsl #0x8
    and lr, r6, #0xff00
    and r6, r2, #0xff
    ldr ip, _LIT4
    orr lr, lr, r6
    and r6, r5, #0xff00
    and r5, r3, #0xff
    strh lr, [ip]
    orr r5, r6, r5
    strh r5, [ip, #0x4]
    b .L_55c
.L_530:
    mov r5, r0, lsl #0x8
    mov ip, r1, lsl #0x8
    and r6, r5, #0xff00
    and lr, r2, #0xff
    ldr r5, _LIT5
    orr r6, r6, lr
    and lr, ip, #0xff00
    and ip, r3, #0xff
    strh r6, [r5]
    orr ip, lr, ip
    strh ip, [r5, #0x4]
.L_55c:
    cmp r0, #0x0
    bgt .L_56c
    cmp r2, #0x100
    bge .L_578
.L_56c:
    cmp r0, r2
    cmplt r1, r3
    blt .L_588
.L_578:
    ldrh r0, [r4, #0xea]
    bic r0, r0, #0x2
    strh r0, [r4, #0xea]
    b .L_594
.L_588:
    ldrh r0, [r4, #0xea]
    orr r0, r0, #0x2
    strh r0, [r4, #0xea]
.L_594:
    mov r0, r4
    bl func_0202abdc
    b .L_64c
.L_5a0:
    ldrsh r0, [r4, #0xe2]
    ldr r3, [r4, #0x8c]
    ldr r2, [r4, #0x90]
    ldr r1, [r4, #0x94]
    cmp r0, #0x0
    mov r3, r3, asr #0x4
    mov lr, r2, asr #0x4
    mov ip, r1, asr #0x4
    ldrh r1, [r4, #0xe4]
    ldrh r2, [r4, #0xe6]
    beq .L_5d8
    cmp r0, #0x1
    beq .L_614
    b .L_64c
.L_5d8:
    ldrsh r0, [r4, #0xe8]
    cmp r0, #0x0
    beq .L_5f0
    cmp r0, #0x1
    beq .L_600
    b .L_64c
.L_5f0:
    ldr r0, _LIT6
    str lr, [sp]
    bl func_0208e318
    b .L_64c
.L_600:
    ldr r0, _LIT6
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_0208e29c
    b .L_64c
.L_614:
    ldrsh r0, [r4, #0xe8]
    cmp r0, #0x0
    beq .L_62c
    cmp r0, #0x1
    beq .L_63c
    b .L_64c
.L_62c:
    ldr r0, _LIT7
    str lr, [sp]
    bl func_0208e318
    b .L_64c
.L_63c:
    ldr r0, _LIT7
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_0208e29c
.L_64c:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0400006c
_LIT1: .word 0x0400106c
_LIT2: .word 0x04000040
_LIT3: .word 0x04000042
_LIT4: .word 0x04001040
_LIT5: .word 0x04001042
_LIT6: .word 0x04000050
_LIT7: .word 0x04001050
