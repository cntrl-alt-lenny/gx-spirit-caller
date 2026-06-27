; func_ov002_0222045c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de8d0
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_0222045c
        .arm
func_ov002_0222045c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r0
    ldrh r0, [r9, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r9, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x2
    bne .L_20c
    mov r6, #0x0
    mov r7, r6
    cmp r0, #0x0
    ble .L_200
    mov r4, #0x1
    mov r5, r6
.L_1b0:
    mov r0, r9
    mov r1, r7
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    and r8, r0, #0xff
    mov r0, r9
    mov r1, r7
    mov r2, r5
    and sl, r3, #0xff
    bl func_ov002_0223de48
    cmp r0, #0x0
    addne r0, sl, r8, lsl #0x4
    orrne r6, r6, r4, lsl r0
    ldrh r0, [r9, #0x6]
    add r7, r7, #0x1
    mov r0, r0, lsl #0x10
    cmp r7, r0, lsr #0x18
    blt .L_1b0
.L_200:
    mov r0, r9
    mov r1, r6
    bl func_ov002_021de8d0
.L_20c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
