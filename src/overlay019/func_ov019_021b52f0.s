; func_ov019_021b52f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_ov019_021b5dd4
        .extern data_ov019_021b5df4
        .extern data_ov019_021b6920
        .extern func_02001d0c
        .extern func_02005088
        .extern func_020054a4
        .extern func_02005ee0
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern Vram_GetBankBaseCD
        .extern func_0208e1ac
        .extern func_0208e200
        .extern OS_SPrintf
        .extern func_02094504
        .extern func_02094550
        .global func_ov019_021b52f0
        .arm
func_ov019_021b52f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x78
    mov r5, r1
    str r0, [sp, #0x8]
    mov r6, r2
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094504
    bl func_0208e200
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0208e1ac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    ldr r0, [sp, #0x8]
    and r1, r5, #0xf
    str r1, [r0]
    mov r1, #0x1
    str r1, [r0, #0x8]
    bl Vram_GetBankBaseCD
    mov r4, r0
    mov r0, #0x0
    add r1, r4, #0x1b80
    mov r2, #0x1c00
    bl func_02094504
    ldr r0, _LIT1
    mov r1, #0x1c
    mov r2, #0x8
    bl func_02001d0c
    mov r3, #0x2
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r1, r6
    add r2, r4, #0x1b80
    bl func_02005088
    tst r5, #0x10
    mov r5, #0x1
    addne r5, r5, #0x1
    ldr r1, _LIT2
    add r0, sp, #0x30
    mov r2, r5
    bl OS_SPrintf
    ldr r1, _LIT3
    add r0, sp, #0x10
    mov r2, r5
    bl OS_SPrintf
    add r0, sp, #0x50
    bl func_0201d47c
    add r0, sp, #0x30
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x50]
    mov r0, #0x1a40
    ldrh r1, [sp, #0x64]
    str r0, [sp, #0x5c]
    bic r0, r1, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x64]
    ldrh r1, [sp, #0x64]
    mov r0, #0x20
    strh r0, [sp, #0x60]
    sub r0, r0, #0x21
    bic r1, r1, #0x10
    str r0, [sp, #0x58]
    add r0, sp, #0x50
    strh r1, [sp, #0x64]
    bl func_0201e5b8
    ldr r0, [sp, #0x50]
    bl Task_Invoke
    add r0, sp, #0x50
    bl func_0201d47c
    add r0, sp, #0x10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x50]
    mov r0, #0x19800
    ldrh r1, [sp, #0x64]
    str r0, [sp, #0x5c]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x64]
    mov r0, #0x20
    ldrh r1, [sp, #0x64]
    strh r0, [sp, #0x60]
    bic r0, r1, #0x10
    strh r0, [sp, #0x64]
    add r0, sp, #0x50
    bl func_0201e5b8
    ldr r0, [sp, #0x50]
    bl Task_Invoke
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, #0x20
    bl func_02094550
    ldr r0, _LIT1
    ldr r0, [r0, #0xc]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x14]
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_238
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x14]
    mov r0, #0x1f
    add r2, r1, #0x8
    ldr r1, [sp, #0x8]
    str r2, [r1, #0x14]
    str r2, [r1, #0x18]
    bl func_0202c0c0
    mov r5, r0
    mov r0, #0x1f
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0xe0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x2
    ldr r0, [sp, #0x8]
    add r2, r4, #0x1b80
    ldr r4, [r0, #0x14]
    mov r0, #0xc
    str r4, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r1, r5
    bl func_02005088
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x14]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x14]
.L_238:
    bl func_0208e200
    ldr r1, [sp, #0x8]
    add r3, r0, #0x44
    ldr r1, [r1, #0x14]
    mov r5, #0xdc
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    mov r4, r0, asr #0x3
    adds r0, r2, r1, ror #0x1d
    addne r4, r4, #0x1
    cmp r4, #0x0
    mov r6, #0x0
    ble .L_2ac
    mov r2, r6
.L_278:
    mov r7, r2
.L_27c:
    add r0, r5, #0x1
    mov r1, r7, lsl #0x1
    add r7, r7, #0x1
    mov r0, r0, lsl #0x10
    strh r5, [r3, r1]
    cmp r7, #0x1c
    mov r5, r0, lsr #0x10
    blt .L_27c
    add r6, r6, #0x1
    cmp r6, r4
    add r3, r3, #0x40
    blt .L_278
.L_2ac:
    bl func_0208e1ac
    add r1, r4, #0x2
    str r1, [sp, #0xc]
    cmp r1, #0x0
    add sl, r0, #0x2
    mov r8, #0x0
    ble .L_380
    add r6, r4, #0x1
    mov fp, #0xd6
    mov r2, #0xd3
    mov r3, #0xda
    mov ip, #0xd7
    mov lr, #0xd4
    mov r4, #0xd8
    mov r5, #0xd5
    mov r7, #0xd2
.L_2ec:
    mov r9, #0x0
.L_2f0:
    cmp r9, #0x0
    beq .L_304
    cmp r9, #0x1d
    beq .L_320
    b .L_33c
.L_304:
    cmp r8, #0x0
    moveq r0, r7
    beq .L_354
    cmp r8, r6
    movlt r0, r5
    movge r0, r4
    b .L_354
.L_320:
    cmp r8, #0x0
    moveq r0, lr
    beq .L_354
    cmp r8, r6
    movlt r0, ip
    movge r0, r3
    b .L_354
.L_33c:
    cmp r8, #0x0
    moveq r0, r2
    beq .L_354
    cmp r8, r6
    movlt r0, fp
    movge r0, #0xd9
.L_354:
    orr r1, r0, #0x1000
    mov r0, r9, lsl #0x1
    strh r1, [sl, r0]
    add r9, r9, #0x1
    cmp r9, #0x1e
    blt .L_2f0
    ldr r0, [sp, #0xc]
    add r8, r8, #0x1
    add sl, sl, #0x40
    cmp r8, r0
    blt .L_2ec
.L_380:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT6
    ldr r0, [r0, #0x14]
    ldr r3, _LIT7
    add r2, r0, #0x18
    ldr r0, [sp, #0x8]
    str r2, [r0, #0x14]
    and r0, r1, r2, lsl #0x10
    str r0, [r3]
    ldr r0, [sp, #0x8]
    sub r2, r3, #0x10
    ldr r0, [r0, #0x14]
    and r0, r1, r0, lsl #0x10
    str r0, [r3, #0x4]
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_02005ee0
    mov r0, #0x1
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov019_021b6920
_LIT1: .word data_02102c90
_LIT2: .word data_ov019_021b5dd4
_LIT3: .word data_ov019_021b5df4
_LIT4: .word data_020b4728
_LIT5: .word 0x05000400
_LIT6: .word 0x01ff0000
_LIT7: .word 0x04001010
