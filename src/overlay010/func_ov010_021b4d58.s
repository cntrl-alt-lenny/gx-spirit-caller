; func_ov010_021b4d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov010_021b91b4
        .extern data_ov010_021b9260
        .extern data_ov010_021b93d0
        .extern Vram_GetBankBaseCD
        .extern func_ov010_021b238c
        .extern func_ov010_021b24f4
        .extern func_ov010_021b2630
        .global func_ov010_021b4d58
        .arm
func_ov010_021b4d58:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r5, _LIT0
    ldr r1, _LIT1
    ldrsh r4, [r5, #0x48]
    ldr r3, _LIT2
    ldr r2, _LIT3
    sub r4, r4, #0x24
    and r1, r1, r4, lsl #0x10
    str r1, [r3]
    mov r7, r0
    ldr r0, [r2, #0xd8]
    ldr r4, _LIT4
    mov r6, #0x0
    bl func_ov010_021b24f4
    cmp r0, #0x1
    bne .L_664
    ldr r0, [r4, #0x2c]
    mov r2, r7
    add r1, r4, #0x10
    bl func_ov010_021b2630
    add r6, r6, r0
    ldrsh r7, [r5, #0x48]
    ldr r0, [r4, #0x2c]
    bl func_ov010_021b238c
    cmp r7, r0
    beq .L_664
    ldr r0, [r4, #0x2c]
    strh r7, [r5, #0x4a]
    bl func_ov010_021b238c
    strh r0, [r5, #0x48]
.L_664:
    ldrsh r4, [r5, #0x48]
    ldrsh r0, [r5, #0x4a]
    cmp r0, r4
    beq .L_6e4
    mov r7, #0x0
.L_678:
    ldrh r0, [r5, #0x6]
    add sl, r7, r4, asr #0x3
    cmp sl, r0
    bgt .L_6e4
    and r9, sl, #0x1f
    add r0, r5, r9, lsl #0x1
    ldrsh r0, [r0, #0x8]
    cmp sl, r0
    beq .L_6d8
    ldr r8, [r5]
    bl Vram_GetBankBaseCD
    ldrh r2, [r5, #0x4]
    mov r3, r9
    mov r1, r0
    mul r3, r2, r3
    mul r0, r2, sl
    mov r3, r3, lsl #0x6
    add r3, r3, #0x40
    add r0, r8, r0, lsl #0x6
    add r1, r1, r3
    mov r2, r2, lsl #0x6
    bl Copy32
    add r0, r5, r9, lsl #0x1
    strh sl, [r0, #0x8]
.L_6d8:
    add r7, r7, #0x1
    cmp r7, #0x14
    blt .L_678
.L_6e4:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov010_021b93d0
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
_LIT3: .word data_ov010_021b91b4
_LIT4: .word data_ov010_021b9260
