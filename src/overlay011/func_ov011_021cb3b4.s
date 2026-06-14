; func_ov011_021cb3b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d2fc8
        .extern data_ov011_021d2fc9
        .extern data_ov011_021d38a8
        .extern data_ov011_021d38d0
        .extern data_ov011_021d403c
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov011_021cb3b4
        .arm
func_ov011_021cb3b4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    mov r5, r0
    add r0, sp, #0x0
    ldr r4, _LIT0
    bl func_0201d47c
    ldrh r2, [sp, #0x14]
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x18]
    bic r2, r2, #0xf
    orr r3, r2, #0x1
    mov r2, #0x0
    strh r3, [sp, #0x14]
    bic r3, r1, #0x7f
    bic r0, r0, #0xff
    ldrh r1, [sp, #0x14]
    bic ip, r3, #0x3f80
    orr r0, r0, #0x40
    bic r3, r0, #0xff00
    bic r0, ip, #0x1c000
    orr r3, r3, #0x4000
    orr r1, r1, #0x10
    orr r0, r0, #0xc000
    str r3, [sp, #0x1c]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    strh r2, [sp, #0x10]
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    cmp r5, #0x0
    beq .L_264
    cmp r5, #0x1
    bne .L_278
    ldr r1, [r4, #0x268]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x1c
    ldr r0, [r0, r1, lsl #0x2]
    mov r1, #0x4
    bl func_02006c0c
    ldr r1, [r4, #0x268]
    ldrh r5, [sp, #0x26]
    mov r1, r1, lsl #0x17
    ldrh r2, [sp, #0x24]
    ldr r3, _LIT2
    mov r4, r1, lsr #0x1c
    ldr r1, _LIT3
    bic r2, r2, #0xff
    strh r2, [sp, #0x24]
    ldrb r2, [r1, r4, lsl #0x1]
    ldrh ip, [sp, #0x24]
    ldrh r1, [sp, #0x16]
    ldrb r3, [r3, r4, lsl #0x1]
    bic r4, r5, #0xff
    bic r5, ip, #0xff00
    orr r3, r4, r3
    strh r3, [sp, #0x26]
    ldrh r3, [sp, #0x26]
    orr r1, r1, #0x4000
    mov r2, r2, lsl #0x18
    bic r3, r3, #0xff00
    orr r2, r3, r2, lsr #0x10
    str r0, [sp]
    strh r5, [sp, #0x24]
    strh r2, [sp, #0x26]
    strh r1, [sp, #0x16]
    b .L_278
.L_264:
    ldr r0, _LIT4
    mov r1, #0x4
    ldr r0, [r0, #0x28]
    bl func_02006c0c
    str r0, [sp]
.L_278:
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word data_ov011_021d38d0
_LIT2: .word data_ov011_021d2fc8
_LIT3: .word data_ov011_021d2fc9
_LIT4: .word data_ov011_021d38a8
