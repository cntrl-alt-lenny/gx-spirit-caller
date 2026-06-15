; func_ov020_021add24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov020_021ada74
        .extern func_ov020_021adb8c
        .global func_ov020_021add24
        .arm
func_ov020_021add24:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r3, r2, lsl #0x10
    mov r8, r3, lsr #0x10
    mov r2, r2, lsr #0x10
    cmp r8, #0x0
    mov sl, r0
    mov r9, r1
    mov r6, r2, lsl #0x10
    mov r7, #0x0
    addle sp, sp, #0xc
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r5, _LIT0
    add fp, sp, #0x8
    mov r4, #0x168
.L_2ec:
    ldrh r0, [sl], #0x2
    mov r1, fp
    add r2, sp, #0x4
    add r3, sp, #0x0
    bl func_ov020_021ada74
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    add r2, r0, r6, lsr #0x10
    smull r3, r0, r5, r2
    add r0, r2, r0
    mov r3, r2, lsr #0x1f
    add r0, r3, r0, asr #0x8
    smull r0, r3, r4, r0
    sub r0, r2, r0
    ldr r2, [sp]
    str r0, [sp, #0x8]
    bl func_ov020_021adb8c
    add r7, r7, #0x1
    strh r0, [r9], #0x2
    cmp r7, r8
    blt .L_2ec
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xb60b60b7
