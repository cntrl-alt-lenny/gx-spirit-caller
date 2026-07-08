; func_ov002_022436cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021d8fd0
        .extern func_ov002_0223d9e0
        .extern func_ov002_0226afc0
        .extern func_ov002_0226b000
        .global func_ov002_022436cc
        .arm
func_ov002_022436cc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x0
    beq .L_24
    cmp r0, #0x1
    beq .L_ac
    b .L_110
.L_24:
    ldrh r1, [r4, #0x2]
    ldrh r3, [r4, #0x4]
    ldr lr, _LIT1
    mov r0, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and ip, r0, #0x1
    mla lr, ip, r1, lr
    mov r2, r2, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    add r2, lr, #0x30
    ldr r2, [r2, r1]
    mov r3, r3, lsl #0x11
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsr #0x17
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4]
    mov r2, #0x1
    mov r3, #0xff
    bl func_ov002_0226b000
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_ac:
    ldr r0, _LIT3
    ldrh r1, [r4, #0x2]
    ldrh r5, [r0, #0xb2]
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r5
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8fd0
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223d9e0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afc0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_110:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word 0x0000171f
