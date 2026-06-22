; func_ov002_0221429c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c8470
        .extern func_ov002_021de408
        .extern func_ov002_021df818
        .extern func_ov002_021e2d94
        .global func_ov002_0221429c
        .arm
func_ov002_0221429c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r8, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_840
    mov r6, #0x0
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r5, r6
    mov r7, r6
.L_7b8:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    add r1, r1, r7
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_7ec
    mov r1, r5
    bl func_ov002_021c8470
    add r6, r6, r0
.L_7ec:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    blt .L_7b8
    ldrh r1, [r8, #0x2]
    mov r2, #0x1f
    mov r0, r8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021de408
    ldrh r1, [r8, #0x2]
    add r2, r6, #0x1
    mov r0, r8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r2, r2, asr #0x1
    bl func_ov002_021df818
    b .L_85c
.L_840:
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_85c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
