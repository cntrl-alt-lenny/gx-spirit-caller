; func_ov002_0220d884 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b3538
        .global func_ov002_0220d884
        .arm
func_ov002_0220d884:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr ip, [r0, #0xcec]
    mov r2, #0x38
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    rsb r3, ip, #0x1
    mla r4, ip, r2, r5
    mla r5, r3, r2, r5
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3538
    ldr r1, _LIT2
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0x4]
    ldr lr, [r4]
    and r2, r1, #0xff
    and r3, lr, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    cmp r0, r2, lsr #0x10
    beq .L_b0
    ldr ip, _LIT3
    ldr r2, _LIT4
    and r3, lr, #0x1
    mla ip, r3, r2, ip
    mov r2, #0x14
    mul r2, r1, r2
    add r1, ip, #0x30
    ldr r2, [r1, r2]
    ldr r3, [r4, #0xc]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_b0:
    ldmia r5, {r3, r4}
    and r1, r4, #0xff
    and r2, r3, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x10
    beq .L_110
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, r3, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    add r1, r2, #0x30
    mul r0, r4, r0
    ldr r1, [r1, r0]
    ldr r2, [r5, #0xc]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_110:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd340
_LIT2: .word data_ov002_022cd314
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
