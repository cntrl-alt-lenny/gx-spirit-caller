; func_ov008_021b1cfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov008_021b25ec
        .extern data_ov008_021b25f8
        .extern data_ov008_021b260c
        .extern func_0202160c
        .extern func_0202165c
        .extern func_02091554
        .extern func_ov008_021b1874
        .extern func_ov008_021b19b4
        .extern func_ov008_021b1af0
        .global func_ov008_021b1cfc
        .arm
func_ov008_021b1cfc:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r3, [r2]
    ldr r2, [r3, #0x10]
    cmp r0, r2
    cmpeq r1, #0x0
    ldmeqia sp!, {r4, pc}
    str r0, [r3, #0x10]
    bl func_ov008_021b1874
    mov r0, #0x0
    bl func_ov008_021b19b4
    bl func_ov008_021b1af0
    ldr r0, _LIT0
    mov r1, #0x3
    ldr r0, [r0]
    mov r2, #0x2
    ldr r0, [r0, #0x4]
    bl func_0202160c
    mov r4, r0
    mov r1, #0x2
    mov r2, #0x29
    bl func_0202165c
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x41
    bl func_0202165c
    ldr r0, _LIT1
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    bne .L_94
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0]
    ldr r2, [r0, #0x10]
    add r0, r0, #0x70
    bl func_02091554
    ldmia sp!, {r4, pc}
.L_94:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0]
    ldr r2, [r0, #0x10]
    add r0, r0, #0x70
    bl func_02091554
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b25ec
_LIT1: .word data_02103fcc
_LIT2: .word data_ov008_021b25f8
_LIT3: .word data_ov008_021b260c
