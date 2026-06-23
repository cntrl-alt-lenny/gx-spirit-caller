; func_ov011_021cbe64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_0201e870
        .extern func_ov011_021cbaa0
        .global func_ov011_021cbe64
        .arm
func_ov011_021cbe64:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    ldr r0, _LIT0
    mov r4, #0x0
    ldr r3, [r0, #0x26c]
    ldr r1, [r0, #0x238]
    ldr r2, [r0, #0x27c]
    sub r1, r3, r1
    ldr r3, [r0, #0x270]
    ldr r0, [r0, #0x23c]
    mov r2, r2, lsl #0x1d
    sub r0, r3, r0
    mov r5, r2, lsr #0x1d
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    add r2, sp, #0xc
    stmia sp, {r2, r4}
    mov r0, r5
    sub r1, r4, #0x1
    str r4, [sp, #0x8]
    mov r2, #0x2
    mov r3, #0x1a
    ldr r4, _LIT1
    bl func_ov011_021cbaa0
    sub r0, r5, #0x1
    cmp r0, #0x1
    addhi sp, sp, #0x24
    ldmhiia sp!, {r4, r5, pc}
    ldr r1, [r4, #0x248]
    ldr r0, [r4, #0x250]
    mov r2, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    rsbs r1, r1, r2, lsr #0x10
    movpl r2, r1
    rsbmi r2, r1, #0x0
    cmp r2, #0x8000
    bge .L_3e8
    cmp r1, #0x0
    ble .L_3e0
    cmp r0, #0x0
    bne .L_3d8
    cmp r1, #0x0
    movge lr, r1
    rsblt lr, r1, #0x0
    ldr r3, _LIT2
    mov r5, lr, lsl #0x15
    smull r2, ip, r3, r5
    add ip, ip, lr, lsl #0x15
    mov r2, r5, lsr #0x1f
    add ip, r2, ip, asr #0xe
    add r0, r0, ip
.L_3d8:
    add r0, r0, #0x4000
    b .L_42c
.L_3e0:
    sub r0, r0, #0x4000
    b .L_42c
.L_3e8:
    cmp r1, #0x0
    ble .L_428
    cmp r0, #0x0
    bne .L_420
    cmp r1, #0x0
    movge lr, r1
    rsblt lr, r1, #0x0
    ldr r3, _LIT2
    mov r5, lr, lsl #0x15
    smull r2, ip, r3, r5
    add ip, ip, lr, lsl #0x15
    mov r2, r5, lsr #0x1f
    add ip, r2, ip, asr #0xe
    sub r0, r0, ip
.L_420:
    sub r0, r0, #0x4000
    b .L_42c
.L_428:
    add r0, r0, #0x4000
.L_42c:
    ldr r2, [r4, #0x248]
    movs r5, r0, asr #0xc
    add r3, r5, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    rsbmi r5, r5, #0x0
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    str r2, [r4, #0x248]
    cmp r1, r5
    movlt r0, r0, asr #0x1
    str r0, [r4, #0x250]
    ldr r0, [r4, #0x248]
    mov r2, #0x1000
    mov r0, r0, lsr #0x10
    add r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    str r1, [sp]
    add r0, sp, #0x14
    str r0, [sp, #0x4]
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x0
    bl func_0201e870
    ldr r0, [r4, #0x248]
    ldr r2, _LIT3
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r4, [r2, r3]
    ldrsh r2, [r2, r1]
    ldr r5, [sp, #0xc]
    mov r1, #0x19
    ldr r3, [sp, #0x10]
    smlabb r4, r4, r1, r5
    smlabb r2, r2, r1, r3
    str r4, [sp, #0xc]
    str r2, [sp, #0x10]
    add r1, sp, #0xc
    str r1, [sp]
    mov r1, #0x2000
    mov r0, #0x4
    str r1, [sp, #0x4]
    add r4, sp, #0x14
    sub r1, r0, #0x5
    mov r2, #0x2
    mov r3, #0x1a
    str r4, [sp, #0x8]
    bl func_ov011_021cbaa0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0x80010003
_LIT3: .word data_020bee8c
