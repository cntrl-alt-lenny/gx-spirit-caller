; func_ov012_021ca734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc058
        .extern data_ov012_021cc5fc
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_02013980
        .extern func_0201d428
        .extern func_0201e564
        .extern func_02091554
        .global func_ov012_021ca734
        .arm
func_ov012_021ca734:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x60
    mov r6, r0
    ldr r5, _LIT0
    bl func_02013980
    ldr lr, _LIT1
    mov r4, r0
    add ip, sp, #0x20
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    add r0, sp, #0x38
    bl func_0201d428
    mov r2, #0x0
    ldr r0, [sp, #0x54]
    ldrh r3, [sp, #0x4c]
    ldr r1, [sp, #0x50]
    bic r0, r0, #0xff
    orr r0, r0, #0x40
    bic r1, r1, #0x7f
    bic r0, r0, #0xff00
    bic r3, r3, #0xf
    orr r0, r0, #0x4000
    orr r3, r3, #0x1
    bic r1, r1, #0x3f80
    str r0, [sp, #0x54]
    bic r0, r1, #0x1c000
    orr r0, r0, #0xc000
    strh r3, [sp, #0x4c]
    str r0, [sp, #0x50]
    ldrh r0, [sp, #0x4c]
    str r2, [sp, #0x40]
    str r2, [sp, #0x44]
    orr r0, r0, #0x10
    strh r2, [sp, #0x48]
    cmp r6, #0x0
    strh r0, [sp, #0x4c]
    beq .L_4d0
    cmp r6, #0x1
    bne .L_4f4
    ldr r1, [r5, #0x160]
    add r0, sp, #0x20
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    ldr r0, [r0, r1, lsl #0x2]
    mov r1, #0x4
    bl func_02006bf0
    ldrh r2, [sp, #0x5e]
    ldrh r3, [sp, #0x5c]
    ldrh r1, [sp, #0x4e]
    bic r2, r2, #0xff
    orr r2, r2, #0x40
    strh r2, [sp, #0x5e]
    bic r2, r3, #0xff
    strh r2, [sp, #0x5c]
    ldrh r2, [sp, #0x5e]
    ldrh r3, [sp, #0x5c]
    orr r1, r1, #0x4000
    bic r2, r2, #0xff00
    bic r3, r3, #0xff00
    orr r2, r2, #0x4000
    str r0, [sp, #0x38]
    strh r3, [sp, #0x5c]
    strh r2, [sp, #0x5e]
    strh r1, [sp, #0x4e]
    b .L_4f4
.L_4d0:
    ldr r1, [sp, #0x20]
    add r0, sp, #0x0
    add r2, r4, #0xa
    bl func_02091554
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x38]
.L_4f4:
    add r0, sp, #0x38
    bl func_0201e564
    ldr r0, [sp, #0x38]
    bl func_02006e00
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov012_021cc5fc
_LIT1: .word data_ov012_021cc058
