; func_ov013_021cb674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov013_021cbc3c
        .extern func_02018b48
        .extern func_02018e88
        .extern func_02019160
        .extern func_ov000_021ae4ac
        .extern Ov013_InitGraphics
        .global func_ov013_021cb674
        .arm
func_ov013_021cb674:
    stmdb sp!, {r4, lr}
    mov r0, #0x0
    ldr r4, _LIT0
    .word 0xebff9ac4
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x3c]
    str r1, [r0, #0x40]
    bl func_02018b48
    cmp r0, #0x4
    bne .L_48
    mov r0, #0x0
    mov r1, #0xd8000
    mov r2, #0xe4000
    bl func_02018e88
    mov r0, #0x2
    bl func_02019160
    b .L_78
.L_48:
    bl func_ov000_021ae4ac
    cmp r0, #0x0
    beq .L_78
    ldr r1, [r4, #0x168]
    ldr r0, _LIT1
    mov r1, r1, lsl #0xb
    mov r1, r1, lsr #0x1d
    add r1, r1, #0x1
    str r1, [r0, #0x3c]
    bl func_ov000_021ae4ac
    ldr r1, _LIT1
    str r0, [r1, #0x40]
.L_78:
    bl Ov013_InitGraphics
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov013_021cbc3c
_LIT1: .word data_021040ac
