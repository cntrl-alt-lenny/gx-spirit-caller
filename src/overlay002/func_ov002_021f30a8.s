; func_ov002_021f30a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_021f30a8
        .arm
func_ov002_021f30a8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    ldr r4, _LIT1
    and r5, r1, #0x1
    mla r4, r5, r3, r4
    mov r3, #0x14
    mul r5, r2, r3
    add r3, r4, #0x30
    ldr r4, [r3, r5]
    mov r3, r4, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r2, #0xa
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r3, r4, lsl #0x2
    ldrh r5, [r0, #0x4]
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    mov r5, r5, lsl #0x11
    add r3, r3, r4, lsr #0x1f
    cmp r3, r5, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r0, #0x2]
    ldr ip, _LIT2
    mov r3, r0, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    bne .L_c0
    smull r1, lr, ip, r2
    mov r4, r0, lsl #0x1a
    mov r3, r4, lsr #0x1b
    mov r1, r3, lsr #0x1f
    smull r3, r5, ip, r3
    mov r0, r2, lsr #0x1f
    add lr, r0, lr, asr #0x1
    mov ip, #0x5
    add r5, r1, r5, asr #0x1
    smull r0, r1, ip, lr
    smull r1, r3, ip, r5
    sub lr, r2, r0
    rsb r5, r1, r4, lsr #0x1b
    cmp lr, r5
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_c0:
    mov lr, r0, lsl #0x1a
    mov r0, lr, lsr #0x1b
    mov r3, r0, lsr #0x1f
    smull r0, r4, ip, r0
    smull r1, r5, ip, r2
    mov r0, r2, lsr #0x1f
    add r4, r3, r4, asr #0x1
    mov ip, #0x5
    add r5, r0, r5, asr #0x1
    smull r3, r0, ip, r4
    smull r0, r1, ip, r5
    rsb r4, r3, lr, lsr #0x1b
    sub r5, r2, r0
    rsb r0, r4, #0x4
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x66666667
