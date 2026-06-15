; func_02015638 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a26c
        .extern func_020139c4
        .extern func_020190ec
        .extern func_020191cc
        .extern func_020195b8
        .extern func_020195ec
        .extern func_02019640
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b7b4
        .global func_02015638
        .arm
func_02015638:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1c24
    b .L_1d1c
    b .L_1cc4
    b .L_1c2c
.L_1c24:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_1c2c:
    bl func_020191cc
    cmp r0, #0xb
    blt .L_1c88
    mov r0, #0xf
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x1
    blt .L_1c88
    bl func_020190ec
    cmp r0, #0x0
    beq .L_1c88
    bl func_020139c4
    cmp r0, #0x5
    blt .L_1c88
    mov r0, #0x7
    bl func_0201abb0
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1c90
    mov r0, #0x8
    bl func_0200a26c
    b .L_1c90
.L_1c88:
    mov r0, #0x7
    bl func_0201abd4
.L_1c90:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x7
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc4:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_1d10
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b7b4
    mov r0, #0x7
    bl func_0201abd4
    ldmia sp!, {r3, r4, r5, pc}
.L_1d10:
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1d1c:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1d44
    mov r0, #0x1
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_1d44:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_02019640
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00120100
_LIT1: .word 0x00120104
_LIT2: .word 0x00120102
_LIT3: .word 0x00120103
