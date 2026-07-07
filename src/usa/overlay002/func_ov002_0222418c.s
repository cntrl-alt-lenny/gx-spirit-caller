; func_ov002_0222418c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021b4040
        .extern func_ov002_021d58dc
        .extern func_ov002_021e0f5c
        .extern func_ov002_0226ae48
        .global func_ov002_0222418c
        .arm
func_ov002_0222418c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r1, r0, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4, #0x2]
    mov lr, r0, lsl #0x11
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov r5, r2, lsl #0x1a
    mul r2, r3, r1
    ldr ip, _LIT1
    mov r1, r5, lsr #0x1b
    mov r3, #0x14
    add ip, ip, r2
    mul r3, r1, r3
    add ip, ip, #0x30
    ldr ip, [ip, r3]
    mov lr, lr, lsr #0x17
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    cmp lr, r3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT2
    ldr r3, [r3, #0xcec]
    cmp r3, r0
    beq .L_dc
    ldr r1, _LIT3
    ldr r1, [r1, r2]
    rsbs r5, r1, #0x4
    beq .L_104
    mov r1, r5
    bl func_ov002_021e0f5c
    cmp r0, #0x0
    beq .L_104
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, #0x11
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
    b .L_104
.L_dc:
    ldrh r2, [r4]
    bl func_ov002_021b4040
    mov r2, r0
    cmp r2, #0x0
    ble .L_104
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226ae48
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cf098
