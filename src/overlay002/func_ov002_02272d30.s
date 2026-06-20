; func_ov002_02272d30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02270ba0
        .extern func_ov002_02271ab4
        .extern func_ov002_02290500
        .extern func_ov002_0229ade0
        .global func_ov002_02272d30
        .arm
func_ov002_02272d30:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_93c
    bl func_ov002_02271ab4
    ldmia sp!, {r3, r4, r5, pc}
.L_93c:
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_958
    cmp r1, #0x1
    beq .L_9c4
    b .L_a4c
.L_958:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_988
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_998
.L_988:
    mov r1, #0x12
    bl func_ov002_021ae400
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_998:
    ldr r3, _LIT3
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
.L_9c4:
    bl func_ov002_022593f4
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT6
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
    ldr r1, _LIT0
    mov r0, #0x1
    and r3, r4, #0xff
    and r2, r5, #0xff
    strb r0, [r1, #0x8]
    orr r2, r3, r2, lsl #0x8
    strh r2, [r1, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
.L_a4c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_02270ba0
_LIT3: .word data_ov002_022cd318
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x00000868
