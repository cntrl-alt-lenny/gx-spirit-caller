; func_ov002_022333b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021c84e0
        .extern func_ov002_022107b4
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0227adb8
        .extern func_ov002_02290500
        .global func_ov002_022333b4
        .arm
func_ov002_022333b4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_d8
    cmp r1, #0x7f
    beq .L_94
    cmp r1, #0x80
    bne .L_12c
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_8c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_8c
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c84e0
    strh r0, [r4, #0xc]
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_8c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_94:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_c0
    ldrh r1, [r4]
    ldr r2, _LIT2
    bl func_ov002_02290500
    b .L_d0
.L_c0:
    ldr r1, _LIT3
    bl func_ov002_021ae400
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_d0:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_d8:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    ldrh r3, [r4]
    ldr ip, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT5
    and r4, r0, #0x1
    mla ip, r4, r1, ip
    ldr r2, _LIT6
    mov r3, r3, lsl #0x10
    ldr r1, [r2, #0xd78]
    add r2, ip, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227adb8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_12c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022107b4
_LIT3: .word 0x0000011e
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022d016c
