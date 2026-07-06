; func_ov002_0220e4a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c1fa4
        .extern func_ov002_021de318
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_0220e4a4
        .arm
func_ov002_0220e4a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x6]
    mov r6, #0x0
    mov r7, r6
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_ac
    mov r4, #0x1
    mov fp, r4
    add r5, sp, #0x0
.L_30:
    mov r0, sl
    mov r1, r7
    mov r2, r5
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_98
    ldr r2, [sp]
    mov r0, sl
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r8, r2, #0xff
    and r9, r1, #0xff
    mov r1, r8
    mov r2, r9
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_98
    mov r0, sl
    mov r1, r8
    mov r2, r9
    mov r3, fp
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    addne r0, r9, r8, lsl #0x4
    orrne r6, r6, r4, lsl r0
.L_98:
    ldrh r0, [sl, #0x6]
    add r7, r7, #0x1
    mov r0, r0, lsl #0x18
    cmp r7, r0, lsr #0x18
    blt .L_30
.L_ac:
    mov r0, sl
    mov r1, r6
    bl func_ov002_021de318
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
