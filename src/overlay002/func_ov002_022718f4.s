; func_ov002_022718f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022d0250
        .extern func_ov002_021bb068
        .global func_ov002_022718f4
        .arm
func_ov002_022718f4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    mov ip, r1, lsl #0x2
    ldrh r4, [r4, ip]
    ldr lr, _LIT1
    ldr ip, _LIT2
    ldr r5, [lr]
    mov r4, r4, lsl #0x13
    bic r5, r5, #0x1
    and r0, r0, #0x1
    orr r0, r5, r0
    mov r4, r4, lsr #0x13
    and r5, r0, ip
    mov r0, r4, lsl #0x11
    orr r4, r5, r0, lsr #0x9
    rsb r0, ip, #0xfe
    and r0, r4, r0
    orr r0, r0, r1, lsl #0x17
    str r0, [lr]
    mov r0, #0x0
    ldr r1, _LIT1
    strh r0, [lr, #0x6]
    cmp r3, #0x0
    movgt r0, #0x1
    ldrh ip, [r1, #0x16]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    bic ip, ip, #0x4
    orr r0, ip, r0, lsr #0x1d
    strh r0, [r1, #0x16]
    cmp r3, #0x1
    subgt r0, r3, #0x1
    movle r0, #0x0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x10
    ldrh r3, [r1, #0x16]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1e
    bic r3, r3, #0x30
    orr r0, r3, r0, lsr #0x1a
    strh r0, [r1, #0x16]
    ldr r0, [r1]
    cmp r2, #0x0
    orr r0, r0, #0x20
    bic r0, r0, #0xc0
    orr r3, r0, #0x80
    str r3, [r1]
    ldrh r0, [r1, #0x16]
    bic r0, r0, #0x2
    strh r0, [r1, #0x16]
    ldrh r0, [r1, #0x16]
    bic r0, r0, #0x8
    strh r0, [r1, #0x16]
    beq .L_1f4
    cmp r2, #0x1
    beq .L_230
    cmp r2, #0x2
    ldreqh r0, [r1, #0x16]
    orreq r0, r0, #0x2
    streqh r0, [r1, #0x16]
    b .L_238
.L_1f4:
    bic r0, r3, #0xc0
    orr r2, r0, #0x40
    ldr r0, _LIT3
    str r2, [r1]
    bl func_ov002_021bb068
    cmp r0, #0x0
    ldr r0, _LIT1
    movgt r1, #0x1
    ldr r2, [r0]
    movle r1, #0x0
    mov r1, r1, lsl #0x1f
    bic r2, r2, #0x20
    orr r1, r2, r1, lsr #0x1a
    str r1, [r0]
    b .L_238
.L_230:
    bic r0, r3, #0xc0
    str r0, [r1]
.L_238:
    ldr r0, _LIT1
    mov r1, #0x0
    ldrh r2, [r0, #0x16]
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    strh r2, [r0, #0x16]
    strb r1, [r0, #0x8]
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    bic r1, r1, #0xff00
    bic r1, r1, #0xff0000
    bic r1, r1, #-16777216
    str r1, [r0, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word data_ov002_022cd300
_LIT2: .word 0xff8000ff
_LIT3: .word 0x0000135d
