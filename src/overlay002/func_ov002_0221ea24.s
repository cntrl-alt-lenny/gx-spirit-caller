; func_ov002_0221ea24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021bd364
        .extern func_ov002_021d5a08
        .extern func_ov002_0220e650
        .global func_ov002_0221ea24
        .arm
func_ov002_0221ea24:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r7, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_3a0
    cmp r1, #0x80
    bne .L_480
    bl func_ov002_0220e650
    cmp r0, #0x0
    beq .L_480
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3a0:
    ldrh r0, [r7, #0x2]
    mov r1, #0xb
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd364
    mov r1, #0xc8
    mla r4, r0, r1, r4
    ldrh r2, [r7, #0x2]
    mov r1, #0xd
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd364
    mov r1, #0xc8
    mla r4, r0, r1, r4
    ldrh r2, [r7, #0x2]
    mov r1, #0x10
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd364
    mov r1, #0xc8
    mul r1, r0, r1
    adds r0, r4, r1
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r5, #0x0
    mov r0, r0, lsl #0x10
    ldr r4, _LIT1
    ldr r8, _LIT2
    mov r6, r5
    mov r9, r0, lsr #0x10
    mov sl, #0x2
.L_424:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    and r0, r1, #0x1
    mla r2, r0, r8, r4
    add r2, r2, r6
    ldr r0, [r2, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r2, #0x38]
    cmpne r0, #0x0
    beq .L_470
    str sl, [sp]
    str r9, [sp, #0x4]
    ldrh r3, [r7]
    mov r0, r7
    mov r2, r5
    bl func_ov002_021d5a08
.L_470:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, #0x14
    blt .L_424
.L_480:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
