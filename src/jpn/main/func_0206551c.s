; func_0206551c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e88c
        .extern func_02054ca0
        .extern func_02054f8c
        .extern func_020552bc
        .extern func_02064fd8
        .extern func_02065714
        .extern func_02065938
        .extern func_02065a58
        .extern func_02065e04
        .global func_0206551c
        .arm
func_0206551c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x20
    mov r1, #0x8
    mov r9, r0
    str r1, [sp, #0x10]
    ldr r1, [r9, #0x10]
    cmp r1, #0x4
    bne .L_2c
    bl func_02065e04
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2c:
    ldr r0, [r9]
    mvn sl, #0x0
    cmp r0, sl
    beq .L_a8
    ldr r6, _LIT0
    add r8, sp, #0x8
    add r7, sp, #0x10
    mov r5, #0x200
    mov r4, #0x0
.L_50:
    bl func_02054f8c
    cmp r0, #0x0
    beq .L_a8
    str r8, [sp]
    str r7, [sp, #0x4]
    ldr r0, [r9]
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_02054ca0
    mov r1, r0
    cmp r1, sl
    beq .L_a8
    mov r0, r6
    mov r2, r8
    bl func_02064fd8
    ldr r0, [r9, #0x10]
    cmp r0, #0x4
    beq .L_a8
    ldr r0, [r9]
    cmp r0, sl
    bne .L_50
.L_a8:
    ldr r0, [r9, #0x10]
    cmp r0, #0x0
    beq .L_bc
    cmp r0, #0x2
    bne .L_128
.L_bc:
    bl func_020552bc
    ldr r1, [r9, #0x28]
    cmp r0, r1
    bls .L_128
    ldr r1, [r9, #0x20]
    ldr r0, [r9, #0x24]
    cmp r1, r0
    ble .L_100
    ldr r3, [r9, #0x3c]
    ldr r4, [r9, #0x38]
    mov r0, #0x2
    mvn r1, #0x0
    mov r2, #0x0
    blx r4
    ldr r0, [r9, #0x8]
    bl func_02065714
    b .L_128
.L_100:
    add r0, r1, #0x1
    str r0, [r9, #0x20]
    ldr r0, [r9, #0x10]
    cmp r0, #0x0
    bne .L_120
    mov r0, r9
    bl func_02065a58
    b .L_128
.L_120:
    mov r0, r9
    bl func_02065938
.L_128:
    ldr r0, [r9, #0x10]
    cmp r0, #0x3
    bne .L_1a8
    bl func_020552bc
    ldr r1, [r9, #0x28]
    cmp r0, r1
    bls .L_1a8
    ldr r1, [r9, #0x4]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_1a0
    mov r0, #0x2
    strb r0, [sp, #0x15]
    ldrh r1, [r9, #0x30]
    add r2, sp, #0x14
    mov r0, #0x0
    mov r3, r1, asr #0x8
    mov r1, r1, lsl #0x8
    and r3, r3, #0xff
    and r1, r1, #0xff00
    orr r1, r3, r1
    strh r1, [sp, #0x16]
    ldr r1, [r9, #0x2c]
    str r1, [sp, #0x18]
    ldr r1, [r9]
    ldr r3, [r9, #0x3c]
    ldr r4, [r9, #0x38]
    blx r4
    mvn r0, #0x0
    str r0, [r9]
.L_1a0:
    ldr r0, [r9, #0x8]
    bl func_02065714
.L_1a8:
    ldr r0, [r9, #0x10]
    cmp r0, #0x1
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020552bc
    ldr r1, [r9, #0x28]
    cmp r0, r1
    addls sp, sp, #0x20
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r3, [r9, #0x3c]
    ldr r4, [r9, #0x38]
    mov r0, #0x1
    mvn r1, #0x0
    mov r2, #0x0
    blx r4
    ldr r0, [r9, #0x8]
    bl func_02065714
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219e88c
