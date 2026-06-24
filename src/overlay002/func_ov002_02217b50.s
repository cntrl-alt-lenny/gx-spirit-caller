; func_ov002_02217b50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0e6c
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_021ae430
        .extern func_ov002_021af9d0
        .extern func_ov002_021b9b64
        .extern func_ov002_021d8288
        .extern func_ov002_021e13f4
        .extern func_ov002_021e1bf8
        .extern func_ov002_021e286c
        .extern func_ov002_02201a40
        .extern func_ov002_0226b1b4
        .global func_ov002_02217b50
        .arm
func_ov002_02217b50:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldrh r2, [r4, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r2, _LIT0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x64
    bgt .L_3c
    beq .L_1d4
    b .L_1f0
.L_3c:
    sub r2, r2, #0x7a
    cmp r2, #0x6
    addls pc, pc, r2, lsl #0x2
    b .L_1f0
    b .L_1b0
    b .L_184
    b .L_158
    b .L_e0
    b .L_c4
    b .L_9c
    b .L_68
.L_68:
    bl func_ov002_02201a40
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x2b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_9c:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_c4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e1bf8
    add sp, sp, #0xc
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_e0:
    mov r0, #0x0
    ldr r5, _LIT1
    ldr r3, _LIT2
    mov r1, r0
    add r2, sp, #0x0
.L_f4:
    ldrh lr, [r4, #0x2]
    mov ip, r0, lsl #0x1
    add r0, r0, #0x1
    mov lr, lr, lsl #0x1f
    mov lr, lr, lsr #0x1f
    and r6, lr, #0x1
    mla lr, r6, r3, r5
    add lr, lr, r1
    ldr lr, [lr, #0x260]
    cmp r0, #0x5
    mov r6, lr, lsl #0x13
    mov r6, r6, lsr #0x13
    strh r6, [r2, ip]
    add r1, r1, #0x4
    blt .L_f4
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r3, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b1b4
    add sp, sp, #0xc
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_158:
    ldr r0, _LIT3
    ldrh r0, [r0, #0xb0]
    bl func_0202b100
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae430
    add sp, sp, #0xc
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_184:
    ldr r0, _LIT3
    ldrh r0, [r0, #0xb2]
    bl func_ov002_021b9b64
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8288
    add sp, sp, #0xc
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1b0:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e13f4
    add sp, sp, #0xc
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1d4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    add sp, sp, #0xc
    mov r0, #0x63
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1f0:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0e6c
