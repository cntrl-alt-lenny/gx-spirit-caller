; func_ov002_02222e18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_0202e2d4
        .extern func_ov002_021ae320
        .extern func_ov002_021d7880
        .extern func_ov002_021e26d0
        .extern func_ov002_0226aea4
        .global func_ov002_02222e18
        .arm
func_ov002_02222e18:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    bgt .L_44
    bge .L_108
    cmp r0, #0x64
    bgt .L_18c
    cmp r0, #0x62
    blt .L_18c
    beq .L_16c
    cmp r0, #0x63
    beq .L_150
    cmp r0, #0x64
    beq .L_130
    b .L_18c
.L_44:
    cmp r0, #0x80
    bne .L_18c
    ldrh r1, [r7, #0x2]
    ldr r8, _LIT1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    and r1, r1, #0x1
    mul r2, r1, r8
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r0, #0x0
    mov r5, #0x0
    bls .L_100
    ldr r4, _LIT3
    mov r6, r5
.L_90:
    add r0, r4, r2
    add r0, r0, r6
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2d4
    cmp r0, #0x0
    beq .L_d0
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aea4
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d0:
    ldrh r0, [r7, #0x2]
    add r5, r5, #0x1
    add r6, r6, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r0, r0, #0x1
    mul r2, r0, r8
    add r0, r4, r2
    ldr r0, [r0, #0xc]
    cmp r5, r0
    bcc .L_90
.L_100:
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_108:
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT4
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldrh r1, [r0, #0xb0]
    rsb r0, r3, #0x1
    bl func_ov002_021d7880
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_130:
    ldrh r0, [r7, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x63
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_150:
    ldrh r0, [r7, #0x2]
    mov r1, #0x11
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x62
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_16c:
    ldrh r0, [r7, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022d0d8c
