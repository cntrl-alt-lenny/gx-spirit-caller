; func_ov002_02298658 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_ov002_021b8ea0
        .extern func_ov002_021baf88
        .extern func_ov002_021bce20
        .extern func_ov002_021bcfbc
        .extern func_ov002_021c9b08
        .extern func_ov002_021c9b68
        .extern func_ov002_0225968c
        .extern func_ov002_022811fc
        .extern func_ov002_022818c4
        .global func_ov002_02298658
        .arm
func_ov002_02298658:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mvn r1, #0x0
    str r1, [sp]
    mov sl, r0
    mov r9, r1
    bl func_ov002_021bcfbc
    cmp r0, #0x2
    blt .L_c30
    mov r0, sl
    bl func_ov002_021c9b68
    cmp r0, #0x0
    beq .L_c30
    mov r0, sl
    bl func_ov002_022818c4
    cmp r0, #0x0
    beq .L_c30
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r0, r1, r0
    ldr r1, _LIT1
    str r0, [sp, #0x4]
    ldr r0, [r1, r0]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_bbc
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
.L_aa4:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_ba8
    mov r0, sl
    mov r1, r6
    bl func_ov002_021c9b08
    cmp r0, #0x0
    beq .L_ba8
    mov r0, sl
    mov r1, r6
    bl func_ov002_022811fc
    cmp r0, #0x0
    beq .L_ba8
    mov r0, r6
    bl func_ov002_021b8ea0
    cmp r0, #0x0
    bne .L_ba8
    mov r0, r6
    mov r9, #0x1
    bl func_0202b824
    cmp r0, #0x16
    bne .L_b38
    mov r0, r6
    bl func_0202b86c
    cmp r0, #0x5
    beq .L_b2c
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_b34
.L_b2c:
    mov r9, #0x1
    b .L_b38
.L_b34:
    mov r9, #0x0
.L_b38:
    ldr r0, [r7]
    mov r0, r0, lsl #0x12
    cmp sl, r0, lsr #0x1f
    movne r9, #0x0
    cmp r6, r4
    bgt .L_b68
    cmp r6, fp
    bge .L_b94
    ldr r0, _LIT4
    cmp r6, r0
    moveq r9, #0x1
    b .L_b98
.L_b68:
    ldr r0, [sp, #0x8]
    cmp r6, r0
    bgt .L_b84
    ldr r0, [sp, #0xc]
    cmp r6, r0
    moveq r9, #0x0
    b .L_b98
.L_b84:
    ldr r0, [sp, #0x10]
    cmp r6, r0
    moveq r9, #0x1
    b .L_b98
.L_b94:
    mov r9, #0x1
.L_b98:
    cmp r9, #0x0
    mov r9, r5
    strne r5, [sp]
    bne .L_bbc
.L_ba8:
    add r7, r7, #0x4
    add r5, r5, #0x1
    ldr r0, [r8, #0xc]
    cmp r5, r0
    bcc .L_aa4
.L_bbc:
    ldr r0, [sp]
    cmp r0, #0x0
    bge .L_bf4
    cmp r9, #0x0
    blt .L_bf4
    mov r0, sl
    bl func_ov002_021bce20
    cmp r0, #0x0
    bne .L_bf4
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    ldr r0, [r1, r0]
    cmp r0, #0x5
    strcs r9, [sp]
.L_bf4:
    ldr r0, [sp]
    cmp r0, #0x0
    blt .L_c30
    ldr r4, _LIT5
    ldr r2, [sp]
    mov r0, sl
    mov r1, #0xb
    mov r3, #0x7
    str sl, [r4, #0xd6c]
    bl func_ov002_0225968c
    mov r1, r4
    mov r0, #0x1
    str r0, [r1, #0xd54]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c30:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001390
_LIT4: .word 0x000010dd
_LIT5: .word data_ov002_022d008c
