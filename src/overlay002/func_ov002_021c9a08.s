; func_ov002_021c9a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf180
        .extern data_ov002_022cf184
        .extern data_ov002_022cf188
        .global func_ov002_021c9a08
        .arm
func_ov002_021c9a08:
    sub r2, r1, #0xb
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_218
    b .L_200
    b .L_1a0
    b .L_1b8
    b .L_1d0
    b .L_1e8
.L_1a0:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT1
    ldr r0, [r0, r1]
    bx lr
.L_1b8:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    bx lr
.L_1d0:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT3
    ldr r0, [r0, r1]
    bx lr
.L_1e8:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT4
    ldr r0, [r0, r1]
    bx lr
.L_200:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT5
    ldr r0, [r0, r1]
    bx lr
.L_218:
    ldr r2, _LIT0
    ldr r3, _LIT6
    and r0, r0, #0x1
    mla r2, r0, r2, r3
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf184
_LIT2: .word data_ov002_022cf17c
_LIT3: .word data_ov002_022cf180
_LIT4: .word data_ov002_022cf188
_LIT5: .word data_ov002_022cf178
_LIT6: .word data_ov002_022cf16c
