; func_02039180 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0219b2fc
        .extern data_0219b31c
        .extern data_0219b330
        .extern data_0219c480
        .extern data_0219c494
        .extern func_02038c84
        .extern func_02038e58
        .extern func_02038fb0
        .extern func_02039990
        .extern func_0203a84c
        .extern func_0203a898
        .extern func_0207d12c
        .extern func_0207d3ac
        .extern func_0207d430
        .extern func_02089008
        .extern func_02089024
        .extern func_02089260
        .extern func_020892c4
        .extern func_02092904
        .global func_02039180
        .arm
func_02039180:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    ldr r4, _LIT0
    str r0, [sp, #0x8]
    ldrh r0, [r4, #0x4]
    mov sl, r1
    str r2, [sp, #0xc]
    mov r9, r3
    cmp r0, #0x0
    beq .L_564
    mov r0, sl
    bl func_020892c4
    movs r5, r0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0xc]
    bl func_02089260
    movs r4, r0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r5
    mov r1, r4
    bl func_02039990
    ldr r0, [r4]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x8
    bl func_02089024
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_564:
    tst r9, #0x400
    beq .L_588
    mov r0, #0x2
    tst r9, #0x200
    str r0, [sp, #0x14]
    movne r0, #0x1
    mvn r6, #0x0
    strne r0, [sp, #0x14]
    b .L_594
.L_588:
    mov r0, #0x0
    str r0, [sp, #0x14]
    mov r6, #0x1
.L_594:
    mov r0, sl
    bl func_020892c4
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r0]
    str r0, [sp, #0x18]
    ldr r0, [sp, #0xc]
    bl func_02089260
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r0]
    ldr r0, _LIT1
    mov r2, r1, lsl #0x8
    ldr r1, [r0]
    ldr r0, [sp, #0xc]
    mov fp, r2, lsr #0x8
    add r1, r1, r0, lsl #0x2
    mov r0, fp
    ldrh r5, [r1, #0x2]
    bl func_0203a84c
    movs r4, r0
    beq .L_60c
    ldrb r0, [r4, #0x1c]
    add r0, r0, #0x1
    strb r0, [r4, #0x1c]
    b .L_6d4
.L_60c:
    mov r0, r5, lsl #0x2
    add r8, r0, #0x3c
    ldr r0, _LIT2
    add r1, r8, r5, lsl #0x2
    add r7, r1, #0x4
    ldr r0, [r0]
    add r1, r7, #0x20
    mov r2, r6, lsl #0x5
    bl func_02038c84
    movs r4, r0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r1, r7, #0x40
    bl func_02092904
    str fp, [r4, #0x14]
    mov r0, #0x0
    str r0, [r4, #0x8]
    mov r1, #0x1
    strb r1, [r4, #0x1c]
    ldr r1, [sp, #0x14]
    str r0, [r4, #0x18]
    strb r1, [r4, #0x1f]
    mov r1, #0x7
    strb r1, [r4, #0x1e]
    str r8, [r4, #0xc]
    mov r1, #0x2
    add r2, r4, r7
    strb r1, [r4, #0x1d]
    tst r9, #0x8000
    str r0, [r2, #0x1c]
    beq .L_6c8
    str r0, [sp]
    mov r1, fp
    mov r3, r8
    add r2, r4, #0x20
    str r0, [sp, #0x4]
    bl func_02038e58
    cmp r8, r0
    addne sp, sp, #0x1c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r2, #0x1
    mov r0, fp
    add r1, r4, #0x20
    strb r2, [r4, #0x1d]
    bl func_02089008
.L_6c8:
    ldr r0, _LIT3
    mov r1, r4
    bl func_0207d12c
.L_6d4:
    ldr r0, _LIT0
    ldrsh r0, [r0, #0x6]
    orr r0, r0, #0x6f0000
    orr r0, r0, #0x8000000
    str r0, [sp, #0x10]
    bl func_0203a84c
    movs r7, r0
    beq .L_704
    ldrb r0, [r7, #0x1c]
    add r0, r0, #0x1
    strb r0, [r7, #0x1c]
    b .L_868
.L_704:
    ldr r0, _LIT4
    mov r2, r5, lsl #0x2
    ldr r1, [r0]
    mov r0, sl, lsl #0x1
    ldrh r0, [r1, r0]
    add r8, r2, #0x34
    tst r9, #0x1000
    add r0, r8, r0, lsl #0x5
    add r9, r0, #0x20
    mov r7, #0x0
    beq .L_764
    ldr r0, _LIT2
    mov r1, #0x20
    ldr r0, [r0]
    bl func_0207d3ac
    cmp r0, r9
    bcc .L_790
    ldr r0, _LIT2
    mov r1, r8
    ldr r0, [r0]
    mov r2, r6, lsl #0x5
    bl func_02038c84
    mov r7, r0
    b .L_790
.L_764:
    ldr r0, _LIT2
    ldr r0, [r0]
    bl func_0207d430
    cmp r0, r9
    bcc .L_790
    ldr r0, _LIT2
    mov r1, r8
    ldr r0, [r0]
    mov r2, r6, lsl #0x5
    bl func_02038c84
    mov r7, r0
.L_790:
    cmp r7, #0x0
    bne .L_7c0
    ldrb r0, [r4, #0x1c]
    sub r0, r0, #0x1
    strb r0, [r4, #0x1c]
    tst r0, #0xff
    bne .L_7b4
    mov r0, r4
    bl func_0203a898
.L_7b4:
    add sp, sp, #0x1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7c0:
    mov r0, r7
    mov r1, r8
    bl func_02092904
    ldr r0, [sp, #0x10]
    mov r2, #0x1
    str r0, [r7, #0x14]
    mov r0, #0x0
    str r0, [r7, #0x8]
    strb r2, [r7, #0x1c]
    ldr r1, [sp, #0x14]
    str r0, [r7, #0x18]
    strb r1, [r7, #0x1f]
    mov r1, #0x4
    strb r1, [r7, #0x1e]
    str r8, [r7, #0xc]
    strb r2, [r7, #0x1d]
    add r1, r7, #0x20
    sub r2, r8, #0x20
    bl Fill32
    strh r5, [r7, #0x30]
    ldr r0, [sp, #0xc]
    strh sl, [r7, #0x28]
    strh r0, [r7, #0x2c]
    ldr r0, [sp, #0x18]
    strh r0, [r7, #0x2a]
    ldr r0, _LIT4
    strh fp, [r7, #0x2e]
    ldr r1, [r0]
    mov r0, sl, lsl #0x1
    ldrh r2, [r1, r0]
    ldr r0, _LIT3
    mov r1, r7
    mov r2, r2, lsl #0x5
    str r2, [r7, #0x24]
    mov r2, #0x0
    str r2, [r7, #0x20]
    bl func_0207d12c
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    strb r1, [r0, #0x57]
    mov r1, #0x8
    strb r1, [r0, #0x56]
.L_868:
    ldr r1, [sp, #0x8]
    ldr r2, _LIT0
    str r7, [r1, #0x10]
    mov r1, #0x81
    mov r0, r4
    strh r1, [r2]
    bl func_02038fb0
    mov r0, r4
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219c480
_LIT1: .word data_0219b2fc
_LIT2: .word data_0219b330
_LIT3: .word data_0219c494
_LIT4: .word data_0219b31c
