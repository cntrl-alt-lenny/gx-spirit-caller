; func_ov002_021d6434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_0202b878
        .extern func_0202f9e8
        .extern func_ov002_021bb068
        .extern func_ov002_021c1d28
        .extern func_ov002_021c1e20
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .global func_ov002_021d6434
        .arm
func_ov002_021d6434:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldr r4, _LIT0
    and r5, sl, #0x1
    mov r9, r1
    mov r0, #0x14
    mul r6, r5, r4
    mul r5, r9, r0
    ldr r1, _LIT1
    movs r7, r3
    add r0, r1, r6
    add r0, r0, r5
    ldr r0, [r0, #0x30]
    moveq fp, #0x1
    mov r0, r0, lsl #0x13
    mov r4, r0, lsr #0x13
    mov r0, r7
    mov r8, r2
    movne fp, #0x0
    bl func_0202b878
    cmp r0, #0x17
    bne .L_7c
    ldr r2, [sp, #0x30]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c1e20
    cmp r0, #0x0
    beq .L_a8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7c:
    mov r0, r7
    bl func_0202b878
    cmp r0, #0x16
    bne .L_a8
    ldr r2, [sp, #0x30]
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c1d28
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a8:
    cmp r4, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    add r2, r2, r6
    add r0, r0, r6
    ldr r1, _LIT3
    add r2, r2, #0x30
    str r0, [sp, #0x4]
    ldrh r0, [r0, r5]
    add r1, r1, r6
    ldrh ip, [r5, r1]
    cmp r0, #0x0
    ldr r3, [r2, r5]
    ldr r0, [sp, #0x8]
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    mov r1, #0x200
    moveq r7, #0x1
    movne r7, #0x0
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r3, r2, r3, lsr #0x1f
    bic r0, r0, #0x200
    mov r2, sl, lsl #0x1f
    orr r0, r0, r2, lsr #0x16
    rsb r1, r1, #0x0
    bic r2, r0, #0x3c00
    and r0, r3, r1, lsr #0x17
    mov r3, r9, lsl #0x1c
    orr r2, r2, r3, lsr #0x12
    ldr r3, [sp, #0x30]
    mov ip, ip, lsl #0x1f
    bic r2, r2, #0x4000
    orr r2, r2, ip, lsr #0x11
    bic r2, r2, #0x8000
    mov ip, r7, lsl #0x1f
    orr r2, r2, ip, lsr #0x10
    and r1, r2, r1
    orr r0, r1, r0
    mov r3, r3, lsl #0x1f
    bic r0, r0, #0x10000
    orr r0, r0, r3, lsr #0xf
    bic r0, r0, #0x20000
    cmp r8, #0x0
    str r0, [sp, #0x8]
    beq .L_17c
    mov r0, r4
    bl func_0202f9e8
    cmp r8, r0
    movle r8, #0x1
    movgt r8, #0x0
.L_17c:
    cmp fp, #0x0
    mov r3, #0x0
    beq .L_198
    cmp r9, #0x5
    bge .L_198
    cmp r7, #0x0
    movne r3, #0x1
.L_198:
    ldr r0, [sp, #0x4]
    cmp sl, #0x0
    ldrh r0, [r0, r5]
    movne r1, #0x8000
    moveq r1, #0x0
    cmp r0, #0x0
    orr r0, r1, #0x35
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, r0, lsl #0x10
    mov r1, r9, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    cmp r9, #0x5
    addge sp, sp, #0xc
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r7, #0x0
    beq .L_2b0
    ldr r0, _LIT4
    cmp r4, r0
    ldrne r0, _LIT5
    cmpne r4, r0
    bne .L_240
    cmp fp, #0x0
    cmpeq r8, #0x0
    beq .L_240
    ldr r0, _LIT6
    bl func_ov002_021bb068
    cmp r0, #0x0
    bne .L_240
    ldr r2, _LIT4
    mov r7, #0x0
    mov r0, sl
    mov r1, r9
    mov r3, #0x2
    str r7, [sp]
    bl func_ov002_021d59cc
.L_240:
    cmp r8, #0x0
    beq .L_29c
    mov r0, sl, lsl #0x1f
    ldr r2, [sp, #0x8]
    and r0, r0, #-2147483648
    orr r7, r0, #0x8200000
    mov r3, r9, lsl #0x10
    mov r0, r2, lsl #0x17
    mov r0, r0, lsr #0x17
    ldr r8, _LIT2
    mov r1, r0, lsl #0x10
    orr r7, r7, #0x10000000
    and r3, r3, #0x1f0000
    mov r0, r4, lsl #0x10
    orr r3, r7, r3
    add r6, r8, r6
    mov r4, #0x1
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    strh r4, [r6, r5]
    bl func_ov002_021e30b4
    mov r0, #0x0
    strh r0, [r6, r5]
.L_29c:
    ldr r1, [sp, #0x8]
    mov r0, #0xc
    bl func_ov002_02244fe4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2b0:
    ldr r1, [sp, #0x8]
    mov r0, #0x9
    bl func_ov002_02244fe4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
_LIT4: .word 0x00001174
_LIT5: .word 0x0000133b
_LIT6: .word 0x0000148e
