; func_ov015_021b50b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov015_021b5e44
        .extern data_ov015_021b5e54
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0207f05c
        .extern func_0208c884
        .extern func_0208c940
        .extern func_020b3870
        .extern func_ov015_021b2924
        .extern func_ov015_021b405c
        .global func_ov015_021b50b8
        .arm
func_ov015_021b50b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r6, #0x0
    add r0, sp, #0x0
    ldr r5, _LIT0
    ldr r7, _LIT1
    mov r4, r6
    str r6, [r0]
    str r6, [r0, #0x4]
.L_910:
    mov r0, r7
    bl func_0207ed94
    mov r0, r7
    bl func_0207ec68
    add r0, r7, #0x1c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r7, r0, #0x400
    blt .L_910
    add r0, r5, #0x48
    add r2, r0, #0x400
    add r3, r5, #0x2c
    add r1, sp, #0x8
    add r0, r3, #0x400
    str r2, [sp, #0x8]
    bl func_ov015_021b405c
    ldr r2, [sp, #0x4]
    add r1, r5, #0x2c
    add r0, r2, r0
    str r0, [sp, #0x4]
    add r2, sp, #0x8
    add r0, r5, #0x850
    add r1, r1, #0x400
    bl func_ov015_021b2924
    ldr r1, [sp, #0x4]
    add r7, r5, #0x2c
    add r0, r1, r0
    str r0, [sp, #0x4]
    add r8, r5, #0x10
    mov r9, #0x0
    add r4, sp, #0x0
.L_98c:
    ldr r0, [r4, r9, lsl #0x2]
    cmp r0, #0x0
    ble .L_9ac
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_0207f05c
.L_9ac:
    add r0, r7, #0x1c
    add r1, r8, #0x1c
    add r9, r9, #0x1
    cmp r9, #0x2
    add r7, r0, #0x400
    add r8, r1, #0x400
    blt .L_98c
    mov r1, #0x4000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1800
    str r0, [r1]
    ldr r0, [r2]
    ldr r1, _LIT2
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1f00
    str r0, [r2]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1, #0x6]
    bl func_0208c940
    ldr r1, _LIT3
    ldr r0, [r1]
    orr r0, r0, #0x10000
    str r0, [r1]
    ldr r0, [r5, #0xc]
    ldr r1, [r5, #0x8]
    subs r0, r0, #0x1000
    str r0, [r5, #0xc]
    movmi r0, #0x0
    strmi r0, [r5, #0xc]
    ldr r0, [r5, #0xc]
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x0
    bl func_020b3870
    mov r4, r0
    ldr r0, _LIT4
    mov r1, r4
    bl func_0208c884
    ldr r0, _LIT5
    mov r1, r4
    bl func_0208c884
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_ad4
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c884
    ldr r0, _LIT5
    mov r1, #0x0
    bl func_0208c884
    ldr r2, [r5, #0x848]
    mov r0, #0x2
    ldr r1, [r2, #0x70]
    mov r6, #0x1
    bic r1, r1, #0x2
    str r1, [r2, #0x70]
    ldr r1, [r5, #0x8f4]
    str r0, [r5]
    bic r0, r1, #0x1
    str r0, [r5, #0x8f4]
.L_ad4:
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov015_021b5e44
_LIT1: .word data_ov015_021b5e54
_LIT2: .word 0x04001008
_LIT3: .word 0x04001000
_LIT4: .word 0x0400006c
_LIT5: .word 0x0400106c
