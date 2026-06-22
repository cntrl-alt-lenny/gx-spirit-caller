; func_ov002_021ec41c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b33b0
        .extern func_ov002_021b9830
        .extern func_ov002_021c2084
        .global func_ov002_021ec41c
        .arm
func_ov002_021ec41c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r3, _LIT0
    and ip, r5, #0x1
    mov r4, r2
    mov r6, #0x14
    mul r3, ip, r3
    mul ip, r4, r6
    ldr lr, _LIT1
    add r6, lr, r3
    add r6, r6, ip
    ldr lr, [r6, #0x30]
    mov r6, r0
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    mov r3, #0x0
    bl func_ov002_021c2084
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x14]
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    and r0, r1, #0xff
    cmp r5, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r1, asr #0x8
    and r0, r0, #0xff
    cmp r4, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b9830
    movs r2, r0
    movmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, pc}
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    mov r0, r5
    mov r1, r4
    and r2, r2, #0xff
    and r3, r3, #0xff
    bl func_ov002_021b33b0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
