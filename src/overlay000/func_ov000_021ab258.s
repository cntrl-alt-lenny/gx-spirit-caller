; func_ov000_021ab258 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7540
        .global func_ov000_021ab258
        .arm
func_ov000_021ab258:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    mov ip, #0x2c
    mov lr, #0xc
    mul lr, r1, lr
    mla r5, r0, ip, r4
    add r4, lr, r5
    ldrh lr, [lr, r5]
    ldrh ip, [r4, #0x2]
    ldrh r5, [r4, #0x4]
    ldrh r4, [r4, #0x6]
    strh lr, [sp]
    strh ip, [sp, #0x2]
    strh r5, [sp, #0x4]
    strh r4, [sp, #0x6]
    cmp r0, #0x0
    beq .L_58
    cmp r0, #0x1
    beq .L_130
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_58:
    cmp r1, #0x0
    beq .L_6c
    cmp r1, #0x1
    beq .L_c0
    b .L_110
.L_6c:
    ldr r0, _LIT1
    ldrsh ip, [sp]
    ldrh r1, [r0]
    ldrsh r5, [sp, #0x4]
    ldrsh r4, [sp, #0x2]
    bic lr, r1, #0x3f
    ldrsh r1, [sp, #0x6]
    orr r2, lr, r2
    mov ip, ip, lsl #0x8
    orr lr, r2, #0x20
    mov r2, r4, lsl #0x8
    and ip, ip, #0xff00
    and r4, r5, #0xff
    strh lr, [r0]
    orr r4, ip, r4
    and r2, r2, #0xff00
    and r1, r1, #0xff
    strh r4, [r0, #-8]
    orr r1, r2, r1
    strh r1, [r0, #-4]
    b .L_110
.L_c0:
    ldr r0, _LIT1
    ldrsh ip, [sp]
    ldrh r1, [r0]
    ldrsh r5, [sp, #0x4]
    ldrsh r4, [sp, #0x2]
    bic lr, r1, #0x3f00
    ldrsh r1, [sp, #0x6]
    orr r2, lr, r2, lsl #0x8
    mov ip, ip, lsl #0x8
    orr lr, r2, #0x2000
    mov r2, r4, lsl #0x8
    and ip, ip, #0xff00
    and r4, r5, #0xff
    strh lr, [r0]
    orr r4, ip, r4
    and r2, r2, #0xff00
    and r1, r1, #0xff
    strh r4, [r0, #-6]
    orr r1, r2, r1
    strh r1, [r0, #-2]
.L_110:
    ldr r1, _LIT2
    add sp, sp, #0x8
    ldrh r0, [r1]
    bic r0, r0, #0x3f
    orr r0, r0, r3
    orr r0, r0, #0x20
    strh r0, [r1]
    ldmia sp!, {r3, r4, r5, pc}
.L_130:
    cmp r1, #0x0
    beq .L_144
    cmp r1, #0x1
    beq .L_198
    b .L_1e8
.L_144:
    ldr r0, _LIT3
    ldrsh ip, [sp]
    ldrh r1, [r0]
    ldrsh r5, [sp, #0x4]
    ldrsh r4, [sp, #0x2]
    bic lr, r1, #0x3f
    ldrsh r1, [sp, #0x6]
    orr r2, lr, r2
    mov ip, ip, lsl #0x8
    orr lr, r2, #0x20
    mov r2, r4, lsl #0x8
    and ip, ip, #0xff00
    and r4, r5, #0xff
    strh lr, [r0]
    orr r4, ip, r4
    and r2, r2, #0xff00
    and r1, r1, #0xff
    strh r4, [r0, #-8]
    orr r1, r2, r1
    strh r1, [r0, #-4]
    b .L_1e8
.L_198:
    ldr r0, _LIT3
    ldrsh r4, [sp]
    ldrh r1, [r0]
    ldrsh lr, [sp, #0x4]
    ldrsh ip, [sp, #0x2]
    bic r5, r1, #0x3f00
    ldrsh r1, [sp, #0x6]
    orr r2, r5, r2, lsl #0x8
    mov r4, r4, lsl #0x8
    orr r5, r2, #0x2000
    mov r2, ip, lsl #0x8
    and r4, r4, #0xff00
    and ip, lr, #0xff
    strh r5, [r0]
    orr r4, r4, ip
    and r2, r2, #0xff00
    and r1, r1, #0xff
    strh r4, [r0, #-6]
    orr r1, r2, r1
    strh r1, [r0, #-2]
.L_1e8:
    ldr r1, _LIT4
    ldrh r0, [r1]
    bic r0, r0, #0x3f
    orr r0, r0, r3
    orr r0, r0, #0x20
    strh r0, [r1]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov000_021c7540
_LIT1: .word 0x04000048
_LIT2: .word 0x0400004a
_LIT3: .word 0x04001048
_LIT4: .word 0x0400104a
