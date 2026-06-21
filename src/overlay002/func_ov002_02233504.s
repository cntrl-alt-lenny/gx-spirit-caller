; func_ov002_02233504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c2084
        .extern func_ov002_021de8fc
        .extern func_ov002_0223df38
        .global func_ov002_02233504
        .arm
func_ov002_02233504:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x6]
    mov r7, #0x0
    mov r6, r7
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_204
    ldr r5, _LIT0
    mov r4, #0x1
    mov fp, #0x14
.L_180:
    mov r0, sl
    mov r1, r6
    add r2, sp, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_1f0
    ldr r3, [sp]
    ldr r0, _LIT1
    and r8, r3, #0xff
    and r2, r8, #0x1
    mla r1, r2, r0, r5
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r9, r0, #0xff
    mla r0, r9, fp, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1f0
    mov r0, sl
    mov r1, r8
    mov r2, r9
    mov r3, #0x1
    bl func_ov002_021c2084
    cmp r0, #0x0
    addne r0, r9, r8, lsl #0x4
    orrne r7, r7, r4, lsl r0
.L_1f0:
    ldrh r0, [sl, #0x6]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x10
    cmp r6, r0, lsr #0x18
    blt .L_180
.L_204:
    mov r0, sl
    mov r1, r7
    mov r2, #0x2
    bl func_ov002_021de8fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
