; func_ov002_021f70b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern func_ov002_021afab0
        .extern func_ov002_021afae4
        .extern func_ov002_021d792c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022535a4
        .global func_ov002_021f70b0
        .arm
func_ov002_021f70b0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_830
    cmp r0, #0x1
    beq .L_84c
    cmp r0, #0x2
    beq .L_8a0
    b .L_930
.L_830:
    bl func_ov002_021e2a4c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_84c:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_884
    mov r1, #0x0
    bl func_ov002_021d792c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_884:
    bl func_ov002_021e2b6c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_8a0:
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    mov r4, #0x0
    bl func_ov002_021afae4
    cmp r0, #0x0
    ble .L_910
.L_8c8:
    mov r0, r4
    bl func_ov002_021afab0
    mov r6, r0
    mov r0, r4
    bl func_ov002_021afab0
    ldr r0, [r0]
    ldr r2, [r6]
    mov r0, r0, lsl #0x2
    mov r1, r0, lsr #0x18
    add r0, r5, r4, lsl #0x1
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    add r4, r4, #0x1
    strh r1, [r0, #0x8]
    bl func_ov002_021afae4
    cmp r4, r0
    blt .L_8c8
.L_910:
    bl func_ov002_021afae4
    ldrh r1, [r5, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [r5, #0x6]
.L_930:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
