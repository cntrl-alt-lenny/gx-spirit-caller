; func_0201cd1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218febc
        .extern data_0218fef4
        .extern data_0218ff4c
        .extern data_0219000c
        .extern func_0201cd1c
        .extern func_02092748
        .extern func_020927b8
        .extern func_02094688
        .global func_0201cd1c
        .arm
func_0201cd1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    mov r9, r2
    str r0, [sp]
    mov sl, r1
    cmp r9, #0x10
    ble .L_c0
    ldrh r0, [sl]
    cmp r9, #0x10
    mov r7, #0x2
    str r0, [sp, #0x4]
    ble .L_8c
    add r8, sl, #0x2
    mov r6, #0x0
    add r5, sp, #0xa
    mov r4, #0xe
    mov fp, #0xff
.L_44:
    mov r0, r8
    mov r1, r5
    mov r2, r4
    strh r6, [sp, #0x8]
    bl func_02094688
    mov r0, fp
    add r1, sp, #0x8
    mov r2, #0x10
    add r8, r8, #0xe
    add r7, r7, #0xe
    bl func_0201cd1c
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r7, #0xe
    cmp r0, r9
    blt .L_44
.L_8c:
    sub r4, r9, r7
    ldr r3, [sp, #0x4]
    add r1, sp, #0xa
    mov r2, r4
    add r0, sl, r7
    strh r3, [sp, #0x8]
    bl func_02094688
    ldr r0, [sp]
    add r1, sp, #0x8
    add r2, r4, #0x2
    bl func_0201cd1c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c0:
    ldr r0, _LIT0
    ldr r0, [r0, #0x10]
    cmp r0, #0x1f
    addcs sp, sp, #0x18
    movcs r0, #0x0
    ldmcsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r3, [sl]
    ldr r1, [sp]
    ldr r2, _LIT1
    orr r1, r3, r1, lsl #0x8
    strh r1, [sl]
    ldrh r4, [r2]
    ldr r0, _LIT2
    mov r1, #0x0
    strh r1, [r2]
    bl func_020927b8
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r3, [r0, #0x4]
    ldr r2, [r0, #0x10]
    mov r0, sl
    add r5, r3, r2
    mov r6, r5, lsl #0x1b
    mov r2, r9
    add r1, r1, r6, lsr #0x17
    bl func_02094688
    ldr r1, _LIT0
    ldr r3, _LIT4
    ldr r0, [r1, #0x10]
    mov r5, r6, lsr #0x1a
    add r2, r0, #0x1
    ldr r0, _LIT2
    strh r9, [r3, r5]
    str r2, [r1, #0x10]
    bl func_02092748
    ldr r2, _LIT1
    mov r0, #0x1
    ldrh r1, [r2]
    strh r4, [r2]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0218febc
_LIT1: .word 0x04000208
_LIT2: .word data_0218fef4
_LIT3: .word data_0219000c
_LIT4: .word data_0218ff4c
