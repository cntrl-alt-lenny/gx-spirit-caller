; func_ov002_02223b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf17c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae514
        .extern func_ov002_021e1870
        .extern func_ov002_021e286c
        .extern func_ov002_022287c4
        .extern func_ov002_0226b054
        .extern func_ov002_0226b0d0
        .extern func_ov002_0226b194
        .extern func_ov002_02281c90
        .global func_ov002_02223b74
        .arm
func_ov002_02223b74:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldrh r2, [r0, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x2
    bne .L_230
    bl func_ov002_022287c4
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_230:
    ldr r3, _LIT0
    ldr r1, [r3, #0x5a8]
    sub r1, r1, #0x7b
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_3b8
    b .L_39c
    b .L_384
    b .L_334
    b .L_310
    b .L_2e0
    b .L_260
.L_260:
    mov r0, r2, lsl #0x1f
    mov ip, r0, lsr #0x1f
    rsb r0, ip, #0x1
    ldr r1, _LIT1
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    cmp r1, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT3
    ldr r1, [r1, ip, lsl #0x2]
    cmp r1, #0x1
    bne .L_2b0
    bl func_ov002_02281c90
    ldr r1, _LIT4
    str r0, [r1, #0xd44]
    b .L_2d4
.L_2b0:
    mov r1, #0x1b8
    mov r0, #0x0
    str r0, [sp]
    mov ip, #0xf
    add r2, r1, #0x1
    add r3, r1, #0x2
    mov r0, #0x104
    str ip, [sp, #0x4]
    bl func_ov002_021ae514
.L_2d4:
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_2e0:
    ldr r1, _LIT4
    ldr r2, [r1, #0xd44]
    str r2, [r3, #0x5ac]
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0d0
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_310:
    mov r1, r2, lsl #0x1f
    mov ip, r1, lsr #0x1f
    ldrh r1, [r0]
    ldr r2, [r3, #0x5ac]
    rsb r0, ip, #0x1
    bl func_ov002_0226b194
    add sp, sp, #0x8
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_334:
    ldr r0, _LIT5
    ldrh r1, [r0, #0xb0]
    cmp r1, #0x0
    beq .L_368
    mov r1, r2, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldrh r1, [r0, #0xb2]
    rsb r0, r2, #0x1
    mov r2, #0x1
    bl func_ov002_021e1870
    add sp, sp, #0x8
    mov r0, #0x7b
    ldmia sp!, {r3, pc}
.L_368:
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xd
    bl func_ov002_021ae400
    add sp, sp, #0x8
    mov r0, #0x7c
    ldmia sp!, {r3, pc}
.L_384:
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b054
    add sp, sp, #0x8
    mov r0, #0x7b
    ldmia sp!, {r3, pc}
.L_39c:
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e286c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_3b8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
_LIT3: .word data_ov002_022cd744
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022d0e6c
