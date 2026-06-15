; func_0200b614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .global func_0200b614
        .arm
func_0200b614:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    movs r7, r0
    beq .L_1d8
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr fp, [sl, #0x18]
    mov r1, #0x4
    mov r0, fp, lsl #0x2
    mov r2, #0x0
    str fp, [r7]
    bl Task_PostLocked
    str r0, [r7, #0x4]
    cmp r0, #0x0
    beq .L_1e0
    cmp fp, #0x0
    mov r8, #0x0
    ble .L_118
.L_60:
    mov r0, #0xc
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    ldr r1, [r7, #0x4]
    str r0, [r1, r8, lsl #0x2]
    ldr r0, [r7, #0x4]
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_1e0
    mov r0, #0x14
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    ldr r1, [r7, #0x4]
    ldr r1, [r1, r8, lsl #0x2]
    str r0, [r1, #0x8]
    ldr r0, [r7, #0x4]
    ldr r0, [r0, r8, lsl #0x2]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1e0
    mov r9, #0x0
    mov r6, #0x10
    mov r5, #0x4
    mov r4, r9
.L_c8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl Task_PostLocked
    ldr r1, [r7, #0x4]
    ldr r1, [r1, r8, lsl #0x2]
    ldr r1, [r1, #0x8]
    str r0, [r1, r9, lsl #0x2]
    ldr r0, [r7, #0x4]
    ldr r0, [r0, r8, lsl #0x2]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_1e0
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_c8
    add r8, r8, #0x1
    cmp r8, fp
    blt .L_60
.L_118:
    ldr r0, [sl, #0x1c]
    cmp fp, #0x0
    add r1, sl, r0
    mov r2, #0x0
    ble .L_1d8
.L_12c:
    ldr r0, [r7, #0x4]
    ldr r5, [r1, #0x8]
    ldr r3, [r0, r2, lsl #0x2]
    ldr r4, [r1]
    add r0, sl, r5
    str r4, [r3]
    ldr r3, [r7, #0x4]
    ldrh r5, [r1, #0x4]
    ldr r4, [r3, r2, lsl #0x2]
    mov r3, #0x0
    strh r5, [r4, #0x4]
    ldr r4, [r7, #0x4]
    ldrh r5, [r1, #0x6]
    ldr r4, [r4, r2, lsl #0x2]
    strh r5, [r4, #0x6]
.L_168:
    ldr r4, [r7, #0x4]
    ldr r5, [r0, r3, lsl #0x4]
    ldr r4, [r4, r2, lsl #0x2]
    add r6, r0, r3, lsl #0x4
    ldr r4, [r4, #0x8]
    ldr r4, [r4, r3, lsl #0x2]
    str r5, [r4]
    ldr r4, [r7, #0x4]
    ldr r5, [r6, #0x8]
    ldr r4, [r4, r2, lsl #0x2]
    add r5, sl, r5
    ldr r4, [r4, #0x8]
    ldr r4, [r4, r3, lsl #0x2]
    str r5, [r4, #0x8]
    ldr r4, [r7, #0x4]
    ldr r5, [r6, #0xc]
    ldr r4, [r4, r2, lsl #0x2]
    add r5, sl, r5
    ldr r4, [r4, #0x8]
    ldr r4, [r4, r3, lsl #0x2]
    add r3, r3, #0x1
    str r5, [r4, #0xc]
    cmp r3, #0x5
    blt .L_168
    add r2, r2, #0x1
    cmp r2, fp
    add r1, r1, #0xc
    blt .L_12c
.L_1d8:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
