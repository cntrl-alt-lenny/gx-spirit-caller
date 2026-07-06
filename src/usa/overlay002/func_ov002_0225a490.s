; func_ov002_0225a490 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0170
        .extern func_ov002_021bf1b4
        .global func_ov002_0225a490
        .arm
func_ov002_0225a490:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r5, _LIT0
    mov r8, #0x0
    ldr r1, [r5]
    ldr r7, _LIT1
    ldr r4, _LIT2
    and r1, r1, #0x1
    mla r3, r1, r4, r7
    ldr r2, [r5, #0x1c]
    mov r1, #0x14
    mul r1, r2, r1
    add r2, r3, #0x30
    ldr r1, [r2, r1]
    mov sl, r0
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    str r0, [sl]
    ldr r6, _LIT3
    mov r0, r0, lsl #0x2
    ldrh r0, [r6, r0]
    mov r9, r8
    mov fp, r8
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x1e
    str r0, [sl, #0x4]
.L_70:
    ldr r1, [r5, #0x4]
    add r0, sl, r8, lsl #0x2
    and r1, r1, #0x1
    mla r2, r1, r4, r7
    add r1, r2, #0x30
    ldr r2, [r1, r9]
    mov r3, r8
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x8]
    mov r1, r1, lsl #0x2
    ldrh r1, [r6, r1]
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x1e
    str r1, [r0, #0x1c]
    str fp, [sp]
    ldr r1, [r5, #0x1c]
    ldmia r5, {r0, r2}
    bl func_ov002_021bf1b4
    add r1, sl, r8, lsl #0x2
    add r8, r8, #0x1
    str r0, [r1, #0x30]
    cmp r8, #0x5
    add r9, r9, #0x14
    blt .L_70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0170
