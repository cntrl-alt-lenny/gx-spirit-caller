; func_ov002_0227af30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_0202b8a8
        .extern func_ov002_021bae7c
        .extern func_ov002_021c4c9c
        .global func_ov002_0227af30
        .arm
func_ov002_0227af30:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r3, _LIT0
    and r5, r7, #0x1
    mov r4, #0x14
    mul r3, r5, r3
    ldr r6, _LIT1
    mul r5, r1, r4
    add r4, r6, r3
    ldrh ip, [r4, r5]
    mov r6, r2
    cmp ip, #0x0
    bne .L_138
    ldr lr, _LIT2
    ldr ip, _LIT3
    add lr, lr, r3
    add lr, lr, r5
    add r3, ip, r3
    ldr ip, [lr, #0x30]
    ldr r3, [r5, r3]
    mov ip, ip, lsl #0x13
    mov r3, r3, lsr #0x8
    tst r3, #0x1
    mov r3, ip, lsr #0x13
    beq .L_7c
    mov r3, #0x1
    strh r3, [r4, r5]
    bl func_ov002_021c4c9c
    mov r0, #0x0
    strh r0, [r4, r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7c:
    mov r0, r3
    bl func_0202b8a8
    rsb r2, r7, #0x1
    ldr r1, _LIT0
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    str r0, [r6, #0x10]
    ldr r0, [r1, r3]
    cmp r0, #0x3e8
    blt .L_c0
    ldr r1, _LIT4
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_f4
.L_c0:
    ldr r0, [r6, #0x10]
    cmp r0, #0x4
    bgt .L_e0
    ldr r1, _LIT5
    mov r0, #0x7d0
    str r1, [r6, #0x14]
    str r0, [r6, #0x18]
    b .L_124
.L_e0:
    ldr r1, _LIT6
    mov r0, #0x960
    str r1, [r6, #0x14]
    str r0, [r6, #0x18]
    b .L_124
.L_f4:
    ldr r0, [r6, #0x10]
    cmp r0, #0x4
    bgt .L_114
    mov r0, #0x4b0
    str r0, [r6, #0x14]
    mov r0, #0x3e8
    str r0, [r6, #0x18]
    b .L_124
.L_114:
    ldr r0, _LIT7
    str r0, [r6, #0x14]
    sub r0, r0, #0x12c
    str r0, [r6, #0x18]
.L_124:
    mov r0, #0x0
    str r0, [r6, #0x8]
    str r0, [r6, #0x4]
    str r0, [r6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_138:
    bl func_ov002_021c4c9c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1ac
_LIT4: .word 0x0000130c
_LIT5: .word 0x00000514
_LIT6: .word 0x000006a4
_LIT7: .word 0x00000834
