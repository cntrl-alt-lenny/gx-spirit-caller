; func_ov002_0221abdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern func_ov002_021b34f4
        .extern func_ov002_021d5a08
        .global func_ov002_0221abdc
        .arm
func_ov002_0221abdc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldrh r1, [r6, #0x4]
    ldr r0, _LIT0
    mov r2, r1, lsl #0x1d
    movs r2, r2, lsr #0x1f
    ldr r4, [r0]
    ldr r5, [r0, #0x1c]
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    mov lr, r1, lsl #0x11
    ldr ip, _LIT1
    mov r1, r0, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, _LIT2
    and r3, r2, #0x1
    mla ip, r3, r1, ip
    mov r7, r0, lsl #0x1a
    mov r3, r7, lsr #0x1b
    mov r1, #0x14
    mul r1, r3, r1
    add ip, ip, #0x30
    ldr ip, [ip, r1]
    mov lr, lr, lsr #0x17
    mov r1, ip, lsl #0x2
    mov r1, r1, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, ip, lsr #0x1f
    cmp lr, r1
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xee
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x2
    bhi .L_498
    cmp r4, r2
    beq .L_498
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b34f4
    cmp r0, #0x0
    bne .L_498
    mov r0, #0x7
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldrh r2, [r6, #0x2]
    mov r0, r6
    mov r1, r4
    mov r3, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r3, r2, lsl #0x10
    mov r2, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d5a08
.L_498:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
