; func_ov002_0221b038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c8390
        .extern func_ov002_021df728
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0220e428
        .extern func_ov002_0223de48
        .global func_ov002_0221b038
        .arm
func_ov002_0221b038:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    add r2, sp, #0x0
    mov r1, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_294
    ldr ip, [sp]
    ldr r1, _LIT0
    and r0, ip, #0xff
    and r3, r0, #0x1
    mul r2, r3, r1
    mov r1, ip, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    ldr ip, _LIT1
    and r1, r1, #0xff
    mov r3, #0x14
    smulbb lr, r1, r3
    add r3, ip, r2
    add r3, r3, lr
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_294
    ldr r3, _LIT2
    add r2, r3, r2
    ldrh r2, [lr, r2]
    cmp r2, #0x0
    beq .L_294
    ldrh r3, [r4]
    ldr r2, _LIT3
    cmp r3, r2
    movne r5, #0x3e8
    bne .L_240
    bl func_ov002_021c8390
    mov r5, r0
.L_240:
    bl func_ov002_021e2a4c
    mov r0, r4
    bl func_ov002_0220e428
    cmp r0, #0x0
    beq .L_288
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df728
.L_288:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_294:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x0000138d
