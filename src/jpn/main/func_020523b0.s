; func_020523b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e30c
        .extern func_02046964
        .extern func_020469f0
        .extern func_02046a58
        .extern func_02051ea8
        .extern func_02052298
        .extern func_020522dc
        .extern func_020522f8
        .extern func_02092fc8
        .extern func_020b3714
        .global func_020523b0
        .arm
func_020523b0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sp, #0x8
    bl func_020469f0
    mov r9, r0
    cmp r9, #0x0
    mov r8, #0x0
    addle sp, sp, #0xc
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT0
    str r8, [sp]
    str r8, [sp, #0x4]
    mov fp, #0x1
.L_48:
    ldr r0, [sp, #0x8]
    ldrb r7, [r0, r8]
    mov r0, r7
    bl func_02046964
    cmp r0, #0x0
    beq .L_e0
    mov r0, r7
    bl func_020522f8
    ldr r1, [r4]
    mov r6, r0
    ldr r0, [r1, #0x608]
    cmp r0, #0x0
    beq .L_e0
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_e0
    bl func_02092fc8
    mov sl, r1
    ldr r2, [r6, #0x24]
    mov r5, r0
    subs r2, r5, r2
    ldr r1, [r6, #0x28]
    mov r0, r2, lsl #0x6
    sbc r1, sl, r1
    mov r1, r1, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    ldr r2, _LIT1
    ldr r3, [sp]
    bl func_020b3714
    ldr r1, [r6, #0x2c]
    cmp r0, r1
    bls .L_e0
    ldr r1, [r4]
    mov r0, r7
    ldr r1, [r1, #0x608]
    blx r1
    str r5, [r6, #0x24]
    str sl, [r6, #0x28]
.L_e0:
    bl func_02046a58
    cmp r7, r0
    beq .L_19c
    mov r0, r7
    bl func_020522dc
    cmp r0, #0x1
    bne .L_19c
    mov r0, r7
    bl func_020522f8
    mov r5, r0
    ldr r0, [r4]
    ldr r2, [r5, #0x14]
    add r0, r0, #0x600
    ldr r1, [r5, #0xc]
    ldrh r6, [r0, #0x10]
    sub r0, r2, r1
    cmp r0, r6
    movle r6, r0
    mov r0, r7
    bl func_02051ea8
    cmp r0, r6
    blt .L_19c
    ldr r3, [r5]
    ldr r1, [r5, #0xc]
    mov r0, r7
    mov r2, r6
    add r1, r3, r1
    mov r3, fp
    bl func_02052298
    ldr r0, [r5, #0xc]
    add r0, r0, r6
    str r0, [r5, #0xc]
    ldr r0, [r5, #0x14]
    ldr r1, [r5, #0xc]
    cmp r1, r0
    bne .L_19c
    ldr r1, [sp, #0x4]
    strb r1, [r5, #0x1c]
    str r1, [r5]
    str r1, [r5, #0xc]
    str r1, [r5, #0x14]
    ldr r1, [r4]
    ldr r2, [r1, #0x600]
    cmp r2, #0x0
    beq .L_19c
    mov r1, r7
    blx r2
.L_19c:
    add r8, r8, #0x1
    cmp r8, r9
    blt .L_48
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219e30c
_LIT1: .word 0x000082ea
