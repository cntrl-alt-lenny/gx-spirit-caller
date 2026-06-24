; func_02021458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02194260
        .extern func_020219e8
        .extern func_02021c68
        .extern func_02023520
        .extern func_0202404c
        .extern func_02024594
        .extern func_020270f0
        .extern func_020287b0
        .extern func_0202a2a4
        .global func_02021458
        .arm
func_02021458:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r5, r0
    mov r4, r1
    ldr r2, _LIT0
    bne .L_24
    ldr r1, [r2, #0x4]
    ldr r0, _LIT1
    add r2, r2, #0x34
    mla r5, r1, r0, r2
.L_24:
    ldr r0, [r5, #0x14]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_c8
    add r7, r5, #0x18
.L_38:
    ldr r0, [r7]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_b4
    b .L_64
    b .L_70
    b .L_7c
    b .L_88
    b .L_94
    b .L_a0
    b .L_ac
.L_64:
    ldr r0, [r7, #0x4]
    bl func_02021c68
    b .L_b4
.L_70:
    ldr r0, [r7, #0x4]
    bl func_02023520
    b .L_b4
.L_7c:
    ldr r0, [r7, #0x4]
    bl func_0202404c
    b .L_b4
.L_88:
    ldr r0, [r7, #0x4]
    bl func_02024594
    b .L_b4
.L_94:
    ldr r0, [r7, #0x4]
    bl func_020270f0
    b .L_b4
.L_a0:
    ldr r0, [r7, #0x4]
    bl func_020287b0
    b .L_b4
.L_ac:
    ldr r0, [r7, #0x4]
    bl func_0202a2a4
.L_b4:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0xc
    blt .L_38
.L_c8:
    ldr r2, _LIT1
    mov r1, r5
    mov r0, #0x0
    bl Fill32
    mov r1, r4
    str r4, [r5, #0x4]
.L_e0:
    ldr r0, [r1]
    movs r0, r0, lsr #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r0, #0xf1
    bne .L_108
    mov r0, r5
    bl func_020219e8
    str r0, [r5, #0x14]
    b .L_110
.L_108:
    add r1, r1, #0x4
    b .L_e0
.L_110:
    ldr r1, [r5, #0x8]
    mov r0, #0x1
    orr r1, r1, #0x8
    str r1, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02194260
_LIT1: .word 0x00000618
