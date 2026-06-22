; func_ov002_022224e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021e1870
        .extern func_ov002_021e286c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0226b194
        .global func_ov002_022224e0
        .arm
func_ov002_022224e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x5a8]
    ldrh r4, [r6, #0xc]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_248
    b .L_22c
    b .L_208
    b .L_1b0
    b .L_15c
.L_15c:
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0225368c
    cmp r0, r4
    movlt r1, #0x1
    ldr r0, _LIT0
    movge r1, #0x0
    str r1, [r0, #0x5ac]
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b194
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b0:
    ldr r7, _LIT1
    mov r5, #0x0
    ldrh r0, [r7, #0xb0]
    cmp r0, #0x0
    ble .L_200
    ldr r4, _LIT2
    mov r8, #0x1
.L_1cc:
    ldrh r1, [r6, #0x2]
    add r0, r4, r5, lsl #0x1
    add r0, r0, #0x1d00
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldrh r1, [r0, #0xb2]
    mov r2, r8
    rsb r0, r3, #0x1
    bl func_ov002_021e1870
    ldrh r0, [r7, #0xb0]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_1cc
.L_200:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_208:
    ldr r0, [r1, #0x5ac]
    cmp r0, #0x0
    beq .L_224
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b054
.L_224:
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_22c:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_248:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word data_ov002_022cf16c
