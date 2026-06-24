; func_ov002_021b2be8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a6
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d0650
        .extern func_ov002_021b1d84
        .extern func_ov002_021b20cc
        .global func_ov002_021b2be8
        .arm
func_ov002_021b2be8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldr r0, _LIT0
    and r2, r7, #0x1
    mul r0, r2, r0
    mov r6, r1
    mov r1, #0x14
    mul r9, r6, r1
    ldr r2, _LIT1
    str r0, [sp]
    add r0, r2, r0
    add r0, r0, #0x30
    ldr r1, [r0, r9]
    add r0, r0, r9
    str r0, [sp, #0x4]
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    ldr r0, [sp]
    add r0, r1, r0
    ldrh r0, [r9, r0]
    cmp r0, #0x0
    beq .L_c4
    ldr r4, _LIT3
.L_6c:
    add r2, r4, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh r5, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_b8
    b .L_b8
    b .L_b8
    b .L_b4
    b .L_b4
    b .L_b8
    b .L_b8
    b .L_b8
    b .L_b4
    b .L_b8
    b .L_b4
.L_b4:
    bl func_ov002_021b1d84
.L_b8:
    mov r0, r5
    cmp r5, #0x0
    bne .L_6c
.L_c4:
    and r0, r6, #0xff
    and r1, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    ldr r6, _LIT1
    ldr fp, _LIT0
    mov sl, #0x0
    mov r5, r0, lsr #0x10
    mov r4, #0x1
.L_e8:
    and r0, sl, #0x1
    mla r8, r0, fp, r6
    mov r7, #0x0
.L_f4:
    ldrh r0, [r8, #0x3a]
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b20cc
    add r7, r7, #0x1
    cmp r7, #0xb
    add r8, r8, #0x14
    ble .L_f4
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_e8
    ldr r0, [sp, #0x4]
    mov r2, #0x0
    str r2, [r0, #0xc]
    ldr r1, _LIT4
    ldr r0, [sp]
    add r1, r1, r0
    ldr r0, [r1, r9]
    bic r0, r0, #0x20
    bic r0, r0, #0x8
    str r0, [r1, r9]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a6
_LIT3: .word data_ov002_022d0650
_LIT4: .word data_ov002_022cf1ac
