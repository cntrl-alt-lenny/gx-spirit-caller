; func_ov002_0224a690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a4
        .extern func_0202e1e0
        .extern func_020307b4
        .extern func_02030b30
        .extern func_ov002_021b3ef8
        .extern func_ov002_021ca310
        .extern func_ov002_021ca360
        .extern func_ov002_02253370
        .global func_ov002_0224a690
        .arm
func_ov002_0224a690:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r8, r1, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r8]
    cmp r0, #0x0
    bls .L_8c
    ldr r0, _LIT2
    mov r7, #0xb
    add r6, r0, r8
    add r5, r6, #0x120
.L_38:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_78
    mov r0, sl
    mov r1, r9
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_78
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_02253370
.L_78:
    ldr r0, [r6, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_38
.L_8c:
    ldr r0, _LIT3
    mov r9, #0x0
    ldr r0, [r0, r8]
    cmp r0, #0x0
    bls .L_138
    ldr r0, _LIT2
    ldr fp, _LIT4
    add r7, r0, r8
    add r6, r7, #0x260
    mov r4, #0xb
.L_b4:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_124
    mov r0, sl
    mov r1, r5
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_124
    ldr r2, [r6]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r5, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r4
    mov r2, fp
    add r3, r3, r5, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_124
    mov r0, sl
    mov r1, #0xd
    mov r2, r9
    bl func_ov002_02253370
.L_124:
    ldr r0, [r7, #0x10]
    add r9, r9, #0x1
    cmp r9, r0
    add r6, r6, #0x4
    bcc .L_b4
.L_138:
    ldr r0, _LIT5
    mov r6, #0x0
    ldr r0, [r0, r8]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov r7, #0xc
    add r5, r0, r8
    add r4, r5, #0x3a0
.L_15c:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_020307b4
    cmp r0, #0x0
    beq .L_1ac
    mov r0, r8
    bl func_02030b30
    cmp r0, #0x0
    beq .L_1ac
    mov r0, sl
    mov r1, r8
    bl func_ov002_021ca310
    cmp r0, #0x0
    beq .L_1ac
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_02253370
.L_1ac:
    ldr r0, [r5, #0x18]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_15c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf09c
_LIT4: .word 0x000012a1
_LIT5: .word data_ov002_022cf0a4
