; func_ov002_021c93f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4b8
        .extern data_ov002_022cd4cc
        .extern data_ov002_022cf16c
        .global func_ov002_021c93f0
        .arm
func_ov002_021c93f0:
    sub r3, r1, #0xb
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_b4
    b .L_98
    b .L_24
    b .L_40
    b .L_5c
    b .L_7c
.L_24:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x3a0
    add r0, r0, r2, lsl #0x2
    bx lr
.L_40:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x260
    add r0, r0, r2, lsl #0x2
    bx lr
.L_5c:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x18
    add r0, r0, #0x400
    add r0, r0, r2, lsl #0x2
    bx lr
.L_7c:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x5d0
    add r0, r0, r2, lsl #0x2
    bx lr
.L_98:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x120
    add r0, r0, r2, lsl #0x2
    bx lr
.L_b4:
    add r3, r1, r2
    cmp r3, #0xa
    ble .L_e0
    ldr r2, _LIT2
    ldr r3, [r2]
    cmp r0, r3
    ldreq r0, [r2, #0x1c]
    cmpeq r1, r0
    ldreq r0, _LIT3
    ldrne r0, _LIT4
    bx lr
.L_e0:
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    add r1, r1, #0x30
    mov r0, #0x14
    mla r0, r3, r0, r1
    bx lr
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cd3f4
_LIT3: .word data_ov002_022cd4b8
_LIT4: .word data_ov002_022cd4cc
