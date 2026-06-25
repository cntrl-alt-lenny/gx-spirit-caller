; func_02073368 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee4c
        .extern func_020735c4
        .extern func_02073750
        .extern func_02073c48
        .extern func_02073d6c
        .extern func_02073dc8
        .extern func_02094688
        .global func_02073368
        .arm
func_02073368:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldrh r5, [sp, #0x1c]
    ldr r4, [sp, #0x18]
    mov r8, r0
    mov r0, r5, asr #0x8
    orr ip, r0, r5, lsl #0x8
    mov r0, r4
    mov r7, r1
    mov r6, r2
    mov r5, r3
    strh ip, [r8, #-2]
    bl func_02073d6c
    cmp r0, #0x0
    bne .L_3d0
    mov r0, r4
    bl func_02073dc8
    movs r4, r0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    bl func_02073750
    cmp r0, #0x0
    bne .L_3b4
    mov r0, r4
    bl func_020735c4
.L_3b4:
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    sub r1, r8, #0xe
    mov r2, #0x6
    bl func_02094688
    b .L_400
.L_3d0:
    mov r0, #0x1
    strb r0, [r8, #-14]
    mov r1, #0x0
    mov r0, r4, lsr #0x10
    strb r1, [r8, #-13]
    mov r1, #0x5e
    strb r1, [r8, #-12]
    and r0, r0, #0x7f
    strb r0, [r8, #-11]
    mov r0, r4, lsr #0x8
    strb r0, [r8, #-10]
    strb r4, [r8, #-9]
.L_400:
    ldr r0, _LIT0
    sub r1, r8, #0x8
    mov r2, #0x6
    bl func_02094688
    mov r2, r6
    mov r3, r5
    sub r0, r8, #0xe
    add r1, r7, #0xe
    bl func_02073c48
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0219ee4c
