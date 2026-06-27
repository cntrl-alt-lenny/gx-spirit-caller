; func_ov002_0226cd9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae52c
        .extern func_ov002_02282efc
        .global func_ov002_0226cd9c
        .arm
func_ov002_0226cd9c:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    mov r3, r2, lsl #0x10
    mov lr, r3, lsr #0x10
    ldr r3, [ip, #0xd9c]
    mov lr, lr, asr #0x8
    cmp r3, #0x0
    and r4, r2, #0xff
    and lr, lr, #0xff
    beq .L_538
    cmp r3, #0x1
    beq .L_580
    b .L_5b4
.L_538:
    ldr r3, _LIT1
    ldr r3, [r3, r0, lsl #0x2]
    cmp r3, #0x1
    bne .L_558
    bl func_ov002_02282efc
    ldr r1, _LIT0
    str r0, [r1, #0xd44]
    b .L_568
.L_558:
    mov r1, r4
    mov r2, lr
    mov r0, #0xf2
    bl func_ov002_021ae52c
.L_568:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_580:
    ldr r3, [ip, #0xd44]
    mov r2, #0x1
    tst r3, #0x2
    bne .L_5a0
    mov r0, r2
.L_594:
    add r2, r2, #0x1
    tst r3, r0, lsl r2
    beq .L_594
.L_5a0:
    ldr r1, _LIT2
    mov r0, #0x1
    strh r3, [r1, #0xb0]
    strh r2, [r1, #0xb2]
    ldmia sp!, {r4, pc}
.L_5b4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d0d8c
