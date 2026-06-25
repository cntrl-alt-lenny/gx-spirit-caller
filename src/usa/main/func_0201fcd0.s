; func_0201fcd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c65e8
        .extern data_02191e60
        .extern data_02191f40
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201fd70
        .extern func_0209e930
        .global func_0201fcd0
        .arm
func_0201fcd0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x4
    cmpne r0, #0x6
    cmpne r0, #0x5
    bne .L_94
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_8c
    ldr r0, _LIT1
    blx r1
.L_8c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_94:
    mov r0, #0x3
    bl func_0201f0e4
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0, #0x18]
    mov r2, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x10
    mov ip, r0, lsr #0x10
    ldr r0, _LIT3
    mov r3, #0x1
    str ip, [sp]
    bl func_0209e930
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c65e8
_LIT2: .word data_02191f40
_LIT3: .word func_0201fd70
