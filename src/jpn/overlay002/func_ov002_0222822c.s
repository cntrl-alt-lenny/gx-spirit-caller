; func_ov002_0222822c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_02206690
        .extern func_ov002_0227ab74
        .global func_ov002_0222822c
        .arm
func_ov002_0222822c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    ldrh r4, [r5, #0x4]
    ldr lr, _LIT0
    mov r3, r2, lsl #0x1f
    mov ip, r3, lsr #0x1f
    mov r3, r2, lsl #0x1a
    ldr r2, _LIT1
    and ip, ip, #0x1
    mla lr, ip, r2, lr
    mov r3, r3, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    add r3, lr, #0x30
    ldr r3, [r3, r2]
    mov r4, r4, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r4, r4, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp r4, r2
    mov r4, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_ov002_02206690
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_9c
    ldr r0, _LIT3
    cmp r1, r0
    moveq r4, #0x2
    b .L_a0
.L_9c:
    mov r4, #0x2
.L_a0:
    ldrh r0, [r5, #0x2]
    mov r2, #0x1
    ldr ip, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r3, r0, #0x1
    mla r1, r3, r1, ip
    str r2, [sp]
    ldrh r3, [r5, #0x2]
    add r5, r1, #0x30
    mov r1, #0x14
    mov r3, r3, lsl #0x1a
    mov r3, r3, lsr #0x1b
    mla r1, r3, r1, r5
    mov r3, r4
    bl func_ov002_0227ab74
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001472
_LIT3: .word 0x00001aca
