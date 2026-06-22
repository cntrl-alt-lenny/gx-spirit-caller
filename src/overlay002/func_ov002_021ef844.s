; func_ov002_021ef844 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b33b0
        .extern func_ov002_021c23ac
        .extern func_ov002_021e7748
        .extern func_ov002_02257888
        .global func_ov002_021ef844
        .arm
func_ov002_021ef844:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0xa]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x0
    beq .L_24
    bl func_ov002_021e7748
    ldmia sp!, {r4, r5, r6, pc}
.L_24:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    mov r2, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r5, #0x1
    mla r3, ip, r1, r3
    mov r1, #0x14
    mla r1, r4, r1, r3
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r3, r0, lsl #0x1a
    mov r0, r5
    mov r1, r4
    mov r3, r3, lsr #0x1b
    bl func_ov002_021b33b0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c23ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    ldr r1, _LIT2
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_02257888
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word func_ov002_021e7748
