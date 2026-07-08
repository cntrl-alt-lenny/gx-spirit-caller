; func_ov002_0220e898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf18c
        .extern func_ov002_021d58dc
        .extern func_ov002_021d950c
        .extern func_ov002_021de390
        .global func_ov002_0220e898
        .arm
func_ov002_0220e898:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT0
    ldr r5, _LIT1
    mov r2, r0, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r4, r0, lsl #0x1a
    and r0, r2, #0x1
    mla r6, r0, r1, r5
    rsb r0, r2, #0x1
    and r7, r0, #0x1
    mul r2, r7, r1
    add r1, r5, r2
    ldrh r3, [sl, #0x4]
    ldr r1, [r1, #0xf8]
    mov r4, r4, lsr #0x1b
    mov r5, r3, lsl #0x11
    mov r3, #0x14
    mul r3, r4, r3
    add r4, r6, #0x30
    ldr r4, [r4, r3]
    mov r1, r1, lsl #0x13
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r1, r1, lsr #0x13
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    mov r5, r5, lsr #0x17
    add r3, r3, r4, lsr #0x1f
    cmp r5, r3
    str r1, [sp, #0x4]
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r1, #0x0
    ldrne r1, _LIT2
    ldrneh r1, [r1, r2]
    cmpne r1, #0x0
    beq .L_2c0
    mov r2, #0x0
    mov r3, r2
    mov r1, #0xa
    bl func_ov002_021de390
.L_2c0:
    mov r6, #0x0
    ldr fp, _LIT1
    mov r5, r6
    mov r4, #0x9
.L_2d0:
    ldr r0, _LIT0
    and r1, r6, #0x1
    mla r9, r1, r0, fp
    mov r7, #0x0
    add r8, r9, #0x30
.L_2e4:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_338
    str r5, [sp]
    ldrh r3, [sl, #0x2]
    mov r0, r6
    mov r1, r7
    mov r2, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0xff
    mov r3, r3, lsl #0x1a
    mov r3, r3, lsr #0x1b
    and r3, r3, #0xff
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r4
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
.L_338:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r8, r8, #0x14
    add r9, r9, #0x14
    ble .L_2e4
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_2d0
    ldrh r0, [sl]
    ldr r1, [sp, #0x4]
    cmp r0, r1
    beq .L_36c
    bl func_ov002_021d950c
.L_36c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf18c
