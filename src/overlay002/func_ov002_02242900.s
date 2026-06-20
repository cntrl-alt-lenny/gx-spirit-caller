; func_ov002_02242900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c4c9c
        .extern func_ov002_021df780
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223de94
        .extern func_ov002_022575c8
        .extern func_ov002_0226b298
        .global func_ov002_02242900
        .arm
func_ov002_02242900:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x0
    beq .L_30
    cmp r1, #0xa
    beq .L_a0
    cmp r1, #0xb
    beq .L_164
    b .L_198
.L_30:
    mov r6, #0x0
    mov r5, r6
.L_38:
    mov r7, r5
.L_3c:
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_7c
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_0223dcc0
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0x5b8]
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_7c:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_3c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_38
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_a0:
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    add r2, sp, #0x0
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4c9c
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x14]
    ldr r2, _LIT1
    cmp r1, r0
    movle r1, r0
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and ip, r0, #0x1
    mul r2, ip, r2
    ldr r2, [r3, r2]
    ldr ip, _LIT3
    sub r2, r2, #0x1
    cmp r1, r2
    movge r1, r2
    ldr r2, _LIT4
    cmp r1, r2
    movge r1, r2
    mov r3, r1, lsr #0x1f
    smull r1, r2, ip, r1
    add r2, r3, r2, asr #0x5
    cmp r2, #0xff
    movge r2, #0xff
    cmp r2, #0x0
    bne .L_140
    mov r0, #0x0
    strh r0, [r4, #0xc]
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_140:
    ldrh r1, [r4]
    bl func_ov002_0226b298
    ldr r1, _LIT0
    add sp, sp, #0x2c
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_164:
    ldr r0, _LIT5
    ldrh r1, [r4, #0x2]
    ldrh r3, [r0, #0xb0]
    mov r0, #0x64
    mov r2, r1, lsl #0x1f
    mul r5, r3, r0
    mov r1, r5
    mov r0, r2, lsr #0x1f
    bl func_ov002_021df780
    add sp, sp, #0x2c
    strh r5, [r4, #0xc]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_198:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x51eb851f
_LIT4: .word 0x0000ffff
_LIT5: .word data_ov002_022d0e6c
