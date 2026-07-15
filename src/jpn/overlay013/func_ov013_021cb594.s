; func_ov013_021cb594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov013_021cbb5c
        .extern func_02018b14
        .extern func_02018e54
        .extern func_0201912c
        .extern func_ov000_021ae3a0
        .extern func_ov002_021b20ac
        .extern func_ov013_021cb564
        .global func_ov013_021cb594
        .arm
func_ov013_021cb594:
    stmdb sp!, {r4, lr}
    mov r0, #0x0
    ldr r4, _LIT0
    bl func_ov002_021b20ac
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x3c]
    str r1, [r0, #0x40]
    bl func_02018b14
    cmp r0, #0x4
    bne .L_48
    mov r0, #0x0
    mov r1, #0xd8000
    mov r2, #0xe4000
    bl func_02018e54
    mov r0, #0x2
    bl func_0201912c
    b .L_78
.L_48:
    bl func_ov000_021ae3a0
    cmp r0, #0x0
    beq .L_78
    ldr r1, [r4, #0x168]
    ldr r0, _LIT1
    mov r1, r1, lsl #0xb
    mov r1, r1, lsr #0x1d
    add r1, r1, #0x1
    str r1, [r0, #0x3c]
    bl func_ov000_021ae3a0
    ldr r1, _LIT1
    str r0, [r1, #0x40]
.L_78:
    bl func_ov013_021cb564
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov013_021cbb5c
_LIT1: .word data_02103fcc
