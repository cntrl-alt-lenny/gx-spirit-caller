; func_02000d9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02105824
        .extern func_02000d4c
        .global func_02000d9c
        .arm
func_02000d9c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r0, [r1, #0x80]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    sub r0, r0, #0x1
    add r3, r1, r0, lsl #0x4
    ldr r0, [r3, #0x10]
    ldr r4, _LIT1
    ldmib r3, {r1, r2}
    str r1, [r4, #0x3c]
    ldr r1, [r3, #0xc]
    str r2, [r4, #0x40]
    str r1, [r4, #0x44]
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    mov r5, #0x0
    b .L_60
.L_4c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    str r5, [r4, #0x3c]
    str r5, [r4, #0x40]
.L_60:
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    cmp r0, #0x16
    cmpne r0, #0x36
    cmpne r0, #0x2e
    cmpne r0, #0x38
    cmpne r0, #0x26
    beq .L_4c
    cmp r0, #0x4
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02105824
_LIT1: .word data_02103fcc
