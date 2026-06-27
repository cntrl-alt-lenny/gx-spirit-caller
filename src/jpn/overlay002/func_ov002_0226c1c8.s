; func_ov002_0226c1c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern data_ov002_022d0e3c
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c8860
        .global func_ov002_0226c1c8
        .arm
func_ov002_0226c1c8:
    stmdb sp!, {r4, r5, r6, lr}
    add r4, r1, r2
    mov r5, r0
    cmp r4, #0x4
    bgt .L_79c
    ldr r0, _LIT0
    mov r1, r5
    ldr r0, [r0, #0xd94]
    mov r2, r4
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    beq .L_79c
    ldr r1, _LIT1
    and r2, r5, #0xff
    and r0, r4, #0xff
    orr r0, r2, r0, lsl #0x8
    ldrh r2, [r1, #0xa0]
    mov r0, r0, lsl #0x10
    cmp r2, r0, lsr #0x10
    beq .L_79c
    ldrh r0, [r1, #0xa2]
    mov r0, r0, asr #0x8
    ands r6, r0, #0xff
    beq .L_778
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8860
    cmp r6, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_778:
    add r1, r5, #0x1
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1
    ldrh r0, [r0, r1]
    mov r1, #0x1
    tst r0, r1, lsl r4
    movne r0, #0x0
    moveq r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_79c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word data_ov002_022d0e3c
