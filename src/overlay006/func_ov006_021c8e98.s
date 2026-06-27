; func_ov006_021c8e98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02104f4c
        .extern data_ov006_021ce650
        .extern data_ov006_021ce8a8
        .extern data_ov006_021cebc8
        .extern data_ov006_021cebe0
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201d6f8
        .extern func_0201e5b8
        .extern func_020944a4
        .global func_ov006_021c8e98
        .arm
func_ov006_021c8e98:
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
    beq .L_c34
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r5, #0x38]
.L_c34:
    mov r0, #0x480
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r5, #0x38]
    ldrb r0, [r4, #0x4]
    mov r1, #0x4
    mov r2, #0x0
    cmp r0, #0x0
    bne .L_c68
    ldr r0, _LIT3
    bl func_02006c0c
    b .L_c70
.L_c68:
    ldr r0, _LIT4
    bl func_02006c0c
.L_c70:
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl func_0201d6f8
    ldr r1, [r5, #0x38]
    mov r2, #0x480
    bl func_020944a4
    mov r0, r4
    bl Task_Invoke
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov006_021ce650
_LIT2: .word data_ov006_021ce8a8
_LIT3: .word data_ov006_021cebc8
_LIT4: .word data_ov006_021cebe0
