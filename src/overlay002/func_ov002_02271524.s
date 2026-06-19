; func_ov002_02271524 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc8c8
        .global func_ov002_02271524
        .arm
func_ov002_02271524:
    stmdb sp!, {r3, r4, r5, lr}
    add r4, r1, r2
    mov r5, r0
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r1, [r1]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    cmp r5, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, r5
    mov r2, r4
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldrb ip, [r1, #0x8]
    cmp ip, #0x0
    bne .L_1438
    ldr r0, [r1]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_1478
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_1478
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1438:
    cmp ip, #0x0
    mov r3, #0x0
    ble .L_1478
    and r2, r5, #0xff
    and r0, r4, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
.L_1458:
    add r0, r1, r3, lsl #0x1
    ldrh r0, [r0, #0x10]
    cmp r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r3, r3, #0x1
    cmp r3, ip
    blt .L_1458
.L_1478:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
