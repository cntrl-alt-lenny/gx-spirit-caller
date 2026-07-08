; func_ov002_02211084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021c8860
        .extern func_ov002_021d6718
        .extern func_ov002_021de318
        .global func_ov002_02211084
        .arm
func_ov002_02211084:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7f
    beq .L_554
    cmp r0, #0x80
    bne .L_5f4
    mov r4, #0x0
    ldr r0, _LIT1
    ldr r8, _LIT2
    ldr r9, _LIT3
    mov r2, r4
    mov r5, r4
    mov ip, #0x1
    mov r1, #0x5
.L_4e0:
    and r3, r2, #0x1
    mla r7, r3, r9, r0
    add r6, r7, #0x94
    mov r3, r1
    add r7, r7, #0x64
.L_4f4:
    ldr fp, [r6]
    mov fp, fp, lsl #0x13
    cmp r8, fp, lsr #0x13
    bne .L_514
    ldrh fp, [r7, #0x38]
    cmp fp, #0x0
    addne fp, r3, r5
    orrne r4, r4, ip, lsl fp
.L_514:
    add r3, r3, #0x1
    cmp r3, #0xa
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_4f4
    add r2, r2, #0x1
    cmp r2, #0x2
    add r5, r5, #0x10
    blt .L_4e0
    mov r0, sl
    mov r1, r4
    bl func_ov002_021de318
    cmp r4, #0x0
    movne r0, #0x7f
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_554:
    mov r5, #0x0
    ldr fp, _LIT1
    mov r4, r5
.L_560:
    ldr r0, _LIT4
    mov r9, #0x0
    ldr r0, [r0, #0xcec]
    eor r8, r0, r5
    ldr r0, _LIT3
    and r1, r8, #0x1
    mla r7, r1, r0, fp
    add r6, r7, #0x30
.L_580:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r7, #0x38]
    cmpne r0, #0x0
    ldrneh r0, [r7, #0x36]
    cmpne r0, #0x0
    beq .L_5cc
    mov r0, r8
    mov r1, r9
    bl func_ov002_021c8860
    cmp r0, #0x1
    bne .L_5cc
    mov r0, sl
    mov r1, r8
    mov r2, r9
    str r4, [sp]
    mov r3, r4
    bl func_ov002_021d6718
.L_5cc:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_580
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_560
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000010ef
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022d008c
