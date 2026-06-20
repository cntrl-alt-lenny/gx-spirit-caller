; func_ov002_02253458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern data_ov002_022cdc88
        .extern data_ov002_022ce088
        .extern data_ov002_022cf19c
        .extern data_ov002_022cf28c
        .extern data_ov002_022cf3cc
        .extern data_ov002_022cf50c
        .extern data_ov002_022cf584
        .extern data_ov002_022cf73c
        .global func_ov002_02253458
        .arm
func_ov002_02253458:
    stmdb sp!, {r3, lr}
    sub r3, r1, #0xb
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_154
    b .L_118
    b .L_28
    b .L_64
    b .L_a0
    b .L_dc
.L_28:
    ldr r1, _LIT0
    ldr r3, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    ldr r0, _LIT2
    ldr r2, [r1, r2, lsl #0x2]
    ldr ip, [r0, #0xc]
    ldr r3, _LIT3
    ldr r1, _LIT4
    str r2, [r3, ip, lsl #0x2]
    ldr r0, [r0, #0xc]
    mov r2, #0xc
    mov r0, r0, lsl #0x1
    strh r2, [r1, r0]
    b .L_190
.L_64:
    ldr r1, _LIT0
    ldr r3, _LIT5
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    ldr r0, _LIT2
    ldr r2, [r1, r2, lsl #0x2]
    ldr ip, [r0, #0xc]
    ldr r3, _LIT3
    ldr r1, _LIT4
    str r2, [r3, ip, lsl #0x2]
    ldr r0, [r0, #0xc]
    mov r2, #0xd
    mov r0, r0, lsl #0x1
    strh r2, [r1, r0]
    b .L_190
.L_a0:
    ldr r1, _LIT0
    ldr r3, _LIT6
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    ldr r0, _LIT2
    ldr r2, [r1, r2, lsl #0x2]
    ldr ip, [r0, #0xc]
    ldr r3, _LIT3
    ldr r1, _LIT4
    str r2, [r3, ip, lsl #0x2]
    ldr r0, [r0, #0xc]
    mov r2, #0xe
    mov r0, r0, lsl #0x1
    strh r2, [r1, r0]
    b .L_190
.L_dc:
    ldr r1, _LIT0
    ldr r3, _LIT7
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    ldr r0, _LIT2
    ldr r2, [r1, r2, lsl #0x2]
    ldr ip, [r0, #0xc]
    ldr r3, _LIT3
    ldr r1, _LIT4
    str r2, [r3, ip, lsl #0x2]
    ldr r0, [r0, #0xc]
    mov r2, #0xf
    mov r0, r0, lsl #0x1
    strh r2, [r1, r0]
    b .L_190
.L_118:
    ldr r1, _LIT0
    ldr r3, _LIT8
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    ldr r0, _LIT2
    ldr r2, [r1, r2, lsl #0x2]
    ldr ip, [r0, #0xc]
    ldr r3, _LIT3
    ldr r1, _LIT4
    str r2, [r3, ip, lsl #0x2]
    ldr r0, [r0, #0xc]
    mov r2, #0xb
    mov r0, r0, lsl #0x1
    strh r2, [r1, r0]
    b .L_190
.L_154:
    ldr r2, _LIT0
    mov r3, #0x14
    ldr ip, _LIT9
    and r0, r0, #0x1
    mul r3, r1, r3
    mla r2, r0, r2, ip
    ldr r0, _LIT2
    ldr r3, [r3, r2]
    ldr lr, [r0, #0xc]
    ldr ip, _LIT3
    ldr r2, _LIT4
    str r3, [ip, lr, lsl #0x2]
    ldr r0, [r0, #0xc]
    mov r0, r0, lsl #0x1
    strh r1, [r2, r0]
.L_190:
    ldr r0, _LIT2
    ldr r0, [r0, #0xc]
    cmp r0, #0xff
    ldr r0, _LIT2
    movcc r2, #0x1
    ldr r1, [r0, #0xc]
    movcs r2, #0x0
    add r1, r1, r2
    str r1, [r0, #0xc]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf50c
_LIT2: .word data_ov002_022cdc78
_LIT3: .word data_ov002_022cdc88
_LIT4: .word data_ov002_022ce088
_LIT5: .word data_ov002_022cf3cc
_LIT6: .word data_ov002_022cf584
_LIT7: .word data_ov002_022cf73c
_LIT8: .word data_ov002_022cf28c
_LIT9: .word data_ov002_022cf19c
