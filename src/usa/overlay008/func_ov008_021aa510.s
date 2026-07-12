; func_ov008_021aa510 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2b60
        .extern func_0202b690
        .extern func_0202bacc
        .extern func_020b377c
        .global func_ov008_021aa510
        .arm
func_ov008_021aa510:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf0
    ldr r5, _LIT0
    mov r7, #0x0
    ldrh r0, [r5, #0x5a]
    cmp r0, #0x0
    addle sp, sp, #0xf0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr sl, _LIT1
    add r6, sp, #0x0
    mov fp, r7
    mov r4, #0x64
.L_30:
    ldrh r0, [sl, #0x10]
    mov r1, r6
    mov r2, #0x3c
    mov r9, fp
    bl func_0202b690
    ldr r0, [sp]
    mov r8, #0x0
    cmp r0, #0x0
    beq .L_74
.L_54:
    ldr r0, [r6, r8, lsl #0x2]
    bl func_0202bacc
    cmp r0, #0x0
    add r8, r8, #0x1
    ldr r0, [r6, r8, lsl #0x2]
    addne r9, r9, #0x1
    cmp r0, #0x0
    bne .L_54
.L_74:
    cmp r8, #0x0
    moveq r0, #0x0
    beq .L_8c
    mul r0, r9, r4
    mov r1, r8
    bl func_020b377c
.L_8c:
    str r0, [sl, #0x14]
    ldrh r0, [r5, #0x5a]
    add r7, r7, #0x1
    add sl, sl, #0x34
    cmp r7, r0
    blt .L_30
    add sp, sp, #0xf0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2b60
_LIT1: .word data_ov008_021b2660
