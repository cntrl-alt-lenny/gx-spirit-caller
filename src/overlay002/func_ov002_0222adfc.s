; func_ov002_0222adfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d0e6c
        .extern func_0202df78
        .extern func_ov002_021ae400
        .extern func_ov002_021c3ae4
        .extern func_ov002_021d7b44
        .extern func_ov002_021e27c0
        .extern func_ov002_021e2b1c
        .extern func_ov002_02257594
        .extern func_ov002_0226af78
        .extern func_ov002_0226afd0
        .global func_ov002_0222adfc
        .arm
func_ov002_0222adfc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    ldrh r9, [r4, #0x8]
    cmp r2, #0x64
    bgt .L_24
    beq .L_1f8
    b .L_218
.L_24:
    sub r2, r2, #0x77
    cmp r2, #0x9
    addls pc, pc, r2, lsl #0x2
    b .L_218
    b .L_1dc
    b .L_1c0
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_180
    b .L_15c
    b .L_5c
.L_5c:
    bl func_ov002_02257594
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    mov r0, r9, lsl #0x10
    ldrh r2, [r4, #0x2]
    mov r1, r0, lsr #0x10
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r0, #0x1
    bne .L_154
    ldrh r0, [r4, #0x2]
    ldr r5, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mul r0, r2, r5
    ldr r1, [r1, r0]
    mov r8, #0x0
    cmp r1, #0x0
    bls .L_14c
    ldr r7, _LIT3
    ldr r6, _LIT4
    mov sl, r8
.L_f8:
    add r0, r7, r0
    add r0, r0, sl
    ldr r0, [r0, #0x120]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    strneh r8, [r6, #0xb0]
    ldrh r0, [r4, #0x2]
    add r8, r8, #0x1
    add sl, sl, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mul r0, r1, r5
    add r1, r7, r0
    ldr r1, [r1, #0xc]
    cmp r8, r1
    bcc .L_f8
.L_14c:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_154:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_15c:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, r9
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afd0
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_180:
    ldrh r0, [r4, #0x2]
    ldr r4, _LIT3
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mla r4, r3, r1, r4
    ldr r2, _LIT4
    add r3, r4, #0x120
    ldrh r1, [r2, #0xb0]
    mov r2, #0x1
    add r1, r3, r1, lsl #0x2
    bl func_ov002_021d7b44
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1c0:
    ldrh r0, [r4, #0x2]
    mov r1, #0x11
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x77
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1dc:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af78
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1f8:
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_218:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022d0e6c
