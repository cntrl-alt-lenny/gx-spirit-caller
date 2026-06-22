; func_ov002_0221e548 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021de408
        .extern func_ov002_021e276c
        .extern func_ov002_021ff400
        .extern func_ov002_02257704
        .extern func_ov002_0227adb8
        .global func_ov002_0221e548
        .arm
func_ov002_0221e548:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x64
    bgt .L_20
    beq .L_d8
    b .L_fc
.L_20:
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_fc
    b .L_b0
    b .L_8c
    b .L_60
    b .L_40
.L_40:
    bl func_ov002_02257704
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x64
    ldmia sp!, {r4, pc}
.L_60:
    bl func_ov002_021ff400
    cmp r0, #0x0
    moveq r0, #0x64
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x5e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_8c:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_b0:
    bl func_ov002_021afb74
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0227adb8
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_d8:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_fc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
