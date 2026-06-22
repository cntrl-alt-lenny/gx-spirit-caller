; func_ov002_02216dd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021d59cc
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_0226b11c
        .global func_ov002_02216dd0
        .arm
func_ov002_02216dd0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    add r2, sp, #0x4
    mov r1, #0x0
    mov r6, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_480
    ldr r2, [sp, #0x4]
    mov r0, r6
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_480
    ldrh r2, [r6]
    ldr r0, _LIT0
    mov ip, #0x0
    cmp r2, r0
    bne .L_444
    ldr r0, _LIT1
    ldrh r1, [r6, #0x2]
    ldr r3, [r0, #0xcec]
    mov r0, r1, lsl #0x1f
    cmp r3, r0, lsr #0x1f
    movne ip, #0x1
.L_444:
    and r0, ip, #0xf
    ldrh r1, [r6, #0x2]
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x1
    mov r3, r0, lsl #0x10
    mov r1, r1, lsl #0x1f
    mov r6, r1, lsr #0x1f
    mov r0, r4
    mov r1, r5
    mov r3, r3, lsr #0x10
    str r6, [sp]
    bl func_ov002_021d59cc
    mov r0, r4
    mov r1, r5
    bl func_ov002_0226b11c
.L_480:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000013b0
_LIT1: .word data_ov002_022d016c
