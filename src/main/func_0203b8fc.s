; func_0203b8fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b384
        .extern func_0203b774
        .extern func_0203b880
        .extern func_0203c698
        .extern func_02092748
        .extern func_020927b8
        .extern func_02094504
        .global func_0203b8fc
        .arm
func_0203b8fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r8, #0x1
    cmp r0, #0x0
    moveq r8, #0x4
    subs r8, r8, #0x1
    addmi sp, sp, #0x8
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9c4:
    ldr r0, _LIT0
    bl func_020927b8
    bl func_0203b880
    movs r7, r0
    beq .L_aac
    ldrb r1, [r7, #0xc1]
    ldr r4, [r7, #0x78]
    cmp r1, #0x0
    bne .L_9f8
    bl func_0203c698
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r7, #0xc1]
.L_9f8:
    ldrh r2, [r7, #0xb0]
    tst r2, #0x8000
    beq .L_aac
    ldr r0, _LIT1
    tst r2, r0
    bne .L_aac
    ldrsh r1, [r4, #0x4]
    ldrsh r0, [r4, #0x24]
    sub r0, r1, r0
    cmp r0, #0x7
    bge .L_aac
    cmp r0, #0x0
    orrlt r0, r2, #0x10
    strlth r0, [r7, #0xb0]
    blt .L_aac
    tst r2, #0x3
    mov r6, r1, lsl #0x1d
    beq .L_a80
    mov r9, #0x0
    mov sl, r9
    mov r5, r9
    mov r4, #0x200
.L_a50:
    ldr r1, [r7, #0x80]
    mov r0, r5
    add r1, r1, sl
    mov r2, r4
    add r1, r1, r6, lsr #0x14
    bl func_02094504
    ldrh r0, [r7, #0xb8]
    add r9, r9, #0x1
    add sl, sl, #0x1000
    cmp r9, r0
    blt .L_a50
    b .L_aac
.L_a80:
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
    bl func_0203b774
.L_aac:
    ldr r0, _LIT0
    bl func_02092748
    subs r8, r8, #0x1
    bpl .L_9c4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219b384
_LIT1: .word 0x00002010
