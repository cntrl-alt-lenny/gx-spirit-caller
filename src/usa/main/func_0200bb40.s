; func_0200bb40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .global func_0200bb40
        .arm
func_0200bb40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    movs r7, r0
    beq .L_684
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
    beq .L_68c
    cmp r8, #0x0
    mov r9, #0x0
    ble .L_5f8
    mov fp, r9
    mov r6, #0x10
    mov r5, #0x4
    mov r4, r9
.L_5b8:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl Task_PostLocked
    ldr r1, [r7, #0x4]
    str r0, [r1, r9, lsl #0x2]
    ldr r0, [r7, #0x4]
    ldr r1, [r0, r9, lsl #0x2]
    cmp r1, #0x0
    beq .L_68c
    mov r0, fp
    mov r2, #0x10
    bl Fill32
    add r9, r9, #0x1
    cmp r9, r8
    blt .L_5b8
.L_5f8:
    ldr r0, [sl, #0x1c]
    cmp r8, #0x0
    add r0, sl, r0
    mov r2, #0x0
    ble .L_684
    mov r1, r0
.L_610:
    ldr r3, [r7, #0x4]
    ldr r4, [r0, r2, lsl #0x4]
    ldr r3, [r3, r2, lsl #0x2]
    str r4, [r3]
    ldr r3, [r0, r2, lsl #0x4]
    cmp r3, #0x0
    beq .L_674
    ldr r3, [r7, #0x4]
    ldrh r4, [r1, #0x4]
    ldr r3, [r3, r2, lsl #0x2]
    strh r4, [r3, #0x4]
    ldr r3, [r7, #0x4]
    ldrh r4, [r1, #0x6]
    ldr r3, [r3, r2, lsl #0x2]
    strh r4, [r3, #0x6]
    ldr r3, [r7, #0x4]
    ldr r4, [r1, #0x8]
    ldr r3, [r3, r2, lsl #0x2]
    add r4, r4, sl
    str r4, [r3, #0x8]
    ldr r3, [r7, #0x4]
    ldr r4, [r1, #0xc]
    ldr r3, [r3, r2, lsl #0x2]
    add r4, r4, sl
    str r4, [r3, #0xc]
.L_674:
    add r2, r2, #0x1
    cmp r2, r8
    add r1, r1, #0x10
    blt .L_610
.L_684:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_68c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
