; func_0207ed94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102198
        .extern data_021a08f4
        .extern func_0208fdf0
        .extern func_0208fe58
        .extern func_02092904
        .global func_0207ed94
        .arm
func_0207ed94:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r0
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    beq .L_344
    ldr r5, [r7]
    ldr r1, _LIT0
    mov r0, #0x540
    mla r1, r5, r0, r1
    ldrh r2, [r7, #0x4]
    ldrh r0, [r7, #0x6]
    add r1, r1, #0x100
    add r4, r1, r2, lsl #0x3
    sub r0, r0, r2
    add r0, r0, #0x1
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x10
    mov r2, r2, lsl #0x13
    mov r0, r4
    mov r1, r6
    mov r7, r2, lsr #0x10
    bl func_02092904
    cmp r5, #0x0
    beq .L_31c
    cmp r5, #0x1
    beq .L_330
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_31c:
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_0208fe58
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_330:
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_0208fdf0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_344:
    ldr r0, [r7]
    ldr r2, _LIT0
    mov r1, #0x540
    mla r2, r0, r1, r2
    ldrh r5, [r7, #0x4]
    ldrh r1, [r7, #0x6]
    ldr r3, _LIT1
    add r4, r2, #0x100
    sub r1, r1, r5
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r2, r5, lsl #0x13
    add r6, r4, r5, lsl #0x3
    movs r5, r1, lsr #0x10
    mov r4, r2, lsr #0x10
    ldr r9, [r3, r0, lsl #0x2]
    mov sl, #0x0
    beq .L_3c4
    mov r8, #0x6
.L_390:
    mov r0, r6
    mov r1, r4
    mov r2, r8
    blx r9
    add r0, sl, #0x1
    add r2, r4, #0x8
    mov r1, r0, lsl #0x10
    mov r0, r2, lsl #0x10
    mov sl, r1, lsr #0x10
    cmp sl, r5
    mov r4, r0, lsr #0x10
    add r6, r6, #0x8
    bcc .L_390
.L_3c4:
    ldrh r2, [r7, #0xc]
    ldrh r1, [r7, #0xe]
    mov r3, #0x0
    add r0, r2, #0x1
    cmp r1, r0
    bgt .L_3e8
    ldrh r0, [r7, #0xa]
    cmp r0, r2
    movls r3, #0x1
.L_3e8:
    cmp r3, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r7]
    ldr r2, _LIT0
    mov r1, #0x540
    mla r2, r0, r1, r2
    ldrh r5, [r7, #0xa]
    add r4, r2, #0x100
    ldrh r1, [r7, #0xc]
    mov r2, r5, lsl #0x15
    ldr r3, _LIT1
    sub r1, r1, r5
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    add r9, r4, r5, lsl #0x5
    ldr r5, [r3, r0, lsl #0x2]
    movs r8, r1, lsr #0x10
    mov r7, r2, lsr #0x10
    mov r6, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r4, #0x2
.L_43c:
    mov r2, r4
    add r0, r9, #0x6
    add r1, r7, #0x6
    blx r5
    mov r2, r4
    add r0, r9, #0xe
    add r1, r7, #0xe
    blx r5
    mov r2, r4
    add r0, r9, #0x16
    add r1, r7, #0x16
    blx r5
    add r0, r9, #0x1e
    add r1, r7, #0x1e
    mov r2, r4
    blx r5
    add r0, r7, #0x20
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
    add r9, r9, #0x20
    add r0, r6, #0x1
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    cmp r6, r8
    bcc .L_43c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_021a08f4
_LIT1: .word data_02102198
