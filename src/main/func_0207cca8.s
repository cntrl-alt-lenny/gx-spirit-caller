; func_0207cca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a089c
        .extern func_0207b538
        .extern func_0207c934
        .extern func_0207c990
        .extern func_0207c9dc
        .extern func_0209f720
        .global func_0207cca8
        .arm
func_0207cca8:
    stmdb sp!, {r4, lr}
    bl func_0207b538
    movs r4, r0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r0, r4, #0x2000
    ldr r1, [r0, #0x260]
    cmp r1, #0x9
    ldmneia sp!, {r4, lr}
    bxne lr
    ldrb r0, [r0, #0x26b]
    cmp r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r0, _LIT0
    bl func_0207c990
    cmp r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r1, _LIT1
    ldr r0, _LIT2
    add r1, r4, r1
    add r2, r4, #0xf00
    mov r3, #0x0
    bl func_0209f720
    cmp r0, #0x2
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r0, _LIT0
    bl func_0207c934
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a089c
_LIT1: .word 0x00002144
_LIT2: .word func_0207c9dc
