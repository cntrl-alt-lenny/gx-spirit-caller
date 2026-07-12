; func_ov000_021ace18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c74e4
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0208dfb8
        .extern func_02094410
        .global func_ov000_021ace18
        .arm
func_ov000_021ace18:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    movs r5, r0
    ldr r4, _LIT0
    bne .L_38
    ldr r1, _LIT1
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x184
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x310
    strh r0, [r1, #0x2]
.L_38:
    add r0, sp, #0x0
    bl func_0201d428
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1e
    beq .L_5c
    cmp r0, #0x1
    beq .L_ac
    b .L_fc
.L_5c:
    ldrh r0, [sp, #0x26]
    ldrh r1, [sp, #0x24]
    ldr r2, [sp, #0x18]
    bic r0, r0, #0xff
    orr r0, r0, #0x20
    strh r0, [sp, #0x26]
    bic r0, r1, #0xff
    strh r0, [sp, #0x24]
    ldrh r0, [sp, #0x26]
    ldrh r1, [sp, #0x24]
    bic r2, r2, #0x7f
    bic r2, r2, #0x3f80
    bic r0, r0, #0xff00
    orr r2, r2, #0x780
    bic r1, r1, #0xff00
    orr r0, r0, #0x900
    str r2, [sp, #0x18]
    strh r1, [sp, #0x24]
    strh r0, [sp, #0x26]
    b .L_fc
.L_ac:
    ldrh r0, [sp, #0x26]
    ldrh r1, [sp, #0x24]
    ldr r2, [sp, #0x18]
    bic r0, r0, #0xff
    bic r1, r1, #0xff
    orr r0, r0, #0x20
    strh r1, [sp, #0x24]
    strh r0, [sp, #0x26]
    ldrh r1, [sp, #0x24]
    ldrh r0, [sp, #0x26]
    bic r2, r2, #0x7f
    bic r2, r2, #0x3f80
    bic r1, r1, #0xff00
    bic r0, r0, #0xff00
    orr r2, r2, #0xb00
    orr r1, r1, #0x900
    orr r0, r0, #0xb00
    str r2, [sp, #0x18]
    strh r1, [sp, #0x24]
    strh r0, [sp, #0x26]
.L_fc:
    ldrh r1, [sp, #0x14]
    ldrh r3, [sp, #0x16]
    ldr r0, [sp, #0x18]
    orr r2, r1, #0x10
    bic r1, r0, #0x1c000
    orr r6, r3, #0x4000
    bic r0, r2, #0xf
    orr r3, r1, #0x1c000
    orr r1, r0, #0x7
    ldr lr, [r4, #0x260]
    mov ip, #0x600
    mov r2, #0x0
    mov r0, #0x40
    strh r6, [sp, #0x16]
    str lr, [sp]
    strh ip, [sp, #0x10]
    str r3, [sp, #0x18]
    str r2, [sp, #0x8]
    strh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    cmp r5, #0x0
    bne .L_168
    bl func_0208dfb8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
.L_168:
    ldr r1, [r4, #0x26c]
    add r0, sp, #0x0
    orr r1, r1, #0x40
    str r1, [r4, #0x26c]
    bl func_0201e564
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c74e4
_LIT1: .word 0x0400100c
