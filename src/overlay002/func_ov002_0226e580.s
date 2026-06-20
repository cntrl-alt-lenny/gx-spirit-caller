; func_ov002_0226e580 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_0202b890
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bc618
        .extern func_ov002_021c8940
        .extern func_ov002_021c93cc
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca698
        .extern func_ov002_022536e8
        .extern func_ov002_0226e46c
        .global func_ov002_0226e580
        .arm
func_ov002_0226e580:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r1
    mov sl, r0
    mov r0, r9
    bl func_ov002_0226e46c
    mov r6, r0
    ldr r2, _LIT0
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    mov r4, r0
    mov r0, sl
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r1, sl
    bl func_ov002_021ca698
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    bl func_ov002_021bc618
    cmp r0, #0x0
    cmpeq r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    beq .L_128
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    ldr r4, _LIT3
    ldr fp, _LIT4
    add r8, r0, #0x30
    mov r7, #0x0
.L_98:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_110
    cmp r9, r4
    cmpne r9, fp
    ldrne r0, _LIT5
    cmpne r9, r0
    bne .L_e4
    mov r0, sl
    mov r1, r7
    bl func_ov002_021c8940
    mov r5, r0
    mov r0, r9
    bl func_0202b878
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_fc
.L_e4:
    mov r0, r9
    bl func_0202b890
    mov r2, r0
    mov r0, sl
    mov r1, r7
    bl func_ov002_021c93cc
.L_fc:
    cmp r0, #0x0
    beq .L_110
    subs r6, r6, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_110:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    blt .L_98
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_128:
    mov r0, sl
    mov r1, r9
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, r6
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000014a0
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x00001466
_LIT4: .word 0x000018b4
_LIT5: .word 0x000019ca
