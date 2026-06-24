; func_02014444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b58a8
        .extern data_02102b84
        .extern data_02104e6c
        .extern func_0200a250
        .extern func_02013980
        .extern func_02018a04
        .extern func_02018a30
        .extern func_02019198
        .extern func_02019630
        .extern func_0201a100
        .extern func_0201b6c8
        .extern func_0201b774
        .extern func_0201b7a0
        .extern func_0202adc8
        .extern func_0202aeec
        .global func_02014444
        .arm
func_02014444:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_854
    cmp r0, #0x2
    beq .L_8a4
    cmp r0, #0x3
    beq .L_97c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_854:
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_02019198
    cmp r0, #0x6
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT0
    mov r0, #0xd
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201b6c8
    mov r0, #0x13
    bl func_02018a04
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_8a4:
    bl func_02019630
    cmp r0, #0x72
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_95c
    ldr r0, _LIT1
    ldr r7, _LIT2
    ldr r6, [r0]
    ldmib r0, {r3, r8}
    umull r2, r1, r8, r6
    mla r1, r8, r3, r1
    ldr r8, [r0, #0xc]
    ldr r3, [r0, #0x10]
    mla r1, r8, r6, r1
    ldrb ip, [r7, #0x2]
    adds r2, r3, r2
    ldr r8, [r0, #0x14]
    ldrb lr, [r7, #0x1]
    ldrb r6, [r7]
    str r2, [r0]
    adc r1, r8, r1
    mov r3, #0x3
    ldr r7, _LIT3
    str r1, [r0, #0x4]
    ldr r7, [r7, #0x4]
    mov r2, #0x0
    umull r8, r9, r1, r3
    mla r9, r1, r2, r9
    mla r9, r2, r3, r9
    add r0, sp, #0x0
    strb lr, [sp, #0x1]
    strb ip, [sp, #0x2]
    strb r6, [sp]
    ldrb r6, [r0, r9]
    mov r7, r7, lsl #0x1d
    mov r0, r7, lsr #0x1d
    bl func_0202adc8
    mov r0, r6
    bl func_0201a100
    bl func_0202aeec
    ldr r0, [r4, #0x8e8]
    bic r0, r0, #0xff
    orr r0, r0, r6
    str r0, [r4, #0x8e8]
.L_95c:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_02018a30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_97c:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x3
    bl func_0200a250
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00070100
_LIT1: .word data_02102b84
_LIT2: .word data_020b58a8
_LIT3: .word data_02104e6c
_LIT4: .word 0x00070200
_LIT5: .word 0x00070300
