; func_ov018_021ab414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov018_021ad780
        .extern data_ov018_021ad7c8
        .extern func_0203737c
        .extern func_020379a8
        .extern func_02037ae4
        .extern func_0208c79c
        .extern func_0208c858
        .extern func_020b377c
        .global func_ov018_021ab414
        .arm
func_ov018_021ab414:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x54]
    ldr r0, [r0, #0x50]
    cmp r1, r0
    bne .L_100
    bl func_02037ae4
    mvn r1, #0x0
    cmp r0, r1
    bne .L_48
    mov r0, #0x0
    bl func_020379a8
    mov r2, #0x0
    sub r3, r2, #0x1
    mov r0, #0x30
    mov r1, #0x1
    bl func_0203737c
.L_48:
    mov r0, #0x4000000
    ldr r1, [r0]
    add r3, r0, #0x1000
    bic r1, r1, #0x1f00
    orr r1, r1, #0x800
    str r1, [r0]
    ldr r2, [r3]
    ldr r1, _LIT2
    bic r2, r2, #0x1f00
    orr r2, r2, #0x800
    str r2, [r3]
    ldrh r2, [r0, #0x8]
    bic r2, r2, #0x3
    strh r2, [r0, #0x8]
    ldrh r2, [r0, #0xa]
    bic r2, r2, #0x3
    orr r2, r2, #0x1
    strh r2, [r0, #0xa]
    ldrh r2, [r0, #0xc]
    bic r2, r2, #0x3
    orr r2, r2, #0x2
    strh r2, [r0, #0xc]
    ldrh r2, [r0, #0xe]
    bic r2, r2, #0x3
    orr r2, r2, #0x3
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
    ldr r1, _LIT3
    ldr r0, [r1]
    orr r0, r0, #0x10000
    str r0, [r1]
.L_100:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    subs r0, r0, #0x1000
    str r0, [r4, #0xc]
    movmi r0, #0x0
    strmi r0, [r4, #0xc]
    ldr r0, [r4, #0xc]
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
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT5
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT0
    mov r1, #0x3c000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x1
    str r0, [r4]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov018_021ad780
_LIT1: .word data_ov018_021ad7c8
_LIT2: .word 0x04001008
_LIT3: .word 0x04001000
_LIT4: .word 0x0400006c
_LIT5: .word 0x0400106c
