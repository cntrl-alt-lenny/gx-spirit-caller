; func_ov002_022a0654 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbca4
        .extern data_ov002_022cbcc0
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208df94
        .global func_ov002_022a0654
        .arm
func_ov002_022a0654:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov sl, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x14]
    ldr r1, [sp, #0x18]
    str r0, [sp]
    bic r0, r1, #0x7f
    orr r5, r0, #0x4
    bic r2, r2, #0xf
    orr r0, r2, #0x8
    strh r0, [sp, #0x14]
    str r5, [sp, #0x18]
    ldrh r0, [sp, #0x14]
    ldr r3, [sl, #0x30]
    ldr r4, _LIT1
    orr r1, r0, #0x10
    mov r2, #0x800
    bic r5, r5, #0x3f80
    mov r0, r3, lsl #0x19
    orr r0, r5, r0, lsr #0x12
    bic r0, r0, #0x1c000
    orr r3, r0, #0x1c000
    add r0, sp, #0x0
    str r4, [sp, #0xc]
    str r3, [sp, #0x18]
    strh r2, [sp, #0x10]
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    add r0, sl, #0x94
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x14]
    ldr r0, [sp, #0x18]
    add r1, r4, #0x1800
    str r1, [sp, #0xc]
    bic r0, r0, #0x1c000
    ldrh r1, [sp, #0x14]
    orr r0, r0, #0x1c000
    str r0, [sp, #0x18]
    mov r0, #0x800
    strh r0, [sp, #0x10]
    orr r1, r1, #0x10
    add r0, sp, #0x0
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    mov fp, #0x0
    mov r7, fp
    mov r8, #0x4
    mov r4, fp
.L_2b4:
    ldr r0, [sl, #0x8]
    mov r0, r0, lsr fp
    tst r0, #0x1
    beq .L_31c
    mov r5, #0x0
    mov r9, r5
.L_2cc:
    mov r6, r4
.L_2d0:
    bl func_0208df94
    add r1, r6, r7
    add r2, r6, r8
    add r1, r1, #0xe1
    ldr r3, [sl, #0x30]
    add r1, r1, #0x200
    add r1, r1, r9
    add r3, r3, r5
    add r6, r6, #0x1
    add r0, r0, r3, lsl #0x6
    orr r3, r1, #0x4000
    mov r1, r2, lsl #0x1
    strh r3, [r1, r0]
    cmp r6, #0x4
    blt .L_2d0
    add r5, r5, #0x1
    cmp r5, #0x4
    add r9, r9, #0x18
    blt .L_2cc
.L_31c:
    add fp, fp, #0x1
    cmp fp, #0x7
    add r7, r7, #0x4
    add r8, r8, #0x4
    blt .L_2b4
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cbca4
_LIT1: .word 0x0000a040
_LIT2: .word data_ov002_022cbcc0
