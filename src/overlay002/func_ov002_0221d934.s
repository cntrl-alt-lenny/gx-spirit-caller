; func_ov002_0221d934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_0202e270
        .extern func_ov002_021d6714
        .extern func_ov002_021df708
        .extern func_ov002_021e2b1c
        .extern func_ov002_0220e518
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .global func_ov002_0221d934
        .arm
func_ov002_0221d934:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r1, #0x0
    mov r8, r0
    bl func_ov002_0223de94
    and r4, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r5, r0, asr #0x8
    ldr r0, _LIT0
    and r2, r4, #0x1
    ldr r1, _LIT1
    mul r7, r2, r0
    ldr r3, _LIT2
    ldr r2, [r1, #0x5a8]
    and r5, r5, #0xff
    mov r0, #0x14
    smulbb r6, r5, r0
    add r0, r3, r7
    add r0, r0, r6
    ldr r0, [r0, #0x30]
    cmp r2, #0x7e
    mov r0, r0, lsl #0x13
    mov r1, r0, lsr #0x13
    beq .L_e8
    cmp r2, #0x7f
    beq .L_d0
    cmp r2, #0x80
    bne .L_124
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_c8
    ldr r0, _LIT3
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    bne .L_c8
    ldr r0, _LIT4
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    beq .L_c8
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d6714
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d0:
    mov r0, r4
    bl func_ov002_021df708
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e8:
    mov r0, r1
    bl func_0202e270
    cmp r0, #0x0
    beq .L_10c
    mov r0, r8
    bl func_ov002_0220e518
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_10c:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d6714
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_124:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022ce288
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word data_ov002_022cf1a2
