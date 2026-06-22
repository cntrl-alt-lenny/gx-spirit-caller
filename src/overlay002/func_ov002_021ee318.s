; func_ov002_021ee318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c4c9c
        .global func_ov002_021ee318
        .arm
func_ov002_021ee318:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x2c
    mov r4, r2
    cmp r4, #0x5
    mov r6, r0
    mov r5, r1
    addge sp, sp, #0x2c
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r1, [r0]
    cmp r1, r5
    ldreq r0, [r0, #0x1c]
    cmpeq r0, r4
    beq .L_a4
    ldr r0, _LIT2
    ldr r1, [r0, #0x4]
    cmp r1, r5
    ldreq r0, [r0, #0x20]
    cmpeq r0, r4
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
.L_a4:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    add r2, sp, #0x0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c4c9c
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x14]
    ldr r2, _LIT3
    cmp r1, r0
    movle r1, r0
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    adds r3, r0, r3, asr #0x5
    moveq r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cd3f4
_LIT3: .word 0x51eb851f
