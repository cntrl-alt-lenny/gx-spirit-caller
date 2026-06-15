; func_0200ba00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .global func_0200ba00
        .arm
func_0200ba00:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    movs r7, r0
    beq .L_538
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r8, [sl, #0x18]
    mov r1, #0x4
    mov r0, r8, lsl #0x2
    mov r2, #0x0
    str r8, [r7]
    bl Task_PostLocked
    str r0, [r7, #0x4]
    cmp r0, #0x0
    beq .L_540
    cmp r8, #0x0
    mov r9, #0x0
    ble .L_49c
    mov fp, r9
    mov r6, #0x14
    mov r5, #0x4
    mov r4, r9
.L_45c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl Task_PostLocked
    ldr r1, [r7, #0x4]
    str r0, [r1, r9, lsl #0x2]
    ldr r0, [r7, #0x4]
    ldr r1, [r0, r9, lsl #0x2]
    cmp r1, #0x0
    beq .L_540
    mov r0, fp
    mov r2, #0x14
    bl Fill32
    add r9, r9, #0x1
    cmp r9, r8
    blt .L_45c
.L_49c:
    ldr r0, [sl, #0x1c]
    cmp r8, #0x0
    add r0, sl, r0
    mov r1, #0x0
    ble .L_538
.L_4b0:
    ldr r2, [r7, #0x4]
    ldr r3, [r0]
    ldr r2, [r2, r1, lsl #0x2]
    str r3, [r2]
    ldr r2, [r0]
    cmp r2, #0x0
    beq .L_528
    ldr r2, [r7, #0x4]
    ldrh r3, [r0, #0x4]
    ldr r2, [r2, r1, lsl #0x2]
    strh r3, [r2, #0x4]
    ldr r2, [r7, #0x4]
    ldrh r3, [r0, #0x6]
    ldr r2, [r2, r1, lsl #0x2]
    strh r3, [r2, #0x6]
    ldr r2, [r7, #0x4]
    ldr r3, [r0, #0x8]
    ldr r2, [r2, r1, lsl #0x2]
    add r3, r3, sl
    str r3, [r2, #0x8]
    ldr r2, [r7, #0x4]
    ldr r3, [r0, #0xc]
    ldr r2, [r2, r1, lsl #0x2]
    add r3, r3, sl
    str r3, [r2, #0xc]
    ldr r2, [r7, #0x4]
    ldr r3, [r0, #0x10]
    ldr r2, [r2, r1, lsl #0x2]
    add r3, r3, sl
    str r3, [r2, #0x10]
.L_528:
    add r1, r1, #0x1
    cmp r1, r8
    add r0, r0, #0x18
    blt .L_4b0
.L_538:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_540:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
