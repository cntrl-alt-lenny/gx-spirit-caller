; func_ov002_021d93bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_ov002_021b3d48
        .extern func_ov002_021d46ac
        .extern func_ov002_021de390
        .global func_ov002_021d93bc
        .arm
func_ov002_021d93bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r3
    mov r6, r2
    mov r8, r0
    mov r2, r5
    mov r7, r1
    bl func_ov002_021b3d48
    cmp r8, #0x0
    movne r1, #0x8000
    mov r4, r0
    moveq r1, #0x0
    mov r0, r6, lsl #0x10
    mov r2, r0, asr #0x10
    orr r1, r1, #0x3c
    mov r0, r1, lsl #0x10
    mov r1, r7, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, _LIT0
    cmp r5, r1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, r4, r6
    cmp r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r9, _LIT1
    mov r0, #0x14
    ldr r3, _LIT2
    and r4, r8, #0x1
    mul r2, r7, r0
    mla r0, r4, r9, r3
    ldrh r6, [r2, r0]
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r4, _LIT3
    ldr r5, _LIT4
    add r8, r1, #0xc
    mov sl, #0x0
    mov r7, #0x14
.L_ac:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x7
    bne .L_130
    ldrh r3, [r1]
    and r0, r3, #0xff
    and r1, r0, #0x1
    mla r2, r1, r9, r4
    mov r1, r3, asr #0x8
    and r1, r1, #0xff
    mla r3, r1, r7, r2
    ldr r2, [r3, #0x30]
    mov r2, r2, lsl #0x13
    cmp r8, r2, lsr #0x13
    bne .L_130
    ldr ip, [r3, #0x40]
    ldrh r3, [r3, #0x38]
    mov r2, ip, lsr #0x6
    mov lr, ip, lsr #0x2
    and r2, r2, #0x1
    orr ip, lr, ip, lsr #0x1
    mvn lr, r2
    and r2, ip, #0x1
    and r3, r3, lr
    mvn r2, r2
    tst r3, r2
    beq .L_130
    mov r2, sl
    mov r3, sl
    bl func_ov002_021de390
.L_130:
    cmp r6, #0x0
    bne .L_ac
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00001a90
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c6
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022d0570
