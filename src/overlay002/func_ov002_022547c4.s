; func_ov002_022547c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021c1e20
        .extern func_ov002_021dec2c
        .extern func_ov002_021df680
        .global func_ov002_022547c4
        .arm
func_ov002_022547c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_7a8
    ldr r0, _LIT0
    mov r8, #0x0
    mov r6, r8
    mov r9, r8
    mvn r4, #0x0
    sub r5, r0, #0x11
    mov fp, #0x1
.L_6a0:
    mov r7, #0x0
    rsb sl, r6, #0x1
.L_6a8:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_6f4
    ldr r1, _LIT0
    mov r0, sl
    mov r2, r4
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c1e20
    cmp r0, #0x0
    addeq r0, r7, r9
    orreq r8, r8, fp, lsl r0
.L_6f4:
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_6a8
    add r6, r6, #0x1
    cmp r6, #0x2
    add r9, r9, #0x10
    blt .L_6a0
    cmp r8, #0x0
    beq .L_7a8
    ldr r1, _LIT0
    mvn r0, #0x0
    bl func_ov002_021df680
    mvn r0, #0x0
    ldr r5, _LIT0
    mov fp, #0x0
    mov r4, #0x1
    str r0, [sp]
.L_738:
    ldr r0, _LIT1
    ldr r2, [sp]
    ldr r0, [r0, #0xcec]
    mov r1, r5
    eor r6, r0, fp
    rsb r0, r6, #0x1
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movgt sl, #0x1
    movle sl, #0x0
    mov r9, #0x0
    mov r7, r6, lsl #0x4
.L_768:
    tst r8, r4, lsl r7
    beq .L_784
    mov r0, r6
    mov r1, r9
    mov r2, sl
    mov r3, r5
    bl func_ov002_021dec2c
.L_784:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r7, r7, #0x1
    blt .L_768
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_738
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000012fb
_LIT1: .word data_ov002_022d016c
