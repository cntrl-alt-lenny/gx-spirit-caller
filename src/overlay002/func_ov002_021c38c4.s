; func_ov002_021c38c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0250
        .extern func_0202b8a8
        .extern func_ov002_021b3e28
        .extern func_ov002_021b422c
        .extern func_ov002_021b9128
        .extern func_ov002_021bd6c8
        .global func_ov002_021c38c4
        .arm
func_ov002_021c38c4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r1
    ldr r1, _LIT0
    mov r2, r5, lsl #0x2
    ldrh r1, [r1, r2]
    mov r4, r0
    mov r0, r1, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202b8a8
    movs sl, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov002_021b422c
    cmp r0, #0x0
    movgt sl, r0
    mov r0, r6
    mov r1, #0x3
    bl func_ov002_021b9128
    cmp r0, #0x0
    beq .L_e4
    ldr r8, _LIT2
    ldr r5, _LIT3
    ldr r6, _LIT4
    mov r9, #0x0
    mov r7, #0x1
.L_70:
    and r0, r9, #0x1
    mla r1, r0, r5, r8
    ldr r0, [r1, #0xf8]
    mov r0, r0, lsl #0x13
    cmp r6, r0, lsr #0x13
    mov r0, r0, lsr #0x13
    bne .L_d8
    ldr ip, [r1, #0x108]
    add r1, r1, #0x100
    mov r3, ip, lsr #0x6
    mov r2, ip, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, ip, lsr #0x1
    and r2, r2, #0x1
    ldrh ip, [r1]
    mvn r3, r3
    mvn r1, r2
    and r2, ip, r3
    tst r2, r1
    beq .L_d8
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    beq .L_d8
    sub sl, sl, #0x1
    cmp sl, #0x1
    movlt sl, r7
.L_d8:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_70
.L_e4:
    ldr r2, _LIT5
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3e28
    cmp r0, #0x0
    beq .L_108
    sub sl, sl, r0, lsl #0x1
    cmp sl, #0x1
    movlt sl, #0x1
.L_108:
    mov r0, sl
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word 0x000018d9
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word 0x0000150b
_LIT5: .word 0x000015c7
