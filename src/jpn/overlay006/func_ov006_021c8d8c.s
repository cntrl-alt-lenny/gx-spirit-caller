; func_ov006_021c8d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02104e6c
        .extern data_ov006_021ce530
        .extern data_ov006_021ceaa8
        .extern data_ov006_021ceac0
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201d6a4
        .extern func_0201e564
        .extern func_020943b0
        .global func_ov006_021c8d8c
        .arm
func_ov006_021c8d8c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x4]
    ldr r1, [r5, #0x74]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r2, _LIT1
    mov r0, #0x14
    ldrne r2, _LIT2
    mla r4, r1, r0, r2
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    beq .L_48
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r5, #0x38]
.L_48:
    mov r0, #0x480
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r5, #0x38]
    ldrb r0, [r4, #0x4]
    mov r1, #0x4
    mov r2, #0x0
    cmp r0, #0x0
    bne .L_7c
    ldr r0, _LIT3
    bl func_02006bf0
    b .L_84
.L_7c:
    ldr r0, _LIT4
    bl func_02006bf0
.L_84:
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d428
    ldrh r1, [sp, #0x14]
    mvn r0, #0x0
    str r0, [sp, #0x8]
    bic r1, r1, #0xf
    orr r1, r1, #0x6
    str r4, [sp]
    strh r1, [sp, #0x14]
    ldr r1, [r5, #0x3c]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x5
    str r1, [sp, #0xc]
    ldr r1, [r5, #0x40]
    mov r1, r1, lsl #0x5
    strh r1, [sp, #0x10]
    bl func_0201e564
    mov r0, r4
    bl func_0201d6a4
    ldr r1, [r5, #0x38]
    mov r2, #0x480
    bl func_020943b0
    mov r0, r4
    bl func_02006e00
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov006_021ce530
_LIT2: .word data_ov006_021ce530+0x258
_LIT3: .word data_ov006_021ceaa8
_LIT4: .word data_ov006_021ceac0
