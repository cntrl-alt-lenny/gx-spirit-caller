; func_ov002_021ed264 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ba024
        .extern func_ov002_021c22cc
        .extern func_ov002_021e95b0
        .extern func_ov002_022577a0
        .global func_ov002_021ed264
        .arm
func_ov002_021ed264:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov ip, r3, lsl #0x10
    movs ip, ip, lsr #0x1f
    beq .L_244
    bl func_ov002_021e95b0
    ldmia sp!, {r4, r5, r6, pc}
.L_244:
    mov r0, r3, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r3, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ba024
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c22cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT1
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_022577a0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001686
_LIT1: .word func_ov002_021e95b0
