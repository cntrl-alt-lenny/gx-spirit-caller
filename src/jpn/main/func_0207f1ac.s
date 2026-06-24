; func_0207f1ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0810
        .extern data_021a0814
        .extern func_02094398
        .global func_0207f1ac
        .arm
func_0207f1ac:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r5, [sp, #0x1c]
    ldr r6, _LIT0
    mov r4, #0x540
    mla r4, r5, r4, r6
    mov lr, r1
    sub r1, r2, #0x1
    add r1, lr, r1
    mov r1, r1, lsl #0x10
    mov ip, r1, lsr #0x10
    add r7, r4, lr, lsl #0x1
    add r2, r4, ip, lsl #0x1
    mov r6, r0
    mov r5, r3
    cmp r7, r2
    mov r3, lr, lsl #0x1
    bhi .L_68
    ldr r0, _LIT1
.L_4c:
    ldrh r1, [r7]
    cmp r1, r0
    movne r0, #0x0
    bne .L_6c
    add r7, r7, #0x2
    cmp r7, r2
    bls .L_4c
.L_68:
    mov r0, #0x1
.L_6c:
    cmp r0, #0x0
    beq .L_ac
    ldr r0, _LIT2
    sub r2, ip, lr
    ldrh r7, [r0]
    add r1, r4, r3
    mov r2, r2, lsl #0x1
    add r3, r7, #0x1
    strh r3, [r0]
    strh r7, [r6, #0x10]
    strh lr, [r6, #0x4]
    strh ip, [r6, #0x6]
    strh lr, [r6, #0x8]
    ldrh r0, [r6, #0x10]
    bl func_02094398
    b .L_b8
.L_ac:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_b8:
    ldrh r0, [sp, #0x18]
    add r4, r4, #0x500
    cmp r0, #0x0
    bne .L_e4
    mov r0, #0x20
    strh r0, [r6, #0xa]
    mov r0, #0x0
    strh r0, [r6, #0xc]
    ldrh r0, [r6, #0xa]
    strh r0, [r6, #0xe]
    b .L_164
.L_e4:
    sub r0, r0, #0x1
    add r0, r5, r0
    mov r0, r0, lsl #0x10
    mov ip, r0, lsr #0x10
    add r7, r4, r5, lsl #0x1
    add r2, r4, ip, lsl #0x1
    cmp r7, r2
    mov r3, r5, lsl #0x1
    bhi .L_128
    ldr r0, _LIT1
.L_10c:
    ldrh r1, [r7]
    cmp r1, r0
    movne r0, #0x0
    bne .L_12c
    add r7, r7, #0x2
    cmp r7, r2
    bls .L_10c
.L_128:
    mov r0, #0x1
.L_12c:
    cmp r0, #0x0
    beq .L_158
    strh r5, [r6, #0xa]
    strh ip, [r6, #0xc]
    strh r5, [r6, #0xe]
    ldrh r0, [r6, #0x10]
    sub r2, ip, r5
    add r1, r4, r3
    mov r2, r2, lsl #0x1
    bl func_02094398
    b .L_164
.L_158:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_164:
    mov r1, #0x0
    ldr r0, [sp, #0x1c]
    str r1, [r6, #0x14]
    str r0, [r6]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a0814
_LIT1: .word 0x0000ffff
_LIT2: .word data_021a0810
