; func_ov002_0222c7ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021c4bbc
        .extern func_ov002_021d58dc
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_0222c7ec
        .arm
func_ov002_0222c7ec:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x34
    add r2, sp, #0x4
    mov r1, #0x0
    mov r6, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_374
    ldr r2, [sp, #0x4]
    mov r0, r6
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_374
    add r2, sp, #0x8
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c4bbc
    ldr r1, _LIT0
    mov r0, r4
    ldr r2, [r1, #0xcf0]
    mov r1, r5
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    str r2, [sp]
    ldrh r2, [r6, #0x2]
    mov r3, #0x7
    mov ip, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov ip, ip, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and ip, ip, #0xff
    and r2, r2, #0xff
    orr r2, ip, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
    ldr r1, [sp, #0x20]
    ldr r0, _LIT1
    mov r3, #0x12
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r6]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021d58dc
    ldr r1, [sp, #0x1c]
    ldr r0, _LIT1
    mov r3, #0x12
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r6]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021d58dc
.L_374:
    mov r0, #0x0
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000ffff
