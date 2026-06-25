; func_0201f480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern data_02193240
        .extern data_021932a0
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201f514
        .extern func_0209f310
        .global func_0201f480
        .arm
func_0201f480:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x4
    cmpne r0, #0x6
    cmpne r0, #0x5
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    mov r0, #0x4
    bl func_0201f0e4
    ldr r2, _LIT0
    mov r3, #0x1
    ldr r1, [r2, #0x3c]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    stmia sp, {r1, r3}
    ldr r2, [r2, #0x10]
    ldr r1, _LIT2
    mov r2, r2, lsl #0x10
    ldr r3, _LIT3
    mov r2, r2, lsr #0x10
    bl func_0209f310
    cmp r0, #0x2
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word func_0201f514
_LIT2: .word data_021932a0
_LIT3: .word data_02193240
