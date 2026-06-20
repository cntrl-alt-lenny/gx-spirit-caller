; func_ov002_0226e80c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_ov002_021bb068
        .extern func_ov002_021bc288
        .extern func_ov002_021bc6c4
        .extern func_ov002_021bc72c
        .extern func_ov002_021bca00
        .extern func_ov002_021c8940
        .global func_ov002_0226e80c
        .arm
func_ov002_0226e80c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    mov sl, r0
    ldr r0, _LIT0
    mov r9, r1
    mov r7, r6
    mov fp, r6
    bl func_ov002_021bb068
    cmp r0, #0x0
    movgt r0, r6
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    add r8, r0, #0x30
    mov r5, r6
.L_764:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_7e0
    mov r0, sl
    mov r1, sl
    mov r2, r5
    bl func_ov002_021bc72c
    cmp r0, #0x0
    beq .L_7e0
    mov r0, sl
    mov r1, r5
    bl func_ov002_021c8940
    mov r4, r0
    mov r0, r9
    bl func_0202b878
    cmp r4, r0
    bne .L_7e0
    mov r0, sl
    mov r1, r9
    mov r2, sl
    mov r3, r5
    add r6, r6, #0x1
    bl func_ov002_021bca00
    cmp r0, #0x0
    mov r0, sl
    mov r1, r5
    addne r7, r7, #0x1
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne fp, #0x1
.L_7e0:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r8, r8, #0x14
    blt .L_764
    cmp fp, #0x0
    bne .L_80c
    mov r0, sl
    bl func_ov002_021bc6c4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_80c:
    add r0, r6, r7
    cmp r0, #0x3
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000013f2
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
