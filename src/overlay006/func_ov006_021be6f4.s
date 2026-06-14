; func_ov006_021be6f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b1d4c
        .extern data_ov006_021cb634
        .extern data_ov006_021cb65c
        .extern func_ov005_021aa4b0
        .global func_ov006_021be6f4
        .arm
func_ov006_021be6f4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x50
    mov r6, r0
    ldr r1, [r6, #0x50]
    add r2, r6, #0xa0
    mov r0, #0x24
    mla r4, r1, r0, r2
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_2a8
    ldr r5, _LIT0
    ldr ip, _LIT1
    add r3, sp, #0x28
    mov r2, #0xa
.L_178:
    ldrh r1, [ip]
    ldrh r0, [ip, #0x2]
    add ip, ip, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_178
    ldr ip, _LIT2
    add r3, sp, #0x0
    mov r2, #0xa
.L_1a4:
    ldrh r1, [ip]
    ldrh r0, [ip, #0x2]
    add ip, ip, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_1a4
    ldr r0, _LIT0
    bl func_ov005_021aa4b0
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1]
    ldr r1, [r6, #0x50]
    cmp r1, #0x4
    bne .L_248
    add ip, sp, #0x0
.L_1e8:
    mov r1, r0, lsl #0x3
    add r3, ip, r0, lsl #0x3
    ldrsh r2, [ip, r1]
    add r6, r5, r0, lsl #0x3
    ldrsh r1, [r3, #0x2]
    strh r2, [r6, #0x34]
    add r0, r0, #0x1
    ldrsh r2, [r3, #0x4]
    strh r1, [r6, #0x36]
    ldrsh r1, [r3, #0x6]
    strh r2, [r6, #0x38]
    cmp r0, #0x5
    strh r1, [r6, #0x3a]
    blt .L_1e8
    ldr r1, [r4, #0x8]
    mov r0, #0x3
    str r1, [r5, #0x4]
    ldr r1, [r4, #0x10]
    sub r1, r1, #0x3
    str r1, [r5, #0x8]
    str r0, [r5, #0xc]
    ldr r0, [r4, #0x4]
    str r0, [r5, #0x10]
    b .L_2a8
.L_248:
    add ip, sp, #0x28
.L_24c:
    mov r1, r0, lsl #0x3
    add r3, ip, r0, lsl #0x3
    ldrsh r2, [ip, r1]
    add r6, r5, r0, lsl #0x3
    ldrsh r1, [r3, #0x2]
    strh r2, [r6, #0x34]
    add r0, r0, #0x1
    ldrsh r2, [r3, #0x4]
    strh r1, [r6, #0x36]
    ldrsh r1, [r3, #0x6]
    strh r2, [r6, #0x38]
    cmp r0, #0x5
    strh r1, [r6, #0x3a]
    blt .L_24c
    ldr r1, [r4, #0x8]
    mov r0, #0x4
    str r1, [r5, #0x4]
    ldr r1, [r4, #0x10]
    sub r1, r1, #0x4
    str r1, [r5, #0x8]
    str r0, [r5, #0xc]
    ldr r0, [r4, #0x4]
    str r0, [r5, #0x10]
.L_2a8:
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021b1d4c
_LIT1: .word data_ov006_021cb634
_LIT2: .word data_ov006_021cb65c
