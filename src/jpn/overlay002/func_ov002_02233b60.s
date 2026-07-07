; func_ov002_02233b60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021b9ac0
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021e0f5c
        .extern func_ov002_0223de04
        .extern func_ov002_0227acc8
        .global func_ov002_02233b60
        .arm
func_ov002_02233b60:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r1, #0x2
    mov r2, r0, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x11
    eor r4, r2, r0, lsr #0x1f
    rsb r0, r2, #0x1
    bl func_ov002_021e0f5c
    mov r0, r4
    bl func_ov002_021bc538
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_744
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223de04
    mov r1, r0
    mov r0, r4
    bl func_ov002_021b98d4
    cmp r0, #0x0
    blt .L_744
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r6, r1, r0, lsl #0x2
    mov r0, r6
    bl func_ov002_021b9ac0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r5]
    mov r0, r4
    mov r1, r6
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
.L_744:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
