; func_ov002_021c9650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4b8
        .extern data_ov002_022cd4cc
        .extern data_ov002_022cf16c
        .global func_ov002_021c9650
        .arm
func_ov002_021c9650:
    sub r3, r1, #0xb
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_118
    b .L_e8
    b .L_24
    b .L_54
    b .L_84
    b .L_b8
.L_24:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x3a0
    ldr r1, [r0, r2, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bx lr
.L_54:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x260
    ldr r1, [r0, r2, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bx lr
.L_84:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x18
    add r0, r0, #0x400
    ldr r1, [r0, r2, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bx lr
.L_b8:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x5d0
    ldr r1, [r0, r2, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bx lr
.L_e8:
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r3
    add r0, r1, #0x120
    ldr r1, [r0, r2, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bx lr
.L_118:
    add r3, r1, r2
    cmp r3, #0xa
    ble .L_15c
    ldr r2, _LIT2
    ldr r3, [r2]
    cmp r0, r3
    ldreq r0, [r2, #0x1c]
    cmpeq r1, r0
    ldreq r0, _LIT3
    ldrne r0, _LIT4
    ldr r1, [r0]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bx lr
.L_15c:
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    mov r0, #0x14
    mul r0, r3, r0
    add r1, r1, #0x30
    ldr r1, [r1, r0]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bx lr
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cd3f4
_LIT3: .word data_ov002_022cd4b8
_LIT4: .word data_ov002_022cd4cc
