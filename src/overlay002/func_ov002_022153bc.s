; func_ov002_022153bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021b3fd8
        .extern func_ov002_021e104c
        .extern func_ov002_0226ad5c
        .global func_ov002_022153bc
        .arm
func_ov002_022153bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldrh r3, [r0]
    ldr r2, _LIT0
    mov r1, #0x0
    cmp r3, r2
    beq .L_34
    ldr r2, _LIT1
    cmp r3, r2
    beq .L_44
    ldr r2, _LIT2
    cmp r3, r2
    beq .L_58
    b .L_68
.L_34:
    ldrh r0, [r0, #0x8]
    mov r1, #0x3
    and r6, r0, #0x1
    b .L_68
.L_44:
    ldrh r0, [r0, #0x2]
    mov r1, #0x2
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
    b .L_68
.L_58:
    ldrh r0, [r0, #0x2]
    mov r1, #0x2
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
.L_68:
    ldr r2, _LIT3
    ldr r0, [r2, #0x5a8]
    cmp r0, #0x7f
    beq .L_a8
    cmp r0, #0x80
    bne .L_15c
    ldr r0, _LIT4
    and r3, r6, #0x1
    mul r4, r3, r0
    ldr r3, _LIT5
    mov r0, r6
    ldr r3, [r3, r4]
    str r3, [r2, #0x5ac]
    bl func_ov002_021e104c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a8:
    ldr r0, _LIT4
    and r1, r6, #0x1
    mul r3, r1, r0
    ldr r0, _LIT5
    mov r8, #0x0
    ldr r1, [r0, r3]
    ldr r0, [r2, #0x5ac]
    mov r7, r8
    cmp r1, #0x0
    sub fp, r1, r0
    bls .L_12c
    ldr r0, _LIT6
    ldr r4, _LIT7
    add sl, r0, r3
    add r9, sl, #0x120
    mov r5, #0xb
.L_e8:
    ldr r2, [r9]
    mov r0, r6
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov ip, r1, lsl #0x1
    mov r1, r5
    mov r2, r4
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    ldr r0, [sl, #0xc]
    add r7, r7, #0x1
    addne r8, r8, #0x1
    cmp r7, r0
    add r9, r9, #0x4
    bcc .L_e8
.L_12c:
    cmp r8, #0x1
    sub r1, fp, #0x1
    subgt r0, r8, #0x1
    subgt r1, r1, r0
    cmp r1, #0x0
    ble .L_154
    mov r2, #0x0
    mov r0, r6
    mov r3, r2
    bl func_ov002_0226ad5c
.L_154:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000012cc
_LIT1: .word 0x0000187d
_LIT2: .word 0x000019b7
_LIT3: .word data_ov002_022ce288
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf178
_LIT6: .word data_ov002_022cf16c
_LIT7: .word 0x000012a1
