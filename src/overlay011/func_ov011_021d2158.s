; func_ov011_021d2158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_02006c0c
        .extern func_0201d6f8
        .global func_ov011_021d2158
        .arm
func_ov011_021d2158:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    mov r0, r1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    bl func_0201d6f8
    ldr r1, [sl, #0x10]
    ldr r2, [sl, #0xc]
    mov r1, r1, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    muls r1, r2, r1
    mov r6, r0
    mov r5, #0x0
    beq .L_10c
    ldr r4, [sp, #0x4]
    ldr fp, _LIT0
.L_50:
    ldrh r0, [r6]
    bic r3, r4, #0xf
    ldr r1, [sl, #0x8]
    and r0, r0, fp
    and r2, r0, #0xf
    ldr r0, [sl, #0x4]
    orr r4, r3, r2
    str r4, [sp, #0x4]
    cmp r0, r1
    blt .L_c8
    mov r8, r1, lsl #0x1
    mov r9, r8, lsl #0x2
    ldr r7, [sl]
    mov r0, r9
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [sl]
    ldr r1, [sl]
    mov r2, r9
    mov r0, #0x0
    bl Fill32
    ldr r2, [sl, #0x8]
    ldr r1, [sl]
    mov r0, r7
    mov r2, r2, lsl #0x2
    bl Copy32
    mov r0, r7
    bl Task_InvokeLocked
    str r8, [sl, #0x8]
.L_c8:
    ldr r2, [sp, #0x4]
    ldr r1, [sl]
    ldr r0, [sl, #0x4]
    add r5, r5, #0x1
    str r2, [r1, r0, lsl #0x2]
    ldr r0, [sl, #0x4]
    add r6, r6, #0x2
    add r0, r0, #0x1
    str r0, [sl, #0x4]
    ldr r0, [sl, #0x10]
    ldr r1, [sl, #0xc]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mul r0, r1, r0
    cmp r5, r0
    bcc .L_50
.L_10c:
    ldr r0, [sp]
    bl Task_InvokeLocked
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000003ff
