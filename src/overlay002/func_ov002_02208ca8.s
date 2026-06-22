; func_ov002_02208ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202b950
        .extern func_0202e234
        .extern func_ov002_021ca5bc
        .extern func_ov002_022575c8
        .global func_ov002_02208ca8
        .arm
func_ov002_02208ca8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT0
    mvn r7, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    ldr r0, _LIT1
    mov r6, #0x0
    mul r3, r2, r0
    ldr r0, [r1, r3]
    cmp r0, #0x0
    bls .L_f4
    ldr r5, _LIT2
    mov r9, r6
    add fp, r7, #0x10000
.L_44:
    add r0, r5, r3
    add r0, r0, r9
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202b950
    mov r4, r0
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c4
    cmp r7, r4
    bge .L_c4
    cmp r4, fp
    beq .L_c4
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    ldr r0, _LIT1
    mla r0, r1, r0, r5
    add r0, r0, #0x120
    ldr r1, [r0, r9]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    movne r7, r4
.L_c4:
    ldrh r0, [sl, #0x2]
    add r6, r6, #0x1
    add r9, r9, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    ldr r0, _LIT1
    mul r3, r1, r0
    add r0, r5, r3
    ldr r0, [r0, #0xc]
    cmp r6, r0
    bcc .L_44
.L_f4:
    cmp r7, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    strh r7, [sl, #0xc]
    mov r4, #0x0
.L_108:
    ldrh r1, [sl, #0x2]
    mov r0, sl
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022575c8
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_108
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf178
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
