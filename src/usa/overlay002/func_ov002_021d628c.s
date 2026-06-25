; func_ov002_021d628c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_ov002_021de390
        .global func_ov002_021d628c
        .arm
func_ov002_021d628c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, _LIT0
    mov r4, #0x14
    ldr r5, _LIT1
    and r6, r0, #0x1
    mla r0, r6, r3, r5
    mul r4, r1, r4
    ldrh r5, [r4, r0]
    mov r6, r2
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r4, _LIT2
    mov r7, #0x0
.L_3a4:
    add r1, r4, r5, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r5, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    cmp r6, r0, lsr #0x1c
    bne .L_3d8
    ldrh r0, [r1]
    mov r2, r7
    mov r3, r7
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021de390
.L_3d8:
    cmp r5, #0x0
    bne .L_3a4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022d0570
