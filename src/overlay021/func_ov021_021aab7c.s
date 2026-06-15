; func_ov021_021aab7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov021_021ac874
        .extern func_0200617c
        .extern func_02022234
        .extern func_0202224c
        .extern func_ov021_021aae68
        .global func_ov021_021aab7c
        .arm
func_ov021_021aab7c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r0, #0x0
    bl func_0202224c
    mov r4, r0
    ldr r1, [r5, #0x5c]
    tst r4, #0x1
    add r0, r1, #0x1
    str r0, [r5, #0x5c]
    ldrne r0, [r5, #0x60]
    addne r0, r0, #0x1
    strne r0, [r5, #0x60]
    ldr r0, [r5, #0x5c]
    cmp r0, #0x69
    blt .L_e4
    ldr r0, [r5, #0x60]
    cmp r0, #0xe0
    bge .L_e4
    ldr r0, [r5, #0x54]
    add r0, r0, #0x1
    str r0, [r5, #0x54]
    cmp r0, #0x2
    blt .L_e4
    mov r0, #0x0
    str r0, [r5, #0x54]
    ldr r0, [r5, #0x50]
    subs r0, r0, #0x1
    str r0, [r5, #0x50]
    movmi r0, #0xff
    strmi r0, [r5, #0x50]
    ldr r0, [r5, #0x58]
    add r0, r0, #0x1
    str r0, [r5, #0x58]
    cmp r0, #0x10
    blt .L_e4
    mov r3, #0x0
    str r3, [r5, #0x58]
    ldr r2, [r5, #0x48]
    ldr r0, [r5, #0x44]
    ldr r1, [r5, #0x4c]
    cmp r2, r0
    mov r0, r5
    bge .L_b4
    bl func_ov021_021aae68
    b .L_c0
.L_b4:
    sub r2, r3, #0x1
    bl func_ov021_021aae68
    orr r4, r4, #0x1
.L_c0:
    ldr r0, [r5, #0x4c]
    add r0, r0, #0x1
    str r0, [r5, #0x4c]
    cmp r0, #0x10
    movge r0, #0x0
    strge r0, [r5, #0x4c]
    ldr r0, [r5, #0x48]
    add r0, r0, #0x1
    str r0, [r5, #0x48]
.L_e4:
    ldr r1, [r5, #0x50]
    ldr r0, _LIT0
    rsb r1, r1, #0x0
    and r1, r0, r1, lsl #0x10
    ldr r0, _LIT1
    orr r1, r1, #0x1f8
    str r1, [r0]
    ldr r1, [r5, #0x5c]
    ldr ip, _LIT2
    cmp r1, ip
    blt .L_180
    sub r0, ip, #0x30c
    add r7, r1, r0
    ldr r1, _LIT3
    mov r3, r7, lsr #0x1f
    smull r0, lr, r1, r7
    add lr, r7, lr
    smull r0, r6, r1, r7
    add r6, r7, r6
    add lr, r3, lr, asr #0x9
    add r2, ip, #0xa5
    smull r0, r1, r2, lr
    adds r6, r3, r6, asr #0x9
    sub lr, r7, r0
    bic r4, r4, #0x6
    bmi .L_180
    cmp r6, #0xb
    bge .L_180
    cmp lr, #0x0
    bne .L_174
    ldr r1, _LIT4
    mov r0, #0x2
    ldr r1, [r1, r6, lsl #0x2]
    bl func_02022234
    orr r4, r4, #0x2
    b .L_180
.L_174:
    add r0, ip, #0x4b
    cmp lr, r0
    orreq r4, r4, #0x4
.L_180:
    ldr r1, _LIT5
    ldr r2, [r5, #0x60]
    ldr r0, _LIT6
    ldrh r1, [r1, #0x54]
    cmp r2, r0
    blt .L_1b0
    tst r1, #0x9
    bne .L_1ac
    bl func_0200617c
    cmp r0, #0x0
    beq .L_1b0
.L_1ac:
    orr r4, r4, #0x8
.L_1b0:
    mov r1, r4
    mov r0, #0x0
    bl func_02022234
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x01ff0000
_LIT1: .word 0x0400101c
_LIT2: .word 0x00000186
_LIT3: .word 0xec2a6fa1
_LIT4: .word data_ov021_021ac874
_LIT5: .word data_02104bac
_LIT6: .word 0x0000031b
