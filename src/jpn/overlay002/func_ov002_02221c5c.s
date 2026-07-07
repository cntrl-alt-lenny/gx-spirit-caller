; func_ov002_02221c5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b3dec
        .extern func_ov002_021e267c
        .extern func_ov002_02211208
        .global func_ov002_02221c5c
        .arm
func_ov002_02221c5c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh ip, [r5, #0x2]
    ldr r2, _LIT0
    ldrh r4, [r5, #0x4]
    mov r0, ip, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov lr, ip, lsl #0x1a
    mul r2, r3, r2
    ldr ip, _LIT1
    mov lr, lr, lsr #0x1b
    mov r3, #0x14
    mul r3, lr, r3
    add ip, ip, r2
    add ip, ip, #0x30
    mov lr, r4, lsl #0x11
    ldr ip, [ip, r3]
    mov lr, lr, lsr #0x17
    mov r4, ip, lsl #0x2
    mov r4, r4, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r4, r4, lsl #0x1
    add ip, r4, ip, lsr #0x1f
    cmp lr, ip
    mov r4, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    add r1, r1, r2
    ldrh r1, [r3, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x80
    bne .L_2f4
    ldr r2, _LIT4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT4
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e267c
.L_2f4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_02211208
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022ce1a8
_LIT4: .word 0x000014c4
