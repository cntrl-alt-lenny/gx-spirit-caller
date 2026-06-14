; func_ov012_021ca6dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc6a0
        .extern data_ov012_021cc6dc
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208c8cc
        .extern func_ov000_021ab4bc
        .global func_ov012_021ca6dc
        .arm
func_ov012_021ca6dc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x1c0]
    cmp r0, #0x0
    addeq sp, sp, #0x28
    ldmeqia sp!, {r4, pc}
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r2, [sp, #0x14]
    ldr r1, [sp, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xf
    strh r2, [sp, #0x14]
    bic r1, r1, #0x7f
    ldrh r3, [sp, #0x14]
    bic r1, r1, #0x3f80
    bic r2, r1, #0x1c000
    ldr lr, [r4, #0x184]
    ldr r1, [r4, #0x15c]
    orr r3, r3, #0x10
    orr r2, r2, #0x8000
    mov ip, #0x200
    str lr, [sp]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    strh ip, [sp, #0x10]
    strh r3, [sp, #0x14]
    str r2, [sp, #0x18]
    cmp r1, #0x1
    bne .L_384
    ldrh r1, [sp, #0x26]
    ldrh r3, [sp, #0x14]
    ldrh r2, [sp, #0x24]
    bic r1, r1, #0xff
    orr r1, r1, #0x40
    strh r1, [sp, #0x26]
    bic r3, r3, #0xf
    bic r1, r2, #0xff
    ldr r2, [sp, #0x1c]
    strh r3, [sp, #0x14]
    strh r1, [sp, #0x24]
    ldrh r3, [sp, #0x26]
    bic lr, r2, #0xff00
    ldrh ip, [sp, #0x24]
    ldrh r2, [sp, #0x16]
    ldrh r1, [sp, #0x14]
    orr lr, lr, #0x4000
    bic lr, lr, #0xff
    bic r3, r3, #0xff00
    orr lr, lr, #0x40
    bic ip, ip, #0xff00
    orr r3, r3, #0x4000
    orr r2, r2, #0x4000
    bic r1, r1, #0x10
    str lr, [sp, #0x1c]
    strh ip, [sp, #0x24]
    strh r3, [sp, #0x26]
    strh r2, [sp, #0x16]
    strh r1, [sp, #0x14]
    strh r0, [sp, #0x10]
.L_384:
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    mov r0, #0x0
    mov r1, #0x1
    str r0, [r4, #0x184]
    bl func_ov000_021ab4bc
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0208c8cc
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov012_021cc6a0
_LIT1: .word data_ov012_021cc6dc
