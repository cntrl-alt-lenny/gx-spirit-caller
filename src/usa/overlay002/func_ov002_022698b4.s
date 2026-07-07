; func_ov002_022698b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb88
        .extern data_ov002_022cdb96
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern func_ov002_021b1490
        .extern func_ov002_02257c14
        .global func_ov002_022698b4
        .arm
func_ov002_022698b4:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r3, _LIT1
    ldr r2, [r0, #0x484]
    ldr r1, _LIT2
    mov r0, #0x18
    mla r0, r2, r0, r1
    ldrh lr, [r3, #0xe]
    cmp r2, #0x0
    subgt r2, r0, #0x18
    mov r1, lr, lsl #0x10
    movle r2, #0x0
    movs r1, r1, lsr #0x18
    beq .L_1a14
    cmp r1, #0x1
    beq .L_1a48
    cmp r1, #0x2
    beq .L_1a9c
    b .L_1ac4
.L_1a14:
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov ip, r1, lsr #0x10
    ldr r1, _LIT0
    mov r4, #0x80
    str r4, [r1, #0x5a8]
    mov r4, #0x0
    str r4, [r1, #0x5ac]
    bic lr, lr, #0xff00
    mov ip, ip, lsl #0x18
    str r4, [r1, #0x5b0]
    orr r1, lr, ip, lsr #0x10
    strh r1, [r3, #0xe]
.L_1a48:
    ldr r3, _LIT0
    mov r1, r2
    str r0, [r3, #0x48c]
    bl func_ov002_02257c14
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1, #0x5a8]
    bne .L_1a94
    ldr r2, _LIT3
    ldrh r1, [r2]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [r2]
.L_1a94:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1a9c:
    cmp r2, #0x0
    movne r3, #0x30
    moveq r3, #0x18
    cmp r2, #0x0
    moveq r2, r0
    mov r0, #0x19
    sub r1, r0, #0x1a
    bl func_ov002_021b1490
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1ac4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cdb88
_LIT2: .word data_ov002_022ce4a8
_LIT3: .word data_ov002_022cdb96
