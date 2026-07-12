; func_ov016_021b4ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105a90
        .extern data_ov016_021b9154
        .extern data_ov016_021b95e0
        .extern data_ov016_021baad8
        .extern func_02007218
        .extern func_0202c06c
        .extern func_020371b8
        .extern func_02052e1c
        .extern func_02052f14
        .extern func_020534d0
        .extern func_02091554
        .extern func_02094500
        .extern func_ov016_021b3978
        .extern func_ov016_021b53f0
        .global func_ov016_021b4ac0
        .arm
func_ov016_021b4ac0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r6, r0
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_db8
    b .L_a04
    b .L_a6c
    b .L_a98
    b .L_ae8
    b .L_ac4
.L_a04:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r5, r2, #0x1000
    ldr r0, [r5]
    ldr r1, [r5]
    and r0, r0, #0x1f00
    mov r3, r0, lsr #0x8
    mov r0, #0x42
    bic r2, r1, #0x1f00
    bic r1, r3, #0x10
    orr r4, r2, r1, lsl #0x8
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5]
    bl func_020371b8
    mov r0, #0x2
    str r0, [r6]
    b .L_e34
.L_a6c:
    ldr r1, [r6, #0x14]
    cmp r1, #0x0
    ble .L_e34
    mov r0, #0x38
    sub r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r6, #0x14]
    bl func_020371b8
    b .L_e34
.L_a98:
    ldr r1, [r6, #0x14]
    cmp r1, #0xb
    bge .L_e34
    mov r0, #0x38
    add r4, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r6, #0x14]
    bl func_020371b8
    b .L_e34
.L_ac4:
    mov r2, #0x0
    sub r1, r2, #0x1
    str r2, [r6, #0x14]
    str r1, [r6, #0x10]
    mov r0, #0x3a
    mov r3, #0x1
    str r1, [r6, #0xc]
    bl func_020371b8
    b .L_e34
.L_ae8:
    ldr r0, [r6, #0x10]
    mov r5, #0x0
    orr r0, r0, #0x0
    str r0, [sp, #0x8]
    ldr r1, [r6, #0xc]
    ldr lr, [sp, #0x8]
    orr r0, r1, #0x0
    str r0, [sp, #0x4]
    mov r7, r0
    mov r4, r5
    mov r8, r5
    mov sl, r5
    mov r9, #0x1
    mov r0, #0xa
    mov fp, r5
.L_b24:
    and r3, lr, #0x0
    and ip, r7, #0xf
    cmp r3, fp
    cmpeq ip, #0xf
    bne .L_b58
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b58:
    mov r7, r7, lsr #0x4
    mov r1, lr, lsr #0x4
    orr r7, r7, lr, lsl #0x1c
    mov lr, r1
    umull r2, r1, ip, r9
    mla r1, ip, r8, r1
    mla r1, r3, r9, r1
    adds r5, r5, r2
    adc r4, r4, r1
    add sl, sl, #0x1
    mov r1, #0x0
    umull r2, r3, r9, r0
    mla r3, r9, r1, r3
    mla r3, r8, r0, r3
    cmp sl, #0xc
    mov r9, r2
    mov r8, r3
    blt .L_b24
    ldmib r6, {r0, r1}
    orr r2, r0, #0x0
    ldr r0, [sp, #0x8]
    orr r1, r1, #0x0
    cmp r1, r0
    ldr r0, [sp, #0x4]
    cmpeq r2, r0
    bne .L_bf8
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT0
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_ov016_021b53f0
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bf8:
    ldr r0, _LIT2
    mov r1, r5
    mov r2, r4
    bl func_020534d0
    cmp r0, #0x0
    bne .L_c48
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT0
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_ov016_021b53f0
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c48:
    ldr r0, _LIT3
    mov r8, #0x0
    add r7, r0, #0x44
.L_c54:
    mov r0, r7
    bl func_02052f14
    cmp r4, r1
    cmpeq r5, r0
    bne .L_ca0
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT4
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_ov016_021b53f0
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ca0:
    ldr r0, [r7, #0x48]
    cmp r0, #0x0
    bne .L_cc0
    mov r0, r7
    mov r1, #0x0
    mov r2, #0x54
    bl func_02094500
    b .L_cd0
.L_cc0:
    add r8, r8, #0x1
    cmp r8, #0x3c
    add r7, r7, #0x54
    blt .L_c54
.L_cd0:
    cmp r8, #0x3c
    bge .L_d80
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_02052e1c
    mov r0, #0x0
    sub r1, r0, #0x1
    mov r2, r1
    add r0, sp, #0xc
    and r1, r5, r1
    and r2, r4, r2
    bl func_ov016_021b3978
    mov r1, #0x1
    strb r1, [r7, #0x10]
    ldrh r0, [sp, #0xc]
    ldr r1, _LIT5
    str r0, [sp]
    ldrh r2, [sp, #0x10]
    ldrh r3, [sp, #0xe]
    add r0, r7, #0x11
    bl func_02091554
    bl func_02007218
    str r0, [r7, #0xc]
    mov r0, #0x3a
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r7, #0x48]
    bl func_020371b8
    ldr r0, _LIT6
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_ov016_021b53f0
    ldr r0, _LIT3
    mov r1, #0x1
    add r0, r0, #0x1000
    str r1, [r0, #0x3f4]
    add sp, sp, #0x14
    str r1, [r6, #0x20]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d80:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, _LIT7
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_ov016_021b53f0
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_db8:
    ldr r0, [r6, #0x14]
    cmp r0, #0x4
    rsblt r0, r0, #0x3
    subge r0, r0, #0x4
    addlt r5, r6, #0x10
    rsbge r0, r0, #0x7
    addge r5, r6, #0xc
    mov r4, r0, lsl #0x2
    mov r0, #0xf
    mvn r2, r0, lsl r4
    ldr r3, [r5]
    sub r0, r1, #0x5
    and r1, r3, r2
    orr r0, r1, r0, lsl r4
    str r0, [r5]
    ldr r0, [r6, #0x14]
    cmp r0, #0xb
    bne .L_e10
    mov r0, #0x3
    str r0, [r6, #0x18]
    mov r0, #0x2
    str r0, [r6, #0x1c]
.L_e10:
    ldr r0, [r6, #0x14]
    mov r2, #0x0
    cmp r0, #0xb
    addlt r0, r0, #0x1
    strlt r0, [r6, #0x14]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
.L_e34:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000677
_LIT1: .word data_ov016_021baad8
_LIT2: .word data_02105a90
_LIT3: .word data_ov016_021b95e0
_LIT4: .word 0x000006b2
_LIT5: .word data_ov016_021b9154
_LIT6: .word 0x000006b1
_LIT7: .word 0x00000676
