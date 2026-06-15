; func_ov002_021aa4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .extern func_ov002_021baca8
        .extern func_ov002_021de480
        .global func_ov002_021aa4a0
        .arm
func_ov002_021aa4a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    mov r5, #0x14
    ldr r6, _LIT1
    and r7, r0, #0x1
    mul r5, r1, r5
    mla r0, r7, r4, r6
    ldrh r6, [r5, r0]
    mov sl, r2
    mov r9, r3
    cmp r6, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r5, _LIT2
    mov r4, #0x1
    mov fp, #0x0
.L_3c:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_a0
    ldrh r1, [r1]
    mov r2, sl
    mov r0, r1, asr #0x8
    and r7, r1, #0xff
    and r8, r0, #0xff
    mov r0, r7
    mov r1, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_a0
    cmp r9, #0x0
    moveq r9, r4
    beq .L_a0
    mov r0, r7
    mov r1, r8
    mov r2, fp
    mov r3, fp
    bl func_ov002_021de480
.L_a0:
    cmp r6, #0x0
    bne .L_3c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022d0650
