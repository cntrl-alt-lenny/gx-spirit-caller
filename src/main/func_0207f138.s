; func_0207f138 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a08f0
        .extern data_021a08f4
        .extern func_0209448c
        .global func_0207f138
        .arm
func_0207f138:
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
    bhi .L_6b8
    ldr r0, _LIT1
.L_69c:
    ldrh r1, [lr]
    cmp r1, r0
    movne r0, #0x0
    bne .L_6bc
    add lr, lr, #0x2
    cmp lr, r2
    bls .L_69c
.L_6b8:
    mov r0, #0x1
.L_6bc:
    cmp r0, #0x0
    beq .L_6fc
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
    bl func_0209448c
    b .L_704
.L_6fc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_704:
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
    bhi .L_75c
    ldr r0, _LIT1
.L_740:
    ldrh r2, [r7]
    cmp r2, r0
    movne r0, #0x0
    bne .L_760
    add r7, r7, #0x2
    cmp r7, r6
    bls .L_740
.L_75c:
    mov r0, #0x1
.L_760:
    cmp r0, #0x0
    beq .L_78c
    strh r1, [r8, #0xa]
    strh ip, [r8, #0xc]
    strh r1, [r8, #0xe]
    ldrh r0, [r8, #0x10]
    sub r2, ip, r1
    add r1, r4, r3
    mov r2, r2, lsl #0x1
    bl func_0209448c
    b .L_794
.L_78c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_794:
    mov r0, #0x1
    str r0, [r8, #0x14]
    str r5, [r8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021a08f4
_LIT1: .word 0x0000ffff
_LIT2: .word data_021a08f0
