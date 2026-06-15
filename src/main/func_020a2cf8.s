; func_020a2cf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9848
        .extern data_021a984c
        .extern data_021a9850
        .extern data_021a9880
        .extern data_021a9888
        .extern data_021a9890
        .extern func_0209448c
        .extern func_020944a4
        .extern func_020a078c
        .extern func_020a2c74
        .extern func_020a2f9c
        .global func_020a2cf8
        .arm
func_020a2cf8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r3, _LIT0
    str r0, [sp, #0x8]
    ldr r0, [r3, #0x4]
    ldrb r3, [r3, #0xe]
    ldrb r0, [r0, #0x4b4]
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    cmp r3, r0
    beq .L_ec0
    bl func_020a2f9c
.L_ec0:
    ldr r3, _LIT1
    ldr r1, _LIT0
    ldrb r2, [r3, #0x4]
    ldr r0, [r1, #0x4]
    ldrb r5, [r1, #0x11]
    bic r2, r2, #0x3
    orr r2, r2, #0x2
    strb r2, [r3, #0x4]
    ldrb r4, [r0, #0x4b3]
    ldrb r2, [r1, #0xe]
    ldrb r7, [r3, #0x4]
    strb r4, [r3, #0x5]
    strb r2, [r3, #0x6]
    ldr r4, [r0, #0x4b8]
    ldr r2, _LIT2
    str r4, [r3]
    ldrb r6, [r0, #0x4b5]
    add r4, r5, #0x1
    bic r7, r7, #0xfc
    and r6, r6, #0x3f
    orr r6, r7, r6, lsl #0x2
    strb r6, [r3, #0x4]
    strb r4, [r1, #0x11]
    strb r5, [r3, #0x7]
    ldrb r4, [r0, #0x358]
    add r1, r0, #0x300
    ldr r2, [r2]
    strb r4, [r3, #0xa]
    ldrh r4, [r1, #0x5a]
    cmp r2, #0x0
    strh r4, [r3, #0xc]
    ldrh r1, [r1, #0x5c]
    strh r1, [r3, #0xe]
    bne .L_f60
    ldr r1, _LIT3
    ldr r1, [r1]
    cmp r1, #0x0
    beq .L_f60
    ldr r0, [r0, #0x4b8]
    blx r1
.L_f60:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0x4]
    mov r3, #0x0
.L_f70:
    ldrb r0, [r2, #0x4a8]
    add r3, r3, #0x1
    cmp r3, #0x8
    strb r0, [r1, #0x68]
    add r2, r2, #0x1
    add r1, r1, #0x1
    blt .L_f70
    ldr r1, _LIT4
    mov r0, #0x0
    mov r2, #0x58
    bl func_0209448c
    ldr r0, _LIT0
    mov sl, #0x0
    ldr r1, [r0, #0x4]
    ldr r9, _LIT4
    add r0, r1, #0x400
    add r1, r1, #0x300
    ldrh r2, [r0, #0xb0]
    ldrh r0, [r1, #0x5a]
    mov r5, sl
    mov r8, sl
    eor r0, r2, r0
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
    mov fp, #0x16
    mov r4, #0x2
.L_fd8:
    mov r6, r4, lsl r5
    ands r0, r7, r6
    beq .L_102c
    ldr r0, _LIT0
    mov r1, r9
    ldr r2, [r0, #0x4]
    ldr r0, _LIT5
    add r0, r2, r0
    add r0, r0, r8
    mov r2, fp
    bl func_020944a4
    ldr r0, _LIT0
    add sl, sl, #0x1
    ldr r0, [r0, #0x4]
    add r9, r9, #0x16
    add r0, r0, #0x400
    ldrh r1, [r0, #0xb0]
    cmp sl, #0x4
    orr r1, r1, r6
    strh r1, [r0, #0xb0]
    beq .L_103c
.L_102c:
    add r5, r5, #0x1
    cmp r5, #0xf
    add r8, r8, #0x16
    blt .L_fd8
.L_103c:
    cmp sl, #0x4
    bcs .L_105c
    mov r0, #0x16
    mul r1, sl, r0
    ldr r2, _LIT4
    ldrb r0, [r2, r1]
    bic r0, r0, #0xf0
    strb r0, [r2, r1]
.L_105c:
    ldr r2, _LIT1
    mov r3, #0x0
    ldr r0, _LIT6
    mov r1, #0x68
    strh r3, [r2, #0x8]
    bl func_020a2c74
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r3, [r2, #0x4]
    strh r0, [r1, #0x8]
    add r0, r3, #0x400
    add r1, r3, #0x300
    ldrh r3, [r0, #0xb0]
    ldrh r0, [r1, #0x5a]
    ldr r1, _LIT1
    cmp r3, r0
    moveq r0, #0x1
    streqb r0, [r2, #0xc]
    ldr r0, [sp, #0x10]
    ldr r3, [sp, #0x8]
    orr r2, r0, #0x3
    ldr r0, [sp, #0xc]
    and r4, r2, #0xff
    str r0, [sp]
    mov r0, #0x0
    mov r2, #0x70
    str r4, [sp, #0x4]
    bl func_020a078c
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x1
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldr r0, _LIT3
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4b8]
    blx r1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a9850
_LIT1: .word data_021a9880
_LIT2: .word data_021a9848
_LIT3: .word data_021a984c
_LIT4: .word data_021a9890
_LIT5: .word 0x0000035e
_LIT6: .word data_021a9888
