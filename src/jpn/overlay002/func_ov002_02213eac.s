; func_ov002_02213eac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021d58dc
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02213eac
        .arm
func_ov002_02213eac:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldr r1, _LIT0
    ldrh r3, [r5, #0x4]
    mov r2, r4, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mov ip, r4, lsl #0x1a
    mul r1, r2, r1
    ldr r4, _LIT1
    mov ip, ip, lsr #0x1b
    mov r2, #0x14
    mul r2, ip, r2
    add r4, r4, r1
    add r4, r4, #0x30
    mov ip, r3, lsl #0x11
    ldr r4, [r4, r2]
    mov ip, ip, lsr #0x17
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp ip, r3
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_588
    ldr r2, [sp, #0x4]
    mov r0, r5
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r6, r2, #0xff
    and r4, r1, #0xff
    mov r1, r6
    mov r2, r4
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_588
    mov r0, #0x0
    str r0, [sp]
    ldrh r1, [r5, #0x2]
    ldr r3, _LIT3
    mov r0, r6
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    mov r1, r4
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
.L_588:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x00000106
