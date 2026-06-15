; func_0204a2ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff974
        .extern data_020ff980
        .extern func_020459f0
        .extern func_020498f0
        .extern func_02068a20
        .extern func_02068b1c
        .extern func_02068ca8
        .extern func_02068cb8
        .extern func_02068cc8
        .extern func_02068d24
        .global func_0204a2ec
        .arm
func_0204a2ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r0, [sp]
    mov r8, r1
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068cb8
    cmp r0, #0x0
    ble .L_450
    mov r0, #0x80
    mov r4, #0x1
    mov r5, r8
    str r0, [sp, #0x8]
    mov fp, #0x100
.L_308:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    mov r1, r8
    bl func_02068cc8
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_3a4
    ldr r1, _LIT0
    mov r0, r6
    mov r2, r5
    bl func_02068a20
    mov r9, r0
    mov sl, r5
    mov r7, r4
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_39c
.L_358:
    bl func_020498f0
    add r0, r0, r7, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r9, r0
    bne .L_388
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_02068d24
    mov sl, r4
    sub r8, r8, #0x1
    b .L_39c
.L_388:
    add r7, r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r7, r0
    ble .L_358
.L_39c:
    cmp sl, #0x0
    bne .L_438
.L_3a4:
    bl func_020498f0
    ldr r0, [r0, #0x474]
    cmp r0, #0x0
    beq .L_420
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    ldr r1, [r0, #0x478]
    ldr r2, [r7, #0x474]
    mov r0, r8
    blx r2
    mov r7, r0
    cmp r7, #0x0
    ble .L_404
    ldr r0, _LIT1
    cmp r7, r0
    movgt r7, r0
    mov r0, fp
    bl func_020459f0
    orr r2, r0, r7, lsl #0x8
    ldr r1, _LIT2
    mov r0, r6
    bl func_02068b1c
    b .L_438
.L_404:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_02068d24
    str r4, [sp, #0x4]
    sub r8, r8, #0x1
    b .L_438
.L_420:
    ldr r0, [sp, #0x8]
    bl func_020459f0
    mov r2, r0
    ldr r1, _LIT2
    mov r0, r6
    bl func_02068b1c
.L_438:
    add r8, r8, #0x1
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068cb8
    cmp r8, r0
    blt .L_308
.L_450:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_488
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068cb8
    cmp r0, #0x0
    beq .L_488
    bl func_020498f0
    mov r1, #0x0
    ldr r0, [r0, #0xe4]
    ldr r2, _LIT2
    mov r3, r1
    bl func_02068ca8
.L_488:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_4b0
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068cb8
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4b0:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ff980
_LIT1: .word 0x007fffff
_LIT2: .word data_020ff974
