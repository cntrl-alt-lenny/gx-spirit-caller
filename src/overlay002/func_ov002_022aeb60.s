; func_ov002_022aeb60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1af8
        .extern func_02037208
        .extern func_ov002_0229a414
        .global func_ov002_022aeb60
        .arm
func_ov002_022aeb60:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xc8]
    mov r2, #0x0
    cmp r0, #0x0
    moveq r5, #0x1
    movne r5, #0x0
    cmp r5, #0x0
    mov r3, #0x1
    beq .L_460
    mov r0, #0x56
    ldr ip, _LIT1
    sub r1, r0, #0x57
    str r2, [ip, #0x4]
    bl func_02037208
    b .L_46c
.L_460:
    mov r0, #0x42
    sub r1, r0, #0x43
    bl func_02037208
.L_46c:
    mov r0, r5
    bl func_ov002_0229a414
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0xd4]
    ldr r0, _LIT0
    cmp r2, #0x8
    movlt r2, #0x8
    str r2, [r0, #0xd4]
    str r1, [r4, #0x38]
    mov r0, #0x1
    str r0, [r4, #0x40]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_ov002_022d1af8
