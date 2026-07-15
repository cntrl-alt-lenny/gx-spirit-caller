; func_ov016_021b70c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b8cb8
        .extern data_ov016_021b9268
        .extern data_ov016_021b928c
        .extern data_ov016_021b95e0
        .extern data_ov016_021ba9e4
        .extern data_ov016_021bab2c
        .extern data_ov016_021bab44
        .extern func_02001ba8
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0209445c
        .extern func_ov016_021b388c
        .extern func_ov016_021b7398
        .global func_ov016_021b70c4
        .arm
func_ov016_021b70c4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x5c
    mov r7, r0
    add r0, sp, #0x34
    ldr r4, _LIT0
    bl func_0201d428
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x5a]
    ldrh r3, [sp, #0x48]
    ldrh r2, [sp, #0x58]
    bic r1, r1, #0xff
    bic r3, r3, #0xf
    orr r5, r3, #0x8
    orr r1, r1, #0x20
    strh r1, [sp, #0x5a]
    bic r1, r2, #0xff
    strh r1, [sp, #0x58]
    ldrh r2, [sp, #0x5a]
    strh r5, [sp, #0x48]
    ldr r3, [sp, #0x4c]
    ldrh r6, [sp, #0x48]
    bic r5, r3, #0x1c000
    ldrh r3, [sp, #0x58]
    orr r6, r6, #0x10
    ldrh r1, [sp, #0x4a]
    orr r5, r5, #0x1c000
    str r0, [sp, #0x34]
    bic r0, r5, #0x3f80
    bic r5, r3, #0xff00
    bic r2, r2, #0xff00
    orr r3, r2, #0x1200
    orr r2, r1, #0x4000
    orr r1, r0, #0x80
    mov r0, #0x5700
    str r0, [sp, #0x40]
    mov r0, #0x0
    strh r0, [sp, #0x44]
    add r0, sp, #0x34
    strh r6, [sp, #0x48]
    strh r5, [sp, #0x58]
    strh r3, [sp, #0x5a]
    strh r2, [sp, #0x4a]
    str r1, [sp, #0x4c]
    bl func_0201e564
    ldr r0, [sp, #0x34]
    bl func_02006e00
    add r0, sp, #0x34
    bl func_0201d428
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x34]
    ldr r0, _LIT3
    mov r5, #0x0
    ldrh r1, [sp, #0x48]
    str r0, [sp, #0x40]
    strh r5, [sp, #0x44]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x48]
    ldr r1, [sp, #0x4c]
    ldrh r0, [sp, #0x58]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x8000
    bic r0, r0, #0xff
    str r1, [sp, #0x4c]
    strh r0, [sp, #0x58]
    ldrh r0, [sp, #0x58]
    ldrh r1, [sp, #0x5a]
    ldrh r2, [sp, #0x48]
    bic r0, r0, #0xff00
    bic r1, r1, #0xff
    strh r0, [sp, #0x58]
    ldrh r0, [sp, #0x4a]
    orr r1, r1, #0x1c
    strh r1, [sp, #0x5a]
    orr r0, r0, #0x4000
    orr r2, r2, #0x10
    ldrh r1, [sp, #0x5a]
    strh r0, [sp, #0x4a]
    strh r2, [sp, #0x48]
    bic r0, r1, #0xff00
    orr r0, r0, #0x300
    mov r6, #0x1
    strh r0, [sp, #0x5a]
    mov r8, #0x6
    add r9, sp, #0x34
    b .L_3d0
.L_394:
    cmp r5, #0x0
    ble .L_3ac
    ldr r0, [sp, #0x4c]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x1c000
    str r0, [sp, #0x4c]
.L_3ac:
    ldr r1, [sp, #0x4c]
    mov r0, r6, lsl #0x19
    bic r1, r1, #0x3f80
    orr r1, r1, r0, lsr #0x12
    mov r0, r9
    str r1, [sp, #0x4c]
    bl func_0201e564
    add r6, r6, #0x3
    add r5, r5, #0x1
.L_3d0:
    ldr r0, [r7, #0x8]
    cmp r0, #0x6
    movgt r0, r8
    cmp r5, r0
    blt .L_394
    ldr r0, [sp, #0x34]
    bl func_02006e00
    ldr r0, _LIT4
    add r5, sp, #0x24
    ldmia r0, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldr r0, _LIT5
    mov r1, r5
    bl func_ov016_021b388c
    ldr r0, [r7, #0x8]
    add r9, r4, #0x44
    cmp r0, #0x6
    mov r8, #0x0
    mov r4, #0x6
    ble .L_468
    ldr r6, _LIT6
    ldr r5, _LIT7
    b .L_44c
.L_42c:
    mov r0, r7
    mov r1, r9
    mov r2, r8
    mov r3, r5
    str r6, [sp]
    bl func_ov016_021b7398
    add r9, r9, #0x54
    add r8, r8, #0x1
.L_44c:
    ldr r0, [r7, #0x8]
    cmp r0, #0x6
    movgt r0, r4
    add r0, r0, #0x1
    cmp r8, r0
    blt .L_42c
    b .L_4a8
.L_468:
    ldr r6, _LIT6
    ldr r5, _LIT7
    b .L_494
.L_474:
    mov r0, r7
    mov r1, r9
    mov r2, r8
    mov r3, r5
    str r6, [sp]
    bl func_ov016_021b7398
    add r9, r9, #0x54
    add r8, r8, #0x1
.L_494:
    ldr r0, [r7, #0x8]
    cmp r0, #0x6
    movgt r0, r4
    cmp r8, r0
    blt .L_474
.L_4a8:
    ldr r2, _LIT8
    add r0, sp, #0x4
    mov r1, #0x2800
    bl func_02001ba8
    ldr r1, _LIT9
    add r0, sp, #0x4
    mov r2, #0x20
    bl func_0209445c
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov016_021b95e0
_LIT1: .word data_ov016_021b9268
_LIT2: .word data_ov016_021b928c
_LIT3: .word 0x00005b80
_LIT4: .word data_ov016_021b8cb8
_LIT5: .word data_ov016_021ba9e4
_LIT6: .word data_ov016_021bab2c
_LIT7: .word data_ov016_021bab44
_LIT8: .word 0x000076f4
_LIT9: .word 0x050006a0
