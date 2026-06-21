; func_ov002_021eab5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c8470
        .global func_ov002_021eab5c
        .arm
func_ov002_021eab5c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    and ip, r1, #0x1
    mov r3, #0x14
    mul r0, ip, r0
    ldr ip, _LIT1
    mul r3, r2, r3
    add ip, ip, r0
    add ip, ip, r3
    ldr ip, [ip, #0x30]
    mov ip, ip, lsl #0x13
    movs ip, ip, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr ip, _LIT2
    add ip, ip, r0
    ldrh ip, [r3, ip]
    cmp ip, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr ip, _LIT3
    add r0, ip, r0
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_bc
    mov r0, r1
    mov r1, r2
    bl func_ov002_021c8470
    ldrh r1, [r4, #0x8]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_bc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
