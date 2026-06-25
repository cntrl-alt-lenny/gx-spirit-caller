; func_0203b8ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2a4
        .extern func_0203b724
        .extern func_0203b830
        .extern func_0203c648
        .extern func_02092660
        .extern func_020926d0
        .extern func_02094410
        .global func_0203b8ac
        .arm
func_0203b8ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r8, #0x1
    cmp r0, #0x0
    moveq r8, #0x4
    subs r8, r8, #0x1
    addmi sp, sp, #0x8
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_20:
    ldr r0, _LIT0
    bl func_020926d0
    bl func_0203b830
    movs r7, r0
    beq .L_108
    ldrb r1, [r7, #0xc1]
    ldr r4, [r7, #0x78]
    cmp r1, #0x0
    bne .L_54
    bl func_0203c648
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r7, #0xc1]
.L_54:
    ldrh r2, [r7, #0xb0]
    tst r2, #0x8000
    beq .L_108
    ldr r0, _LIT1
    tst r2, r0
    bne .L_108
    ldrsh r1, [r4, #0x4]
    ldrsh r0, [r4, #0x24]
    sub r0, r1, r0
    cmp r0, #0x7
    bge .L_108
    cmp r0, #0x0
    orrlt r0, r2, #0x10
    strlth r0, [r7, #0xb0]
    blt .L_108
    tst r2, #0x3
    mov r6, r1, lsl #0x1d
    beq .L_dc
    mov r9, #0x0
    mov sl, r9
    mov r5, r9
    mov r4, #0x200
.L_ac:
    ldr r1, [r7, #0x80]
    mov r0, r5
    add r1, r1, sl
    mov r2, r4
    add r1, r1, r6, lsr #0x14
    bl func_02094410
    ldrh r0, [r7, #0xb8]
    add r9, r9, #0x1
    add sl, sl, #0x1000
    cmp r9, r0
    blt .L_ac
    b .L_108
.L_dc:
    ldr r0, [r7, #0x80]
    add r1, sp, #0x0
    add r0, r0, r6, lsr #0x14
    str r0, [sp]
    ldr r2, [r7, #0x80]
    mov r0, r7
    add r2, r2, #0x1000
    add r3, r2, r6, lsr #0x14
    mov r2, #0x0
    str r3, [sp, #0x4]
    bl func_0203b724
.L_108:
    ldr r0, _LIT0
    bl func_02092660
    subs r8, r8, #0x1
    bpl .L_20
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219b2a4
_LIT1: .word 0x00002010
