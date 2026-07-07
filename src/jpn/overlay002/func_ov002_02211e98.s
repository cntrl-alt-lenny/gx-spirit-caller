; func_ov002_02211e98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c8860
        .extern func_ov002_021d6718
        .global func_ov002_02211e98
        .arm
func_ov002_02211e98:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r1, [sl, #0x4]
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    mov r2, r1, lsl #0x11
    ldr r5, _LIT0
    mov r1, r0, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr fp, _LIT1
    and r1, r1, #0x1
    mov r0, r0, lsl #0x1a
    mla r3, r1, fp, r5
    mov r1, r0, lsr #0x1b
    mov r0, #0x14
    mul r0, r1, r0
    add r1, r3, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsr #0x17
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, #0x0
    mov r4, r6
.L_80:
    and r0, r6, #0x1
    mla r8, r0, fp, r5
    mov r7, #0x0
    add r9, r8, #0x30
.L_90:
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_e4
    ldrh r0, [r8, #0x36]
    cmp r0, #0x0
    bne .L_e4
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_e4
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c8860
    cmp r0, #0x1
    bne .L_e4
    mov r0, sl
    mov r1, r6
    mov r2, r7
    mov r3, r4
    str r4, [sp]
    bl func_ov002_021d6718
.L_e4:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_90
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_80
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
