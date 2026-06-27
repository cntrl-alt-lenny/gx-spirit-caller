; func_ov011_021cb25c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208c8cc
        .extern Bg_SetScroll
        .global func_ov011_021cb25c
        .arm
func_ov011_021cb25c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2d4]
    cmp r0, #0x0
    beq .L_144
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r0, [sp, #0x14]
    ldr r2, [sp, #0x18]
    ldr r1, [sp, #0x1c]
    bic r0, r0, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0x14]
    mov r0, #0x0
    bic r2, r2, #0x7f
    bic r1, r1, #0xff00
    ldrh r5, [sp, #0x14]
    bic r2, r2, #0x3f80
    bic r3, r2, #0x1c000
    orr r1, r1, #0x2000
    bic r2, r1, #0xff
    orr ip, r5, #0x10
    orr r5, r2, #0x20
    ldr lr, [r4, #0x298]
    ldr r1, [r4, #0x264]
    orr r3, r3, #0xc000
    mov r2, #0x200
    str lr, [sp]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    strh r2, [sp, #0x10]
    strh ip, [sp, #0x14]
    str r3, [sp, #0x18]
    str r5, [sp, #0x1c]
    cmp r1, #0x1
    bne .L_114
    ldrh r1, [sp, #0x26]
    ldrh r3, [sp, #0x14]
    ldrh r2, [sp, #0x24]
    bic r1, r1, #0xff
    orr r1, r1, #0x40
    strh r1, [sp, #0x26]
    bic r3, r3, #0xf
    bic r1, r2, #0xff
    strh r3, [sp, #0x14]
    strh r1, [sp, #0x24]
    ldrh r3, [sp, #0x26]
    bic r5, r5, #0xff00
    ldrh ip, [sp, #0x24]
    ldrh r2, [sp, #0x16]
    ldrh r1, [sp, #0x14]
    orr r5, r5, #0x4000
    bic lr, r5, #0xff
    bic r3, r3, #0xff00
    orr r5, lr, #0x40
    bic lr, ip, #0xff00
    orr ip, r3, #0x4000
    orr r3, r2, #0x4000
    bic r2, r1, #0x10
    mov r1, #0x20
    str r5, [sp, #0x1c]
    strh lr, [sp, #0x24]
    strh ip, [sp, #0x26]
    strh r3, [sp, #0x16]
    strh r2, [sp, #0x14]
    strh r0, [sp, #0x10]
    str r1, [sp, #0x20]
.L_114:
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    ldr r0, [r4, #0x264]
    mov r1, #0x0
    cmp r0, #0x1
    str r1, [r4, #0x298]
    movne r1, #0x3
    mov r0, #0x1
    mov r2, #0x0
    bl func_0208c8cc
.L_144:
    bl Bg_SetScroll
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
