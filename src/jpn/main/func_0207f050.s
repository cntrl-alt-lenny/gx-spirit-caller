; func_0207f050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0810
        .extern data_021a0814
        .extern func_02094398
        .global func_0207f050
        .arm
func_0207f050:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r5, r3
    mov r3, #0x540
    mov r6, r2
    mov r7, r1
    mla r4, r5, r3, r4
    sub r1, r6, #0x1
    add r1, r7, r1
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    add lr, r4, r7, lsl #0x1
    add r2, r4, r3, lsl #0x1
    mov r8, r0
    cmp lr, r2
    mov ip, r7, lsl #0x1
    bhi .L_64
    ldr r0, _LIT1
.L_48:
    ldrh r1, [lr]
    cmp r1, r0
    movne r0, #0x0
    bne .L_68
    add lr, lr, #0x2
    cmp lr, r2
    bls .L_48
.L_64:
    mov r0, #0x1
.L_68:
    cmp r0, #0x0
    beq .L_a8
    ldr r0, _LIT2
    sub r2, r3, r7
    ldrh lr, [r0]
    add r1, r4, ip
    mov r2, r2, lsl #0x1
    add ip, lr, #0x1
    strh ip, [r0]
    strh lr, [r8, #0x10]
    strh r7, [r8, #0x4]
    strh r3, [r8, #0x6]
    strh r7, [r8, #0x8]
    ldrh r0, [r8, #0x10]
    bl func_02094398
    b .L_b0
.L_a8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_b0:
    mov r0, r6, lsl #0xe
    mov r1, r0, lsr #0x10
    mov r0, r7, lsl #0xe
    sub r1, r1, #0x1
    add r1, r1, r0, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r1, r0, lsr #0x10
    add r4, r4, #0x500
    mov ip, r2, lsr #0x10
    add r7, r4, r1, lsl #0x1
    add r6, r4, ip, lsl #0x1
    cmp r7, r6
    mov r3, r1, lsl #0x1
    bhi .L_108
    ldr r0, _LIT1
.L_ec:
    ldrh r2, [r7]
    cmp r2, r0
    movne r0, #0x0
    bne .L_10c
    add r7, r7, #0x2
    cmp r7, r6
    bls .L_ec
.L_108:
    mov r0, #0x1
.L_10c:
    cmp r0, #0x0
    beq .L_138
    strh r1, [r8, #0xa]
    strh ip, [r8, #0xc]
    strh r1, [r8, #0xe]
    ldrh r0, [r8, #0x10]
    sub r2, ip, r1
    add r1, r4, r3
    mov r2, r2, lsl #0x1
    bl func_02094398
    b .L_140
.L_138:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_140:
    mov r0, #0x1
    str r0, [r8, #0x14]
    str r5, [r8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021a0814
_LIT1: .word 0x0000ffff
_LIT2: .word data_021a0810
