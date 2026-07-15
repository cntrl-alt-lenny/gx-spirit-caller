; func_ov022_021aab08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov022_021ab7c8
        .extern data_ov022_021ab804
        .extern data_ov022_021ab81e
        .extern data_ov022_021ab9c0
        .extern data_ov022_021aba08
        .extern func_0208c79c
        .extern func_0208c858
        .extern func_020b377c
        .global func_ov022_021aab08
        .arm
func_ov022_021aab08:
    stmdb sp!, {r3, r4, r5, lr}
    mov r0, #0x4000000
    ldr r1, [r0]
    add r3, r0, #0x1000
    bic r1, r1, #0x1f00
    orr r1, r1, #0x100
    str r1, [r0]
    ldr r2, [r3]
    ldr r1, _LIT0
    bic r2, r2, #0x1f00
    orr r2, r2, #0x100
    str r2, [r3]
    ldrh r2, [r0, #0x8]
    ldr r4, _LIT1
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r0, #0x8]
    ldrh r2, [r0, #0xa]
    bic r2, r2, #0x3
    strh r2, [r0, #0xa]
    ldrh r2, [r0, #0xc]
    bic r2, r2, #0x3
    orr r2, r2, #0x1
    strh r2, [r0, #0xc]
    ldrh r2, [r0, #0xe]
    bic r2, r2, #0x3
    orr r2, r2, #0x2
    strh r2, [r0, #0xe]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1, #0x6]
    bl func_0208c858
    ldr r2, _LIT2
    ldr r0, _LIT3
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    ldr r1, [r0, #0x54]
    subs r1, r1, #0x1000
    str r1, [r0, #0x54]
    movmi r0, #0x0
    strmi r0, [r4, #0xc]
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x0
    bl func_020b377c
    mov r5, r0
    ldr r0, _LIT4
    mov r1, r5
    bl func_0208c79c
    ldr r0, _LIT5
    mov r1, r5
    bl func_0208c79c
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_740
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT5
    mov r1, #0x0
    bl func_0208c79c
    ldr r1, _LIT3
    mov r0, #0x0
    str r0, [r1, #0x50]
    str r0, [r1, #0x54]
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, _LIT6
    bic r2, r2, #0x1f00
    orr r2, r2, #0x1100
    str r2, [r3]
    ldr r2, [r1, #0x4]
    mov r1, #0x1c
    mov r2, r2, lsl #0x1d
    mov ip, r2, lsr #0x1d
    mul r3, ip, r1
    ldr r1, _LIT7
    add r2, r4, #0x1000
    ldrsh r1, [r1, r3]
    str r0, [r2, #0x140]
    cmp r1, #0x0
    ble .L_738
    ldr r3, _LIT8
    mov r2, #0x1c
    mla r5, ip, r2, r3
    add lr, r4, #0x1140
    ldr r4, _LIT9
    mvn r2, #0x0
.L_700:
    mov r3, r0, lsl #0x1
    ldrsh r3, [r3, r5]
    cmp r3, r2
    ldreq r3, [lr]
    addeq r3, r3, #0x8
    beq .L_728
    mov r3, r3, lsl #0x1
    ldrh r3, [r4, r3]
    ldr ip, [lr]
    add r3, ip, r3
.L_728:
    add r0, r0, #0x1
    str r3, [lr]
    cmp r0, r1
    blt .L_700
.L_738:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_740:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x04001008
_LIT1: .word data_ov022_021aba08
_LIT2: .word 0x04001000
_LIT3: .word data_ov022_021ab9c0
_LIT4: .word 0x0400006c
_LIT5: .word 0x0400106c
_LIT6: .word data_02104e6c
_LIT7: .word data_ov022_021ab81e
_LIT8: .word data_ov022_021ab804
_LIT9: .word data_ov022_021ab7c8
