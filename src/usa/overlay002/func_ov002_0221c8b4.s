; func_ov002_0221c8b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021bbe70
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ca310
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0227ab74
        .global func_ov002_0221c8b4
        .arm
func_ov002_0221c8b4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldrh r2, [r6]
    ldr r1, _LIT0
    mov r4, #0x0
    mov r5, r4
    cmp r2, r1
    mov r3, #0x2
    bgt .L_70
    cmp r2, r1
    bge .L_cc
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_48
    moveq r5, r3
    addeq r4, r0, #0x26
    b .L_e8
.L_48:
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_e8
    sub r0, r1, #0x2
    cmp r2, r0
    blt .L_e8
    beq .L_98
    cmp r2, r1
    beq .L_bc
    b .L_e8
.L_70:
    add r0, r1, #0x4f
    cmp r2, r0
    bgt .L_84
    beq .L_dc
    b .L_e8
.L_84:
    add r0, r1, #0xb3
    cmp r2, r0
    ldreq r4, _LIT3
    moveq r5, r3
    b .L_e8
.L_98:
    ldrh r0, [r6, #0x2]
    add r4, r1, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    mov r5, r0
    mov r3, #0x1
    b .L_e8
.L_bc:
    add r4, r1, #0x3
    ldrh r5, [r6, #0x8]
    mov r3, #0x1
    b .L_e8
.L_cc:
    mov r3, r4
    add r4, r1, #0xb
    mov r5, #0x3
    b .L_e8
.L_dc:
    mov r5, r3
    add r4, r1, #0x3f
    mov r3, #0x1
.L_e8:
    ldr r0, _LIT4
    ldr r1, [r0, #0x5a8]
    cmp r1, #0x7f
    beq .L_180
    cmp r1, #0x80
    bne .L_210
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, r5
    addlt sp, sp, #0x8
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    bl func_ov002_021e2a4c
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_180:
    ldr r0, [r0, #0x5ac]
    cmp r0, r5
    bge .L_200
    mov ip, #0x0
    sub r0, ip, #0x2000
    add r1, sp, #0x4
    ldr r2, _LIT5
    and r5, r0, #0x0
    and r0, r4, r2
    orr r2, r5, r0
    str ip, [r1]
    str r2, [sp, #0x4]
    ldrh r0, [r6, #0x2]
    bic r4, r2, #0x2000
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    orr r0, r4, r0, lsr #0x12
    str r0, [sp, #0x4]
    str r2, [sp]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ab74
    ldr r1, _LIT4
    add sp, sp, #0x8
    ldr r2, [r1, #0x5ac]
    mov r0, #0x7f
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, pc}
.L_200:
    bl func_ov002_021e2b6c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_210:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000019af
_LIT1: .word 0x000013fc
_LIT2: .word 0x00001810
_LIT3: .word 0x0000189c
_LIT4: .word data_ov002_022ce1a8
_LIT5: .word 0x00001fff
