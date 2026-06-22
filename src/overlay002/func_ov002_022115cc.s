; func_ov002_022115cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d6714
        .extern func_ov002_021de4d8
        .extern func_ov002_021df708
        .extern func_ov002_021e2b1c
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_022115cc
        .arm
func_ov002_022115cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    add r2, sp, #0x0
    mov r1, #0x0
    mov r9, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_288
    ldr r2, [sp]
    ldr r0, _LIT0
    and r4, r2, #0xff
    and r1, r4, #0x1
    mul r8, r1, r0
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    ldr r1, _LIT1
    and r5, r0, #0xff
    mov r0, #0x14
    smulbb r7, r5, r0
    add r0, r1, r8
    add r0, r0, r7
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r6, r0, lsr #0x13
    beq .L_288
    ldr r0, _LIT2
    add r0, r0, r8
    ldrh r0, [r7, r0]
    cmp r0, #0x0
    beq .L_208
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_200
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de4d8
.L_200:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_208:
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d6714
    mov r0, r4
    mov r1, r6
    bl func_ov002_021df708
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    ldr r1, _LIT2
    mov r0, #0x1
    add r6, r1, r8
    strh r0, [r6, r7]
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    mov r0, #0x0
    strh r0, [r6, r7]
    beq .L_278
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de4d8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_278:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d6714
.L_288:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
