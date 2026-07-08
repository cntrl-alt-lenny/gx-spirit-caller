; func_ov002_02267250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_ov002_021e2fc4
        .extern func_ov002_021fea18
        .global func_ov002_02267250
        .arm
func_ov002_02267250:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r1, _LIT0
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    mov r7, #0x0
    ldr r1, [r1, r3]
    cmp r1, #0x0
    bls .L_178
    ldr r2, _LIT2
    mov r1, r0, lsl #0x1f
    add sl, r2, r3
    and r2, r1, #-2147483648
    mov r0, r0, lsl #0x10
    add r1, sl, #0x18
    orr r9, r2, #0x4e0000
    mov r0, r0, lsr #0x10
    ldr fp, _LIT3
    add r8, r1, #0x400
    orr r9, r9, #0x4000000
    and r4, r0, #0x1
    add r6, sp, #0x0
    mov r5, r7
.L_60:
    ldr r2, [r8]
    mov r0, r2, lsl #0x13
    cmp fp, r0, lsr #0x13
    bne .L_164
    mov r0, r2, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_164
    str r5, [r6]
    ldrh r1, [sp, #0x2]
    mov r0, r2, lsl #0x2
    mov r3, r0, lsr #0x18
    bic r0, r1, #0x1
    orr r0, r0, r4
    strh r0, [sp, #0x2]
    ldrh r0, [sp, #0x2]
    str r5, [r6, #0x4]
    mov r2, r2, lsl #0x12
    bic r0, r0, #0x3000
    orr r0, r0, #0x2000
    strh r0, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    ldrh ip, [sp, #0x4]
    ldr r0, _LIT4
    bic r1, r1, #0x3e
    orr r1, r1, #0x1c
    strh r1, [sp, #0x2]
    mov r1, r3, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    ldrh r2, [sp, #0x2]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xfc0
    orr r2, r2, #0x80
    and r0, ip, r0
    mov r1, r1, lsl #0x17
    orr r1, r0, r1, lsr #0x11
    mov r0, r6
    str r5, [r6, #0x8]
    str r5, [r6, #0xc]
    str r5, [r6, #0x10]
    str r5, [r6, #0x14]
    strh fp, [sp]
    strh r2, [sp, #0x2]
    strh r1, [sp, #0x4]
    bl func_ov002_021fea18
    cmp r0, #0x0
    bne .L_164
    ldr r1, [r8]
    mov r2, #0x0
    mov r0, r1, lsl #0x2
    mov r3, r0, lsr #0x18
    mov r0, r1, lsl #0x13
    mov ip, r1, lsl #0x12
    mov r1, r3, lsl #0x1
    mov r0, r0, lsr #0x13
    add r1, r1, ip, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r9, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    cmp r0, #0x0
    addne sp, sp, #0x18
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_164:
    ldr r0, [sl, #0x14]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x4
    bcc .L_60
.L_178:
    mov r0, #0x1
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001775
_LIT4: .word 0xffff803f
