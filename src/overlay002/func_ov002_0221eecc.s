; func_ov002_0221eecc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d479c
        .extern func_ov002_0226af94
        .global func_ov002_0221eecc
        .arm
func_ov002_0221eecc:
    stmdb sp!, {r4, lr}
    mov r1, r0
    ldrh r0, [r1, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1fc
    b .L_194
    b .L_ec
    b .L_80
    b .L_44
.L_44:
    ldr r0, _LIT1
    ldr r2, [r0, #0xc]
    cmp r2, #0x0
    ldrne r0, [r0, #0x874]
    cmpne r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r1, #0x2]
    ldrh r1, [r1]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af94
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_80:
    ldrh r0, [r1, #0x2]
    ldr r4, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    ldr r0, _LIT3
    and r3, r3, #0x1
    mla r4, r3, r0, r4
    ldrh r0, [r2, #0xb0]
    add r3, r4, #0x120
    mov r2, #0x1
    ldr r3, [r3, r0, lsl #0x2]
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    strh r0, [r1, #0x8]
    ldrh r0, [r1, #0x2]
    ldrh r1, [r1]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af94
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_ec:
    ldrh r2, [r1, #0x2]
    ldr r0, _LIT2
    ldr r4, _LIT1
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT3
    and r3, r3, #0x1
    mla r4, r3, r2, r4
    ldrh r0, [r0, #0xb0]
    add r3, r4, #0x120
    ldr ip, _LIT4
    ldr r4, [r3, r0, lsl #0x2]
    mov r0, #0x3f
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    strh r3, [r1, #0xa]
    ldrh r4, [r1, #0x2]
    ldrh lr, [r1, #0x8]
    mov r3, #0x0
    mov r1, r4, lsl #0x1f
    mov r4, r1, lsr #0x1f
    and r1, r4, #0x1
    mul r2, r1, r2
    rsb r4, r4, #0x1
    ldr ip, [ip, r2]
    and r2, r4, #0x1
    orr r4, r2, #0x16
    mov r2, lr, lsl #0x16
    orr lr, r1, #0x16
    mov r1, ip, lsl #0x16
    orr r2, r4, r2, lsr #0x10
    orr r1, lr, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov ip, r1, lsl #0x10
    mov r1, r2, lsr #0x10
    mov r2, ip, lsr #0x10
    bl func_ov002_021d479c
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_194:
    ldrh r3, [r1, #0x2]
    ldrh r2, [r1, #0xa]
    ldr r0, _LIT3
    mov r1, r3, lsl #0x1f
    mov r3, r1, lsr #0x1f
    rsb r1, r3, #0x1
    and ip, r1, #0x1
    mul r1, ip, r0
    ldr r0, _LIT4
    and r3, r3, #0x1
    ldr r1, [r0, r1]
    mov r0, r2, lsl #0x16
    orr r3, r3, #0x16
    orr r0, r3, r0, lsr #0x10
    orr r2, ip, #0x16
    mov r1, r1, lsl #0x16
    orr r1, r2, r1, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    bl func_ov002_021d479c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1fc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022d0e6c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf178
