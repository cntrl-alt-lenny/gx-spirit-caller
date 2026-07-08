; func_ov002_021ba754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf090
        .extern data_ov002_022cf094
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a4
        .extern data_ov002_022d0170
        .global func_ov002_021ba754
        .arm
func_ov002_021ba754:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r2, _LIT0
    and lr, r0, #0x1
    mul r3, lr, r2
    ldr r2, _LIT1
    mov r7, #0x0
    str r7, [r2, r3]
    ldr r4, [r1]
    mov r2, #0x1
    cmp r4, #0x0
    bls .L_c8
    ldr r4, _LIT2
    mov r9, #0x2000
    add ip, r4, r3
    ldr r5, _LIT3
    add r8, ip, #0x260
    rsb r9, r9, #0x0
.L_44:
    add r6, r1, r7, lsl #0x1
    ldrh r4, [r6, #0xc]
    ldr sl, [r8]
    add r7, r7, #0x1
    and sl, sl, r9
    and r4, r4, r9, lsr #0x13
    orr r4, sl, r4
    bic r4, r4, #0x2000
    orr r4, r4, lr, lsl #0xd
    str r4, [r8]
    bic sl, r4, #0x3fc00000
    mov r4, r2, lsl #0x18
    orr r4, sl, r4, lsr #0x2
    mov sl, r4, lsl #0x2
    str r4, [r8], #0x4
    ldrh r6, [r6, #0xc]
    mov sl, sl, lsr #0x18
    mov fp, r4, lsl #0x12
    mov r4, sl, lsl #0x1
    add r4, r4, fp, lsr #0x1f
    mov r4, r4, lsl #0x2
    ldrh sl, [r5, r4]
    and r6, r6, r9, lsr #0x13
    add r2, r2, #0x1
    and sl, sl, r9
    orr r6, sl, r6
    strh r6, [r5, r4]
    ldr r4, [ip, #0x10]
    add r4, r4, #0x1
    str r4, [ip, #0x10]
    ldr r4, [r1]
    cmp r7, r4
    bcc .L_44
.L_c8:
    ldr r4, _LIT4
    mov r8, #0x0
    str r8, [r4, r3]
    ldr r4, [r1, #0x8]
    cmp r4, #0x0
    bls .L_180
    ldr r4, _LIT2
    mov r9, #0x2000
    add r6, r4, r3
    ldr ip, _LIT3
    add r7, r6, #0x3a0
    mov lr, r0, lsl #0x1f
    rsb r9, r9, #0x0
.L_fc:
    add r5, r1, r8, lsl #0x1
    ldrh r0, [r5, #0xca]
    ldr r4, [r7]
    add r8, r8, #0x1
    and r4, r4, r9
    and r0, r0, r9, lsr #0x13
    orr sl, r4, r0
    bic r0, sl, #0x2000
    orr r4, r0, lr, lsr #0x12
    mov r0, r2, lsl #0x18
    bic sl, r4, #0x3fc00000
    orr r0, sl, r0, lsr #0x2
    mov sl, r0, lsl #0x2
    str r4, [r7]
    str r0, [r7], #0x4
    ldrh r4, [r5, #0xca]
    mov sl, sl, lsr #0x18
    mov r5, r0, lsl #0x12
    mov r0, sl, lsl #0x1
    add r0, r0, r5, lsr #0x1f
    mov r0, r0, lsl #0x2
    ldrh r5, [ip, r0]
    and r4, r4, r9, lsr #0x13
    add r2, r2, #0x1
    and r5, r5, r9
    orr r4, r5, r4
    strh r4, [ip, r0]
    ldr r0, [r6, #0x18]
    add r0, r0, #0x1
    str r0, [r6, #0x18]
    ldr r0, [r1, #0x8]
    cmp r8, r0
    bcc .L_fc
.L_180:
    ldr r1, _LIT5
    sub r4, r2, #0x1
    ldr r0, _LIT6
    str r4, [r1, r3]
    str r2, [r0, r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0170
_LIT4: .word data_ov002_022cf0a4
_LIT5: .word data_ov002_022cf094
_LIT6: .word data_ov002_022cf090
