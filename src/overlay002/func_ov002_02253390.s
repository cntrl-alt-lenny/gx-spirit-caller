; func_ov002_02253390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern data_ov002_022cf184
        .extern data_ov002_022cf188
        .extern func_ov002_02253458
        .global func_ov002_02253390
        .arm
func_ov002_02253390:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r2
    sub r1, r4, #0xc
    mov r5, r0
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_88
    b .L_44
    b .L_74
    b .L_2c
    b .L_5c
.L_2c:
    ldr r0, _LIT0
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r7, [r0, r2]
    b .L_88
.L_44:
    ldr r0, _LIT0
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r7, [r0, r2]
    b .L_88
.L_5c:
    ldr r0, _LIT0
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r7, [r0, r2]
    b .L_88
.L_74:
    ldr r0, _LIT0
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT4
    ldr r7, [r0, r2]
.L_88:
    mov r6, #0x0
    cmp r7, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
.L_94:
    mov r0, r5
    mov r1, r4
    mov r2, r6
    bl func_ov002_02253458
    add r6, r6, #0x1
    cmp r6, r7
    blt .L_94
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf184
_LIT3: .word data_ov002_022cf188
_LIT4: .word data_ov002_022cf17c
