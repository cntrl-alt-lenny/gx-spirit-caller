; func_ov002_02212ecc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de8d0
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02212ecc
        .arm
func_ov002_02212ecc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldrh r0, [r8, #0x6]
    mov r7, #0x0
    mov r6, r7
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_1b0
    mov r4, #0x1
    add r5, sp, #0x0
.L_150:
    mov r0, r8
    mov r1, r6
    mov r2, r5
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_19c
    ldr r2, [sp]
    mov r0, r8
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r9, r2, #0xff
    and sl, r1, #0xff
    mov r1, r9
    mov r2, sl
    bl func_ov002_02257564
    cmp r0, #0x0
    addne r0, sl, r9, lsl #0x4
    orrne r7, r7, r4, lsl r0
.L_19c:
    ldrh r0, [r8, #0x6]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x18
    cmp r6, r0, lsr #0x18
    blt .L_150
.L_1b0:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021de8d0
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
