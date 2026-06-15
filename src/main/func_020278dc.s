; func_020278dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0201d47c
        .extern func_02027e44
        .extern func_02027ee4
        .extern func_02028024
        .extern func_0208cc08
        .global func_020278dc
        .arm
func_020278dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    mov r6, r0
    add r7, sp, #0x0
    mov r5, r1
    mov ip, r6
    mov r4, #0x6
.L_7b4:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_7b4
    ldmia ip, {r0, r1}
    stmia r7, {r0, r1}
    mov r1, r6
    mov r0, #0x0
    mov r2, #0xe0
    ldrsh r4, [r6, #0xd4]
    bl Fill32
    add r7, sp, #0x0
    mov lr, r6
    mov ip, #0x6
.L_7ec:
    ldmia r7!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_7ec
    ldmia r7, {r0, r1}
    stmia lr, {r0, r1}
    strh r4, [r6, #0xd4]
    mov ip, r5
    add r4, r6, #0x68
    ldmia ip!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia ip, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    add r0, r5, #0x10
    add r3, r6, #0xb4
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldrh r1, [r6, #0xde]
    mvn r0, #0x0
    orr r1, r1, #0x6
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    strh r1, [r6, #0xde]
    strh r0, [r6, #0xcc]
    ldrb r0, [r6, #0xcf]
    bic r0, r0, #0x1
    strb r0, [r6, #0xcf]
    ldr r0, [r5, #0x1c]
    tst r0, #0x2
    ldrne r0, [r5, #0x8]
    movne r4, r0, lsr #0xe
    ldrsh r0, [r6, #0xd4]
    moveq r4, #0x0
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_a40
    b .L_89c
    b .L_8dc
    b .L_920
    b .L_950
    b .L_980
    b .L_9b0
    b .L_9e4
    b .L_a14
.L_89c:
    bl func_0208cc08
    ldr r2, _LIT0
    ldrb ip, [r5, #0x5]
    ldrh r1, [r2]
    ldrb lr, [r5, #0x4]
    cmp r0, #0x20
    and r1, r1, #0x43
    orr r1, r1, ip, lsl #0xe
    moveq r0, #0x0
    add r3, r4, #0x1
    orr r1, r1, lr, lsl #0x7
    movne r0, #0x1
    orr r1, r1, r3, lsl #0x2
    orr r0, r1, r0, lsl #0xd
    strh r0, [r2]
    b .L_a40
.L_8dc:
    bl func_0208cc08
    ldr r2, _LIT1
    ldrb ip, [r5, #0x5]
    ldrh r1, [r2]
    ldrb lr, [r5, #0x4]
    cmp r0, #0x20
    and r1, r1, #0x43
    orr r1, r1, ip, lsl #0xe
    orr r1, r1, lr, lsl #0x7
    moveq r0, #0x0
    add r3, r4, #0x1
    orr r1, r1, #0x200
    movne r0, #0x1
    orr r1, r1, r3, lsl #0x2
    orr r0, r1, r0, lsl #0xd
    strh r0, [r2]
    b .L_a40
.L_920:
    ldr r1, _LIT2
    ldrb r3, [r5, #0x5]
    ldrh r0, [r1]
    ldrb ip, [r5, #0x4]
    add r2, r4, #0x1
    and r0, r0, #0x43
    orr r0, r0, r3, lsl #0xe
    orr r0, r0, ip, lsl #0x7
    orr r0, r0, #0x400
    orr r0, r0, r2, lsl #0x2
    strh r0, [r1]
    b .L_a40
.L_950:
    ldr r1, _LIT3
    ldrb r3, [r5, #0x5]
    ldrh r0, [r1]
    ldrb ip, [r5, #0x4]
    add r2, r4, #0x1
    and r0, r0, #0x43
    orr r0, r0, r3, lsl #0xe
    orr r0, r0, ip, lsl #0x7
    orr r0, r0, #0x600
    orr r0, r0, r2, lsl #0x2
    strh r0, [r1]
    b .L_a40
.L_980:
    ldr r1, _LIT4
    ldrb r3, [r5, #0x5]
    ldrh r0, [r1]
    ldrb ip, [r5, #0x4]
    add r2, r4, #0x1
    and r0, r0, #0x43
    orr r0, r0, r3, lsl #0xe
    orr r0, r0, ip, lsl #0x7
    orr r0, r0, r2, lsl #0x2
    orr r0, r0, #0x2000
    strh r0, [r1]
    b .L_a40
.L_9b0:
    ldr r1, _LIT5
    ldrb r3, [r5, #0x5]
    ldrh r0, [r1]
    ldrb ip, [r5, #0x4]
    add r2, r4, #0x1
    and r0, r0, #0x43
    orr r0, r0, r3, lsl #0xe
    orr r0, r0, ip, lsl #0x7
    orr r0, r0, #0x200
    orr r0, r0, r2, lsl #0x2
    orr r0, r0, #0x2000
    strh r0, [r1]
    b .L_a40
.L_9e4:
    ldr r1, _LIT6
    ldrb r3, [r5, #0x5]
    ldrh r0, [r1]
    ldrb ip, [r5, #0x4]
    add r2, r4, #0x1
    and r0, r0, #0x43
    orr r0, r0, r3, lsl #0xe
    orr r0, r0, ip, lsl #0x7
    orr r0, r0, #0x400
    orr r0, r0, r2, lsl #0x2
    strh r0, [r1]
    b .L_a40
.L_a14:
    ldr r1, _LIT7
    ldrb r3, [r5, #0x5]
    ldrh r0, [r1]
    ldrb ip, [r5, #0x4]
    add r2, r4, #0x1
    and r0, r0, #0x43
    orr r0, r0, r3, lsl #0xe
    orr r0, r0, ip, lsl #0x7
    orr r0, r0, #0x600
    orr r0, r0, r2, lsl #0x2
    strh r0, [r1]
.L_a40:
    mov r0, r6
    bl func_02028024
    mov r0, r6
    bl func_02027ee4
    add r0, r6, #0x8c
    bl func_0201d47c
    ldr r0, [r6, #0xb4]
    ldr r1, [r6, #0xa4]
    mov r0, r0, asr #0x4
    bic r1, r1, #0x7f
    and r0, r0, #0x7f
    orr r1, r1, r0
    str r1, [r6, #0xa4]
    ldr r0, [r6, #0xb8]
    bic r1, r1, #0x3f80
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x19
    orr r0, r1, r0, lsr #0x12
    str r0, [r6, #0xa4]
    mov r1, #0x0
    str r1, [r6, #0x94]
    ldr r0, [r5, #0x1c]
    tst r0, #0x4
    subne r0, r1, #0x1
    ldreq r0, [r5, #0x8]
    subeq r0, r0, r4, lsl #0xe
    str r0, [r6, #0x98]
    ldr r0, [r5, #0x1c]
    tst r0, #0x8
    mvnne r0, #0x0
    ldreq r0, [r5, #0xc]
    moveq r0, r0, lsl #0x10
    moveq r0, r0, asr #0x10
    strh r0, [r6, #0x9c]
    ldr r0, [r5, #0x1c]
    ldrh r1, [r6, #0xa0]
    tst r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x10
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1b
    strh r0, [r6, #0xa0]
    ldrsh r0, [r6, #0xd4]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_c64
    b .L_b24
    b .L_b58
    b .L_b90
    b .L_bb4
    b .L_bd8
    b .L_bfc
    b .L_c20
    b .L_c44
.L_b24:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    strh r0, [r6, #0xa0]
    bl func_0208cc08
    cmp r0, #0x20
    moveq r0, #0x0
    ldr r1, [r6, #0xa4]
    movne r0, #0x2
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [r6, #0xa4]
    b .L_c64
.L_b58:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    strh r0, [r6, #0xa0]
    bl func_0208cc08
    cmp r0, #0x20
    moveq r0, #0x1
    ldr r1, [r6, #0xa4]
    movne r0, #0x3
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [r6, #0xa4]
    b .L_c64
.L_b90:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    orr r0, r0, #0x2
    strh r0, [r6, #0xa0]
    ldr r0, [r6, #0xa4]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    str r0, [r6, #0xa4]
    b .L_c64
.L_bb4:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    orr r0, r0, #0x3
    strh r0, [r6, #0xa0]
    ldr r0, [r6, #0xa4]
    bic r0, r0, #0x1c000
    orr r0, r0, #0xc000
    str r0, [r6, #0xa4]
    b .L_c64
.L_bd8:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    orr r0, r0, #0x5
    strh r0, [r6, #0xa0]
    ldr r0, [r6, #0xa4]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    str r0, [r6, #0xa4]
    b .L_c64
.L_bfc:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    orr r0, r0, #0x6
    strh r0, [r6, #0xa0]
    ldr r0, [r6, #0xa4]
    bic r0, r0, #0x1c000
    orr r0, r0, #0xc000
    str r0, [r6, #0xa4]
    b .L_c64
.L_c20:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    orr r0, r0, #0x7
    strh r0, [r6, #0xa0]
    ldr r0, [r6, #0xa4]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    str r0, [r6, #0xa4]
    b .L_c64
.L_c44:
    ldrh r0, [r6, #0xa0]
    bic r0, r0, #0xf
    orr r0, r0, #0x8
    strh r0, [r6, #0xa0]
    ldr r0, [r6, #0xa4]
    bic r0, r0, #0x1c000
    orr r0, r0, #0xc000
    str r0, [r6, #0xa4]
.L_c64:
    mov r0, r6
    bl func_02027e44
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x04000008
_LIT1: .word 0x0400000a
_LIT2: .word 0x0400000c
_LIT3: .word 0x0400000e
_LIT4: .word 0x04001008
_LIT5: .word 0x0400100a
_LIT6: .word 0x0400100c
_LIT7: .word 0x0400100e
