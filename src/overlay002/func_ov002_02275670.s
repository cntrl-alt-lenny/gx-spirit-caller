; func_ov002_02275670 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd310
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021dec2c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02271ab4
        .extern func_ov002_0227548c
        .extern func_ov002_02290500
        .global func_ov002_02275670
        .arm
func_ov002_02275670:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_ad0
    bl func_ov002_02271ab4
    ldmia sp!, {r4, pc}
.L_ad0:
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_c80
    b .L_b00
    b .L_b84
    b .L_b1c
    b .L_b84
    b .L_bfc
    b .L_c78
.L_b00:
    mov r1, #0x0
    strb r1, [r0, #0x8]
    ldr r0, [r0]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_b1c:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_b50
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_b58
.L_b50:
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_b58:
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
    ldmia sp!, {r4, pc}
.L_b84:
    bl func_ov002_022593f4
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r0, _LIT4
    ldrb r4, [r1, #0x8]
    ldr r2, _LIT5
    ldr r3, _LIT3
    add ip, r4, #0x1
    strb ip, [r1, #0x8]
    ldr ip, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr lr, [r0, #0xd70]
    add r0, ip, r1
    and r1, lr, #0xff
    and r0, r0, #0xff
    orr r1, r1, r0, lsl #0x8
    mov r0, r4, lsl #0x1
    strh r1, [r2, r0]
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, pc}
.L_bfc:
    bl func_ov002_021e2b3c
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r0, [r0, #0x10]
    mov r3, r2
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021dec2c
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r0, [r0, #0x12]
    mov r3, r2
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021dec2c
    bl func_ov002_021e2c5c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, _LIT3
    strb r0, [r1, #0x8]
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, pc}
.L_c78:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_c80:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_0227548c
_LIT3: .word data_ov002_022cd318
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cd310
