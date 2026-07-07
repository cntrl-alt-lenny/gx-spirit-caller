; func_ov002_02211208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf09c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021d8198
        .extern func_ov002_021e277c
        .extern func_ov002_0223f5dc
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_02211208
        .arm
func_ov002_02211208:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT0
    mov r3, r2, lsl #0x1f
    ldr r1, [r1, #0x5a8]
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsl #0x11
    cmp r1, #0x64
    eor r4, r3, r2, lsr #0x1f
    bgt .L_648
    cmp r1, #0x64
    beq .L_724
    b .L_734
.L_648:
    sub r1, r1, #0x78
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_734
    b .L_714
    b .L_734
    b .L_734
    b .L_734
    b .L_734
    b .L_6fc
    b .L_6dc
    b .L_734
    b .L_67c
.L_67c:
    ldr r1, _LIT1
    and r2, r3, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_0223f5dc
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_022535a4
    cmp r0, #0x0
    mov r0, r4
    bne .L_6cc
    mov r1, #0x15
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_6cc:
    mov r1, #0x33
    bl func_ov002_021ae320
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_6dc:
    bl func_ov002_0223f5dc
    mov r3, r0
    ldrh r2, [r5]
    mov r0, r4
    mov r1, #0x6
    bl func_ov002_021af8f0
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_6fc:
    bl func_ov002_021afa94
    mov r1, r0
    mov r0, r4
    bl func_ov002_021d8198
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_714:
    rsb r0, r4, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_724:
    mov r0, r4
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_734:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
