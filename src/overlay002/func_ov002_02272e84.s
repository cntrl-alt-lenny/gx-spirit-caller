; func_ov002_02272e84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd310
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0226d814
        .extern func_ov002_02270ba0
        .extern func_ov002_022717f8
        .extern func_ov002_02290500
        .extern func_ov002_0229ade0
        .global func_ov002_02272e84
        .arm
func_ov002_02272e84:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    ldr r2, _LIT2
    mov r1, r1, lsl #0x9
    mov r1, r1, lsr #0x11
    cmp r1, r0
    ldr r0, _LIT0
    ldreq r2, _LIT3
    ldr r3, [r0, #0x18]
    mov r3, r3, lsl #0x18
    movs r3, r3, lsr #0x18
    beq .L_4c
    cmp r3, #0x1
    beq .L_94
    cmp r3, #0x2
    beq .L_ec
    b .L_1e8
.L_4c:
    mov r1, #0x0
    strb r1, [r0, #0x8]
    ldr r0, [r0]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r3, _LIT4
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_94:
    ldr r0, [r0]
    ldr r3, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r3, [r3, r0, lsl #0x2]
    cmp r3, #0x1
    bne .L_b8
    bl func_ov002_02290500
    b .L_c0
.L_b8:
    mov r0, r2
    bl func_ov002_022592ec
.L_c0:
    ldr r3, _LIT4
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_ec:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_1cc
    ldr r0, _LIT6
    ldr r2, _LIT7
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT8
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    add r5, r5, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r2, r5
    mov r0, #0x28
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    and r4, r4, #0xff
    ldrb r2, [r0, #0x8]
    and r3, r5, #0xff
    ldr r1, _LIT9
    orr r3, r4, r3, lsl #0x8
    mov r2, r2, lsl #0x1
    strh r3, [r1, r2]
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_ov002_0226d814
    ldr r1, _LIT0
    ldrb r2, [r1, #0x8]
    add r3, r2, #0x1
    and r2, r3, #0xff
    cmp r2, r0
    strb r3, [r1, #0x8]
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT4
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229ade0
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1e8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x00001a65
_LIT2: .word func_ov002_02270ba0
_LIT3: .word func_ov002_022717f8
_LIT4: .word data_ov002_022cd318
_LIT5: .word data_ov002_022cd744
_LIT6: .word data_ov002_022d016c
_LIT7: .word data_ov002_022cf16c
_LIT8: .word 0x00000868
_LIT9: .word data_ov002_022cd310
