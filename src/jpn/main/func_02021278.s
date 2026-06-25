; func_02021278 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02194260
        .extern func_02021150
        .extern func_02021b58
        .extern func_02021c68
        .extern func_02023424
        .extern func_02023520
        .extern func_02023f98
        .extern func_0202404c
        .extern func_02024494
        .extern func_02024594
        .extern func_02026ff4
        .extern func_020270f0
        .extern func_0202864c
        .extern func_020287b0
        .extern func_0202a1ec
        .extern func_0202a2a4
        .global func_02021278
        .arm
func_02021278:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1]
    ldr r4, _LIT1
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x14]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_d4
    add r7, r5, #0x18
.L_44:
    ldr r0, [r7]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_c0
    b .L_70
    b .L_7c
    b .L_88
    b .L_94
    b .L_a0
    b .L_ac
    b .L_b8
.L_70:
    ldr r0, [r7, #0x4]
    bl func_02021c68
    b .L_c0
.L_7c:
    ldr r0, [r7, #0x4]
    bl func_02023520
    b .L_c0
.L_88:
    ldr r0, [r7, #0x4]
    bl func_0202404c
    b .L_c0
.L_94:
    ldr r0, [r7, #0x4]
    bl func_02024594
    b .L_c0
.L_a0:
    ldr r0, [r7, #0x4]
    bl func_020270f0
    b .L_c0
.L_ac:
    ldr r0, [r7, #0x4]
    bl func_020287b0
    b .L_c0
.L_b8:
    ldr r0, [r7, #0x4]
    bl func_0202a2a4
.L_c0:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0xc
    blt .L_44
.L_d4:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    beq .L_e8
    ldr r0, [r5, #0x10]
    blx r1
.L_e8:
    ldr r2, _LIT2
    mov r1, r5
    mov r0, #0x0
    bl Fill32
    ldr r0, [r4, #0x8]
    subs r0, r0, #0x1
    str r0, [r4, #0x8]
    bne .L_14c
    mov r0, #0x0
    str r0, [r4]
    bl func_02021b58
    mov r0, #0x1
    bl func_02021150
    cmp r0, #0x0
    bne .L_130
    bl func_02023424
    bl func_02023f98
    bl func_02024494
.L_130:
    mov r0, #0x2
    bl func_02021150
    cmp r0, #0x0
    bne .L_148
    bl func_02026ff4
    bl func_0202864c
.L_148:
    bl func_0202a1ec
.L_14c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02194260
_LIT1: .word data_02194260
_LIT2: .word 0x00000618
