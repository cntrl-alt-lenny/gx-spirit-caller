; func_ov002_0221acdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1fa4
        .extern func_ov002_021d8fd0
        .extern func_ov002_021de55c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_0221acdc
        .arm
func_ov002_0221acdc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrh r1, [r4, #0xc]
    cmp r1, #0x1
    beq .L_20
    cmp r1, #0x2
    beq .L_a4
    b .L_130
.L_20:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_9c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_9c
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, #0x1
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    beq .L_9c
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, #0x2
    bl func_ov002_021de55c
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_a4:
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr r5, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov lr, r2, lsl #0x1a
    mul r2, r3, r1
    add r5, r5, r2
    mov r1, lr, lsr #0x1b
    mov r3, #0x14
    mul r3, r1, r3
    add r5, r5, #0x30
    ldrh ip, [r4, #0x4]
    ldr lr, [r5, r3]
    mov r5, ip, lsl #0x11
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    mov lr, lr, lsl #0x12
    mov ip, ip, lsl #0x1
    mov r5, r5, lsr #0x17
    add ip, ip, lr, lsr #0x1f
    cmp r5, ip
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr ip, _LIT2
    add r2, ip, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r4, #0x8]
    bl func_ov002_021d8fd0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_130:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
