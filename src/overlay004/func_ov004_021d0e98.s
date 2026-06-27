; func_ov004_021d0e98 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e94
        .extern func_02004f58
        .extern func_020054a4
        .extern func_0202c0c0
        .extern Vram_GetBankBaseE
        .extern func_0208e1ac
        .extern func_02094504
        .global func_ov004_021d0e98
        .arm
func_ov004_021d0e98:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov sl, r0
    ldr r0, [r1, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT1
    mov r1, #0xa
    mov r2, #0x3
    bl func_02001d0c
    mov r4, #0x0
    ldr fp, _LIT1
    mov r7, r4
    mov r6, #0xf1
.L_aec:
    bl Vram_GetBankBaseE
    add r1, r0, r6, lsl #0x5
    mov r0, #0x0
    mov r2, #0x3c0
    bl func_02094504
    cmp sl, #0x0
    beq .L_b88
    add r0, r4, #0x1d
    bl func_0202c0c0
    mov r5, r0
    bl Vram_GetBankBaseE
    mov r8, r0
    cmp r4, #0x0
    moveq r9, #0x1
    mov r0, r5
    mov r1, #0xc
    movne r9, #0x0
    bl func_020054a4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r1, r5
    mov r5, #0x6
    str r5, [sp]
    mov r5, #0xc
    add r3, r9, r9, lsl #0x1
    rsb r0, r0, #0x28
    add r3, r3, r0
    add r2, r8, r6, lsl #0x5
    mov r0, fp
    str r5, [sp, #0x4]
    bl func_02004f58
    bl func_0208e1ac
    add r0, r0, #0x4a
    add r0, r0, #0x400
    add r1, r0, r7, lsl #0x1
    mov r0, fp
    mov r2, r6
    mov r3, #0x1
    bl func_02001e94
.L_b88:
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r6, #0x1e
    add r7, r7, #0xb
    blt .L_aec
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_02102c90
