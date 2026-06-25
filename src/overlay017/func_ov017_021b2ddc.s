; func_ov017_021b2ddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_ov017_021b7e7c
        .extern data_ov017_021b80d4
        .extern data_ov017_021b80f0
        .extern data_ov017_021b810c
        .extern data_ov017_021b8128
        .extern data_ov017_021b8134
        .extern func_02001d0c
        .extern func_02005088
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0201e7e0
        .extern func_0201ef90
        .extern func_02094550
        .extern func_ov017_021b34c4
        .global func_ov017_021b2ddc
        .arm
func_ov017_021b2ddc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x58
    str r0, [sp, #0x18]
    add r0, sp, #0x30
    bl func_0201d47c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x44]
    str r0, [sp, #0x30]
    mov r4, #0x1b00
    bic r0, r2, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0x44]
    ldr r1, [sp, #0x48]
    ldrh r2, [sp, #0x44]
    bic r0, r1, #0x1c000
    orr r1, r0, #0xc000
    orr r3, r2, #0x10
    mov r2, #0x0
    add r0, sp, #0x30
    str r4, [sp, #0x3c]
    strh r3, [sp, #0x44]
    strh r2, [sp, #0x40]
    str r1, [sp, #0x48]
    bl func_0201e5b8
    ldr r0, [sp, #0x30]
    bl Task_Invoke
    add r0, sp, #0x30
    bl func_0201d47c
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x30]
    mov r0, #0x40
    ldrh r1, [sp, #0x44]
    str r0, [sp, #0x3c]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x44]
    mov r0, #0x0
    ldrh r1, [sp, #0x44]
    strh r0, [sp, #0x40]
    orr r0, r1, #0x10
    ldr r1, [sp, #0x48]
    strh r0, [sp, #0x44]
    bic r1, r1, #0x1c000
    orr r1, r1, #0xc000
    add r0, sp, #0x30
    str r1, [sp, #0x48]
    bl func_0201e5b8
    ldr r0, [sp, #0x30]
    bl Task_Invoke
    add r0, sp, #0x30
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x30]
    mov r0, #0x880
    ldrh r1, [sp, #0x44]
    str r0, [sp, #0x3c]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x44]
    mvn r0, #0x0
    ldr r1, [sp, #0x48]
    str r0, [sp, #0x38]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x1c000
    str r0, [sp, #0x48]
    add r0, sp, #0x30
    bl func_0201e5b8
    ldr r0, [sp, #0x30]
    bl Task_Invoke
    ldr r0, _LIT3
    add r4, sp, #0x20
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e7e0
    mov r3, #0x0
    ldr r2, [sp, #0x18]
    str r3, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, r4
    str r1, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x18]
    add r0, r0, #0x8c
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x18]
    add r1, r1, #0x14
    add r0, r0, #0x10
    add r2, r2, #0x18
    bl func_0201ef90
    mov r0, #0x6600000
    add r0, r0, #0x3e00
    mov r9, #0x0
    ldr r8, _LIT4
    ldr r6, _LIT5
    add r7, r0, #0x10000
    mov sl, r9
    mov fp, #0x1
    mov r4, #0xc
    mov r5, #0x2
.L_1c4:
    ldrb r2, [r8, r9]
    mov r0, r6
    mov r1, r5
    str r2, [sp, #0x1c]
    mov r2, r5
    bl func_02001d0c
    cmp r9, #0xa
    movge r2, fp
    movlt r2, #0x0
    rsb r0, r2, #0x2
    str r0, [sp]
    add r3, r2, #0x2
    mov r0, r6
    add r1, sp, #0x1c
    add r2, r7, sl
    str r4, [sp, #0x4]
    bl func_02005088
    add r9, r9, #0x1
    cmp r9, #0xb
    add sl, sl, #0x80
    blt .L_1c4
    ldr r0, _LIT6
    ldr r1, _LIT7
    mov r2, #0x20
    bl func_02094550
    add r0, sp, #0x30
    bl func_0201d47c
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r2, _LIT9
    ldrh r1, [sp, #0x44]
    str r0, [sp, #0x30]
    str r2, [sp, #0x3c]
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mov r1, #0xc0
    add r0, sp, #0x30
    strh r3, [sp, #0x44]
    strh r1, [sp, #0x40]
    bl func_0201e5b8
    ldr r0, [sp, #0x30]
    bl Task_Invoke
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x18
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x18
    orr r1, r1, r0, lsl #0x8
    ldr r0, [sp, #0x18]
    str r1, [r2]
    bl func_ov017_021b34c4
    mov r0, #0x1
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov017_021b80d4
_LIT1: .word data_ov017_021b80f0
_LIT2: .word data_ov017_021b810c
_LIT3: .word data_ov017_021b7e7c
_LIT4: .word data_ov017_021b8128
_LIT5: .word data_02102c90
_LIT6: .word data_020b4728
_LIT7: .word 0x05000620
_LIT8: .word data_ov017_021b8134
_LIT9: .word 0x00014380
