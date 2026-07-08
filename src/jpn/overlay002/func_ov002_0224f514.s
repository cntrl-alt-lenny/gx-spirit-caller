; func_ov002_0224f514 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern func_0202b854
        .extern func_0202ea74
        .extern func_ov002_021c37e4
        .extern func_ov002_021ca360
        .extern func_ov002_02253370
        .global func_ov002_0224f514
        .arm
func_ov002_0224f514:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    ldr r0, _LIT0
    and r1, r4, #0x1
    mul sl, r1, r0
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, sl]
    cmp r0, #0x0
    bls .L_b4
    ldr r0, _LIT2
    mov r5, #0xb
    add r9, r0, sl
    add r8, r9, #0x120
.L_38:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202ea74
    cmp r0, #0x0
    beq .L_a0
    ldr r2, [r8]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    cmp r0, #0x4
    bgt .L_a0
    mov r0, r4
    mov r1, r7
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_a0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02253370
.L_a0:
    ldr r0, [r9, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, #0x4
    bcc .L_38
.L_b4:
    ldr r0, _LIT3
    mov r7, #0x0
    ldr r0, [r0, sl]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r8, #0xd
    add r6, r0, sl
    add r5, r6, #0x260
.L_d8:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202ea74
    cmp r0, #0x0
    beq .L_128
    mov r0, r9
    bl func_0202b854
    cmp r0, #0x4
    bgt .L_128
    mov r0, r4
    mov r1, r9
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_128
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov002_02253370
.L_128:
    ldr r0, [r6, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_d8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf09c
