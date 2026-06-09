; func_ov002_022a8694 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1a9c
        .extern func_0200612c
        .extern func_ov002_022ae430
        .global func_ov002_022a8694
        .arm
func_ov002_022a8694:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r0, [r0, #0xd0]
    cmp r0, #0x1
    bne .L_44
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_0200612c
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    ldr r0, _LIT1
    bl func_ov002_022ae430
    cmp r0, #0x0
    addge sp, sp, #0x8
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
.L_44:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_ov002_022d1a9c
