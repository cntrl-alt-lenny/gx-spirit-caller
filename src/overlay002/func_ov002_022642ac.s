; func_ov002_022642ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021c84e0
        .extern func_ov002_021de41c
        .extern func_ov002_021df680
        .global func_ov002_022642ac
        .arm
func_ov002_022642ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    str r0, [sp]
    ldr r0, [r1, #0xd28]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_124
    mov r7, #0x0
    ldr fp, _LIT2
    mov r5, r7
    mov r8, r7
    mov r4, #0x1
.L_40:
    ldr r0, _LIT3
    and r1, r5, #0x1
    mla sl, r1, r0, fp
    mov r6, #0x0
    add r9, sl, #0x30
.L_54:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [sl, #0x38]
    cmpne r0, #0x0
    beq .L_a4
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c84e0
    cmp r0, #0x3
    bgt .L_a4
    ldr r1, [sl, #0x40]
    mov r0, r1, lsr #0x10
    tst r0, #0x1
    bne .L_9c
    mov r0, r1, lsr #0x11
    tst r0, #0x1
    beq .L_a4
.L_9c:
    add r0, r6, r8
    orr r7, r7, r4, lsl r0
.L_a4:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_54
    add r5, r5, #0x1
    cmp r5, #0x2
    add r8, r8, #0x10
    blt .L_40
    cmp r7, #0x0
    beq .L_124
    ldr r0, [sp]
    ldr r1, _LIT1
    rsb r4, r0, #0x1
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    ldr r1, _LIT1
    ldreq r4, [sp]
    mvn r0, #0x0
    bl func_ov002_021df680
    ldr r1, _LIT1
    mov r0, r4
    mov r2, r7
    bl func_ov002_021de41c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_124:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x000013f8
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
