; func_ov015_021b4444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov015_021b5e28
        .extern data_ov015_021b5e44
        .extern data_ov015_021b6828
        .extern Vram_GetBankBaseCD
        .extern Ov015_UpdateScrollTarget
        .extern func_ov015_021b24f4
        .extern func_ov015_021b2630
        .global func_ov015_021b4444
        .arm
func_ov015_021b4444:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldrsh r5, [r3, #0x4c]
    ldr r4, _LIT2
    ldr r3, _LIT3
    sub r5, r5, #0x24
    and r2, r2, r5, lsl #0x10
    str r2, [r4]
    mov r5, r0
    ldr r0, [r3, #0x864]
    mov r4, r1
    ldr r6, _LIT4
    mov fp, #0x0
    bl func_ov015_021b24f4
    cmp r0, #0x1
    bne .L_88
    ldr r0, [r6, #0x848]
    mov r1, r5
    mov r2, r4
    bl func_ov015_021b2630
    add r1, r6, #0xa00
    add fp, fp, r0
    ldrsh r4, [r1, #0x30]
    ldr r0, [r6, #0x848]
    bl Ov015_UpdateScrollTarget
    cmp r4, r0
    beq .L_88
    ldr r0, [r6, #0x848]
    add r1, r6, #0xa00
    strh r4, [r1, #0x32]
    bl Ov015_UpdateScrollTarget
    add r1, r6, #0xa00
    strh r0, [r1, #0x30]
.L_88:
    add r0, r6, #0xa00
    ldrsh r5, [r0, #0x30]
    ldrsh r0, [r0, #0x32]
    cmp r0, r5
    beq .L_114
    mov r7, #0x0
    add r4, r6, #0x900
.L_a4:
    ldrh r0, [r4, #0xee]
    add sl, r7, r5, asr #0x3
    cmp sl, r0
    bgt .L_114
    and r9, sl, #0x1f
    add r0, r6, r9, lsl #0x1
    add r0, r0, #0x900
    ldrsh r0, [r0, #0xf0]
    cmp sl, r0
    beq .L_108
    ldr r8, [r6, #0xa38]
    bl Vram_GetBankBaseCD
    ldrh r2, [r4, #0xec]
    mov r1, r9
    mul r1, r2, r1
    mov r1, r1, lsl #0x6
    add r1, r1, #0x40
    add r1, r0, r1
    mul r0, r2, sl
    add r0, r8, r0, lsl #0x6
    mov r2, r2, lsl #0x6
    bl Copy32
    add r0, r6, r9, lsl #0x1
    add r0, r0, #0x900
    strh sl, [r0, #0xf0]
.L_108:
    add r7, r7, #0x1
    cmp r7, #0x14
    blt .L_a4
.L_114:
    mov r0, fp
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov015_021b6828
_LIT1: .word 0x01ff0000
_LIT2: .word 0x04001010
_LIT3: .word data_ov015_021b5e28
_LIT4: .word data_ov015_021b5e44
