; func_ov002_022745f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd310
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02271524
        .extern func_ov002_02290500
        .extern func_ov002_0229ade0
        .extern func_ov002_0229cf10
        .global func_ov002_022745f0
        .arm
func_ov002_022745f0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    ldr r2, [r1, #0x18]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_264
    b .L_40
    b .L_54
    b .L_d4
    b .L_158
    b .L_ec
    b .L_158
    b .L_248
.L_40:
    add r0, r0, #0x1
    bic r2, r2, #0xff
    and r0, r0, #0xff
    orr r0, r2, r0
    str r0, [r1, #0x18]
.L_54:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_84
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_9c
.L_84:
    mov r1, #0x2
    add r0, sp, #0x0
    mov r2, r1
    bl func_ov002_0229cf10
    add r0, sp, #0x0
    bl func_ov002_021ae484
.L_9c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, _LIT3
    strb r0, [r1, #0x8]
    ldr r2, [r3]
    add sp, sp, #0x100
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_d4:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x100
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_ec:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_120
    mov r1, r2, lsl #0x9
    ldr r2, _LIT4
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_128
.L_120:
    ldr r0, _LIT4
    bl func_ov002_022592ec
.L_128:
    ldr r3, _LIT3
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_158:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_214
    ldr r0, _LIT2
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT6
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    add r5, r5, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r2, r5
    mov r0, #0x28
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    and r3, r4, #0xff
    ldrb ip, [r0, #0x8]
    and r2, r5, #0xff
    orr r2, r3, r2, lsl #0x8
    add r4, ip, #0x1
    strb r4, [r0, #0x8]
    ldr r1, _LIT7
    mov r0, ip, lsl #0x1
    strh r2, [r1, r0]
    ldr r3, _LIT3
    add sp, sp, #0x100
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_214:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229ade0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x1
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_248:
    ldr r2, [r1]
    add sp, sp, #0x100
    mov r2, r2, lsl #0x9
    mov r2, r2, lsr #0x11
    strh r2, [r1, #0x6]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_264:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd318
_LIT4: .word func_ov002_02271524
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x00000868
_LIT7: .word data_ov002_022cd310
