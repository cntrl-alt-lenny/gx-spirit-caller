; func_ov002_02298768 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_ov002_021b8f80
        .extern func_ov002_021bb068
        .extern func_ov002_021bcf00
        .extern func_ov002_021bd09c
        .extern func_ov002_021c9be8
        .extern func_ov002_021c9c48
        .extern func_ov002_02259774
        .extern func_ov002_0228130c
        .extern func_ov002_022819d4
        .global func_ov002_02298768
        .arm
func_ov002_02298768:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mvn r1, #0x0
    str r1, [sp]
    mov sl, r0
    mov r9, r1
    bl func_ov002_021bd09c
    cmp r0, #0x2
    blt .L_230
    mov r0, sl
    bl func_ov002_021c9c48
    cmp r0, #0x0
    beq .L_230
    mov r0, sl
    bl func_ov002_022819d4
    cmp r0, #0x0
    beq .L_230
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r0, r1, r0
    ldr r1, _LIT1
    str r0, [sp, #0x4]
    ldr r0, [r1, r0]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_1bc
    ldr r1, _LIT2
    ldr r0, [sp, #0x4]
    add r8, r1, r0
    ldr r0, _LIT3
    add r7, r8, #0x120
    sub fp, r0, #0x72
    sub r0, r0, #0x1
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    sub r4, r0, #0x72
    sub r0, r0, #0x1
    str r0, [sp, #0x8]
    ldr r0, _LIT4
    add r0, r0, #0x358
    str r0, [sp, #0x10]
.L_a4:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    bne .L_1a8
    mov r0, sl
    mov r1, r6
    bl func_ov002_021c9be8
    cmp r0, #0x0
    beq .L_1a8
    mov r0, sl
    mov r1, r6
    bl func_ov002_0228130c
    cmp r0, #0x0
    beq .L_1a8
    mov r0, r6
    bl func_ov002_021b8f80
    cmp r0, #0x0
    bne .L_1a8
    mov r0, r6
    mov r9, #0x1
    bl func_0202b878
    cmp r0, #0x16
    bne .L_138
    mov r0, r6
    bl func_0202b8c0
    cmp r0, #0x5
    beq .L_12c
    ldr r0, _LIT3
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_134
.L_12c:
    mov r9, #0x1
    b .L_138
.L_134:
    mov r9, #0x0
.L_138:
    ldr r0, [r7]
    mov r0, r0, lsl #0x12
    cmp sl, r0, lsr #0x1f
    movne r9, #0x0
    cmp r6, r4
    bgt .L_168
    cmp r6, fp
    bge .L_194
    ldr r0, _LIT4
    cmp r6, r0
    moveq r9, #0x1
    b .L_198
.L_168:
    ldr r0, [sp, #0x8]
    cmp r6, r0
    bgt .L_184
    ldr r0, [sp, #0xc]
    cmp r6, r0
    moveq r9, #0x0
    b .L_198
.L_184:
    ldr r0, [sp, #0x10]
    cmp r6, r0
    moveq r9, #0x1
    b .L_198
.L_194:
    mov r9, #0x1
.L_198:
    cmp r9, #0x0
    mov r9, r5
    strne r5, [sp]
    bne .L_1bc
.L_1a8:
    add r7, r7, #0x4
    add r5, r5, #0x1
    ldr r0, [r8, #0xc]
    cmp r5, r0
    bcc .L_a4
.L_1bc:
    ldr r0, [sp]
    cmp r0, #0x0
    bge .L_1f4
    cmp r9, #0x0
    blt .L_1f4
    mov r0, sl
    bl func_ov002_021bcf00
    cmp r0, #0x0
    bne .L_1f4
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    ldr r0, [r1, r0]
    cmp r0, #0x5
    strcs r9, [sp]
.L_1f4:
    ldr r0, [sp]
    cmp r0, #0x0
    blt .L_230
    ldr r4, _LIT5
    ldr r2, [sp]
    mov r0, sl
    mov r1, #0xb
    mov r3, #0x7
    str sl, [r4, #0xd6c]
    bl func_ov002_02259774
    mov r1, r4
    mov r0, #0x1
    str r0, [r1, #0xd54]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_230:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00001390
_LIT4: .word 0x000010dd
_LIT5: .word data_ov002_022d016c
