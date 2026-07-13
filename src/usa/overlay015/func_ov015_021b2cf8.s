; func_ov015_021b2cf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov015_021b5a90
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .global func_ov015_021b2cf8
        .arm
func_ov015_021b2cf8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r6, r0
    mov r5, r1
    cmp r2, #0x5
    addls pc, pc, r2, lsl #0x2
    b .L_5c
    b .L_5c
    b .L_34
    b .L_3c
    b .L_44
    b .L_4c
    b .L_54
.L_34:
    mov r2, #0x1
    b .L_60
.L_3c:
    mov r2, #0x2
    b .L_60
.L_44:
    mov r2, #0x3
    b .L_60
.L_4c:
    mov r2, #0x4
    b .L_60
.L_54:
    mov r2, #0x5
    b .L_60
.L_5c:
    mov r2, #0x0
.L_60:
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r0, [r0, r2, lsl #0x2]
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d428
    cmp r6, #0x7
    addls pc, pc, r6, lsl #0x2
    b .L_204
    b .L_ac
    b .L_dc
    b .L_110
    b .L_134
    b .L_158
    b .L_18c
    b .L_1c0
    b .L_1e4
.L_ac:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    strh r0, [sp, #0x14]
    moveq r0, #0x0
    movne r0, #0x2
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_204
.L_dc:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    strh r0, [sp, #0x14]
    moveq r0, #0x1
    movne r0, #0x3
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_204
.L_110:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x2
    orr r0, r0, #0x8000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    b .L_204
.L_134:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x3
    orr r0, r0, #0xc000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    b .L_204
.L_158:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x5
    strh r0, [sp, #0x14]
    moveq r0, #0x0
    movne r0, #0x2
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_204
.L_18c:
    ldrh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    cmp r5, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x14]
    moveq r0, #0x1
    movne r0, #0x3
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_204
.L_1c0:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x7
    orr r0, r0, #0x8000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    b .L_204
.L_1e4:
    ldrh r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    bic r0, r0, #0x1c000
    orr r1, r1, #0x8
    orr r0, r0, #0xc000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
.L_204:
    ldrh r1, [sp, #0x14]
    add r0, sp, #0x0
    str r4, [sp]
    orr r1, r1, #0x10
    strh r1, [sp, #0x14]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov015_021b5a90
