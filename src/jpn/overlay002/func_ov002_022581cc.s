; func_ov002_022581cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021e302c
        .extern func_ov002_021e3264
        .extern func_ov002_02254944
        .extern func_ov002_022582cc
        .global func_ov002_022581cc
        .arm
func_ov002_022581cc:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r3, [r2, #0xd5c]
    mov r4, r0
    cmp r3, r1
    bne .L_530
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_ov002_022582cc
    ldmia sp!, {r4, pc}
.L_530:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0x5d8]
    ldr r0, [r2, #0xd70]
    bl func_ov002_02254944
    cmp r4, #0x0
    beq .L_584
    ldr r0, _LIT0
    mov r2, r4
    ldr r1, [r0, #0xd70]
    ldr r3, [r0, #0xd5c]
    mov r1, r1, lsl #0x1f
    ldr r0, [r0, #0xd60]
    and ip, r1, #-2147483648
    mov r1, r0, lsl #0x10
    orr ip, ip, #0x4e0000
    mov r0, r3, lsl #0x10
    orr r0, ip, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e3264
    b .L_5b4
.L_584:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd70]
    ldr r2, [r0, #0xd5c]
    mov r1, r1, lsl #0x1f
    ldr r0, [r0, #0xd60]
    and r3, r1, #-2147483648
    mov r1, r0, lsl #0x10
    orr r3, r3, #0x4e0000
    mov r0, r2, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e302c
.L_5b4:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000fee
_LIT2: .word data_ov002_022ce1a8
