; func_ov002_0228cf94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b00d0
        .extern func_ov002_022815a4
        .extern func_ov002_0228c584
        .extern func_ov002_0228cb48
        .global func_ov002_0228cf94
        .arm
func_ov002_0228cf94:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r4, #0x0
    mov r8, r0, lsl #0x4
    str r0, [sp]
    mov sl, r1
    mov r6, r4
    mov r2, r4
    mov r3, r8
    add r0, sp, #0x4
    mov r1, #0x1
.L_418:
    tst sl, r1, lsl r3
    strne r2, [r0, r6, lsl #0x2]
    add r2, r2, #0x1
    addne r6, r6, #0x1
    cmp r2, #0xa
    add r3, r3, #0x1
    ble .L_418
    sub r7, r6, #0x1
    cmp r7, #0x0
    ble .L_468
    add r5, sp, #0x4
.L_444:
    add r0, r7, #0x1
    bl func_ov002_021b00d0
    ldr r2, [r5, r7, lsl #0x2]
    ldr r1, [r5, r0, lsl #0x2]
    str r1, [r5, r7, lsl #0x2]
    sub r7, r7, #0x1
    str r2, [r5, r0, lsl #0x2]
    cmp r7, #0x0
    bgt .L_444
.L_468:
    cmp r6, #0x0
    mov r9, #0x0
    ble .L_4c8
    ldr r0, [sp]
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r7, r0, r1, r2
    add fp, sp, #0x4
.L_48c:
    ldr r5, [fp, r9, lsl #0x2]
    mov r0, #0x14
    mla r0, r5, r0, r7
    ldr r0, [r0, #0x30]
    mov r1, #0x0
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_022815a4
    cmp r0, #0x0
    addne r1, r5, r8
    movne r0, #0x1
    add r9, r9, #0x1
    orrne r4, r4, r0, lsl r1
    cmp r9, r6
    blt .L_48c
.L_4c8:
    mvn r2, #0x0
    ldr r0, [sp]
    mov r3, r2
    eor r1, sl, r4
    bl func_ov002_0228c584
    cmp r0, #0x0
    addge sp, sp, #0x30
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    mov r1, sl
    bl func_ov002_0228cb48
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
