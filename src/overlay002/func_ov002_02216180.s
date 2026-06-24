; func_ov002_02216180 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021de408
        .extern func_ov002_02216004
        .extern func_ov002_0225764c
        .extern func_ov002_02257704
        .extern func_ov002_022577dc
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_02216180
        .arm
func_ov002_02216180:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a8]
    sub r2, r2, #0x78
    cmp r2, #0x8
    addls pc, pc, r2, lsl #0x2
    b .L_4c8
    b .L_4b8
    b .L_4c8
    b .L_4c8
    b .L_4c8
    b .L_4c8
    b .L_4c8
    b .L_478
    b .L_3cc
    b .L_388
.L_388:
    ldrh r2, [r4, #0x6]
    mov r1, #0x0
    bic r2, r2, #0xff00
    strh r2, [r4, #0x6]
    bl func_ov002_02216004
    strh r0, [r4, #0x8]
    ldrh r1, [r4, #0x8]
    ldr r0, _LIT1
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x6]
    mov r0, #0x7f
    bic r1, r1, #0xff00
    orr r1, r1, #0x100
    strh r1, [r4, #0x6]
    ldmia sp!, {r4, pc}
.L_3cc:
    bl func_ov002_022577dc
    cmp r0, #0x1
    ble .L_460
    ldrh r1, [r4]
    cmp r1, #0x1540
    beq .L_3fc
    ldr r0, _LIT2
    cmp r1, r0
    addne r0, r0, #0x16c
    cmpne r1, r0
    beq .L_414
    b .L_42c
.L_3fc:
    mov r0, r4
    bl func_ov002_02257704
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_414:
    ldrh r0, [r4, #0x2]
    mov r1, #0x6d
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    b .L_440
.L_42c:
    ldrh r0, [r4, #0x2]
    mov r1, #0x62
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_440:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_460:
    mov r0, r4
    bl func_ov002_02257704
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_478:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT4
    mov r3, #0x1
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r2, r1
    add r0, r1, r0, lsl #0x4
    mov r2, r3, lsl r0
    ldr r1, _LIT0
    mov r0, #0x78
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, pc}
.L_4b8:
    ldr r1, [r1, #0x5ac]
    bl func_ov002_021de408
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_4c8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000ffff
_LIT2: .word 0x000017f2
_LIT3: .word func_ov002_0225764c
_LIT4: .word data_ov002_022d016c
