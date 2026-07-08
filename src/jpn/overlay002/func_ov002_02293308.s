; func_ov002_02293308 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb98
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202de48
        .extern func_0202f994
        .extern func_ov002_021afa94
        .extern func_ov002_0227ed24
        .extern func_ov002_02280594
        .extern func_ov002_0228090c
        .global func_ov002_02293308
        .arm
func_ov002_02293308:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280594
    cmp r0, #0x0
    blt .L_16c
    ldr r1, _LIT0
    ldrh r0, [r6]
    ldr r1, [r1, #0x8]
    bl func_ov002_0227ed24
    cmp r0, #0x0
    bne .L_16c
    bl func_ov002_021afa94
    ldr r2, [r0]
    ldrh r1, [r6]
    ldr r0, _LIT1
    mov r2, r2, lsl #0x13
    cmp r1, r0
    mov r4, r2, lsr #0x13
    bgt .L_7c
    cmp r1, r0
    bge .L_b0
    sub r0, r0, #0x3f
    cmp r1, r0
    beq .L_a0
    b .L_e4
.L_7c:
    ldr r0, _LIT2
    cmp r1, r0
    bgt .L_e4
    cmp r1, #0x1880
    blt .L_e4
    beq .L_a0
    cmp r1, r0
    beq .L_b0
    b .L_e4
.L_a0:
    mov r0, r4
    bl func_0202b8cc
    mov r5, r0
    b .L_f0
.L_b0:
    mov r0, r4
    bl func_0202b89c
    mov r5, r0
    mov r0, r4
    bl func_0202b8cc
    cmp r5, r0
    mov r0, r4
    ble .L_d8
    bl func_0202b89c
    b .L_dc
.L_d8:
    bl func_0202b8cc
.L_dc:
    mov r5, r0
    b .L_f0
.L_e4:
    mov r0, r4
    bl func_0202b89c
    mov r5, r0
.L_f0:
    ldrh r0, [r6, #0x2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x0
    bl func_ov002_0228090c
    ldr r0, _LIT3
    cmp r5, r0
    ble .L_138
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    cmp r1, r0
    movle r1, r0
    sub r0, r1, #0x1f4
    cmp r5, r0
    bge .L_160
.L_138:
    cmp r5, #0x3e8
    ble .L_16c
    mov r0, r4
    bl func_0202de48
    cmp r0, #0x0
    beq .L_16c
    mov r0, r4
    bl func_0202f994
    cmp r0, #0x0
    bne .L_16c
.L_160:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_16c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word 0x00001536
_LIT2: .word 0x00001881
_LIT3: .word 0x000006a4
