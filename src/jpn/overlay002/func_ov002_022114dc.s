; func_ov002_022114dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021d6624
        .extern func_ov002_021de3e8
        .extern func_ov002_021df618
        .extern func_ov002_021e2a2c
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_022114dc
        .arm
func_ov002_022114dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    add r2, sp, #0x0
    mov r1, #0x0
    mov r9, r0
    bl func_ov002_0223de48
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
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_200
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de3e8
.L_200:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_208:
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d6624
    mov r0, r4
    mov r1, r6
    bl func_ov002_021df618
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    ldr r1, _LIT2
    mov r0, #0x1
    add r6, r1, r8
    strh r0, [r6, r7]
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    mov r0, #0x0
    strh r0, [r6, r7]
    beq .L_278
    mov r0, r9
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de3e8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_278:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d6624
.L_288:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
