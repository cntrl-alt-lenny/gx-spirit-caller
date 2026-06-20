; func_ov002_022360ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021c2e34
        .extern func_ov002_021ca698
        .extern func_ov002_021d8128
        .extern func_ov002_021de64c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_022360ac
        .arm
func_ov002_022360ac:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_408
    b .L_3fc
    b .L_39c
    b .L_370
    b .L_2d0
.L_2d0:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_368
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_368
    mov r0, r6
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    bl func_ov002_021de64c
    cmp r0, #0x0
    beq .L_368
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r1, [r0, #0x30]
    mov r0, #0x7f
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    strh r1, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
.L_368:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_370:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    bl func_ov002_021ca698
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021e2b3c
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_39c:
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6, #0xc]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c2e34
    movs r4, r0
    movmi r0, #0x7d
    ldmmiia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, r4, lsl #0x2
    mov r2, #0x1
    bl func_ov002_021d8128
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_3fc:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_408:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
