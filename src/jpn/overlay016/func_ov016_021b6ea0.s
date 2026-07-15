; func_ov016_021b6ea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b95e0
        .extern data_ov016_021b9624
        .extern data_ov016_021ba5e0
        .extern data_ov016_021bab2c
        .extern data_ov016_021bab44
        .extern data_ov016_021bb164
        .extern data_ov016_021bb264
        .extern func_020371b8
        .extern func_0208dfb8
        .extern func_02094410
        .extern func_02094500
        .extern func_02094688
        .extern func_ov016_021b7398
        .extern func_ov016_021b745c
        .global func_ov016_021b6ea0
        .arm
func_ov016_021b6ea0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r4, [r7, #0xc]
    ldr r3, [r7, #0x10]
    ldr r2, _LIT0
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0x3f4]
    add r6, r4, r3
    mov r0, #0x54
    ldr r1, [r7, #0x8]
    mla r5, r6, r0, r2
    cmp r6, r1
    ldr r4, _LIT2
    bge .L_90
    mov r8, r0
    mov sl, #0x0
    mov r9, r0
.L_4c:
    sub r0, r1, #0x1
    cmp r6, r0
    bne .L_6c
    mov r0, r5
    mov r1, sl
    mov r2, r9
    bl func_02094500
    b .L_7c
.L_6c:
    mov r1, r5
    mov r2, r8
    add r0, r5, #0x54
    bl func_02094688
.L_7c:
    ldr r1, [r7, #0x8]
    add r6, r6, #0x1
    cmp r6, r1
    add r5, r5, #0x54
    blt .L_4c
.L_90:
    ldr r0, [r7, #0x8]
    subs r0, r0, #0x1
    str r0, [r7, #0x8]
    bne .L_e4
    ldr r5, _LIT3
    mov r0, #0x42
    ldr r2, [r5]
    ldr r1, [r5]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x10
    orr r4, r2, r1, lsl #0x8
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5]
    bl func_020371b8
    mov r0, #0x2
    str r0, [r7]
    b .L_1f4
.L_e4:
    mov r1, #0x0
    str r1, [r7, #0x10]
    mov r0, r7
    str r1, [r7, #0xc]
    bl func_ov016_021b745c
    ldr r5, [r7, #0x8]
    cmp r5, #0x6
    ble .L_158
    add r9, r4, #0x44
    mov r8, #0x0
    mov r4, #0x6
    ldr r6, _LIT4
    ldr r5, _LIT5
    b .L_13c
.L_11c:
    mov r0, r7
    mov r1, r9
    mov r2, r8
    mov r3, r5
    str r6, [sp]
    bl func_ov016_021b7398
    add r9, r9, #0x54
    add r8, r8, #0x1
.L_13c:
    ldr r0, [r7, #0x8]
    cmp r0, #0x6
    movgt r0, r4
    add r0, r0, #0x1
    cmp r8, r0
    blt .L_11c
    b .L_1c4
.L_158:
    bge .L_178
    bl func_0208dfb8
    add r1, r5, r5, lsl #0x1
    add r1, r1, #0x1
    add r1, r0, r1, lsl #0x6
    mov r0, #0x0
    mov r2, #0xc0
    bl func_02094410
.L_178:
    add r9, r4, #0x44
    mov r8, #0x0
    mov r4, #0x6
    ldr r6, _LIT4
    ldr r5, _LIT5
    b .L_1b0
.L_190:
    mov r0, r7
    mov r1, r9
    mov r2, r8
    mov r3, r5
    str r6, [sp]
    bl func_ov016_021b7398
    add r9, r9, #0x54
    add r8, r8, #0x1
.L_1b0:
    ldr r0, [r7, #0x8]
    cmp r0, #0x6
    movgt r0, r4
    cmp r8, r0
    blt .L_190
.L_1c4:
    ldr r3, [r7, #0xc]
    ldr r0, [r7, #0x10]
    ldr r1, _LIT6
    mov r2, #0x1
    add r3, r3, r0
    ldr r0, _LIT7
    str r3, [r1, #0x1dc]
    strh r2, [r0, #0xd8]
    sub r0, r2, #0x81
    str r0, [r1, #0x1e0]
    sub r0, r2, #0xb9
    str r0, [r1, #0x1e8]
.L_1f4:
    ldr r0, [r7, #0x10]
    str r0, [r7, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov016_021b9624
_LIT1: .word data_ov016_021ba5e0
_LIT2: .word data_ov016_021b95e0
_LIT3: .word 0x04001000
_LIT4: .word data_ov016_021bab2c
_LIT5: .word data_ov016_021bab44
_LIT6: .word data_ov016_021bb164
_LIT7: .word data_ov016_021bb264
