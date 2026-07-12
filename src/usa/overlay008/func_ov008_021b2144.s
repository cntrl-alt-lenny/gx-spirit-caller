; func_ov008_021b2144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b25ec
        .extern data_ov008_021b263c
        .extern func_0202160c
        .extern func_0202165c
        .extern func_02091554
        .global func_ov008_021b2144
        .arm
func_ov008_021b2144:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r3, [r2]
    ldr r2, [r3, #0xc]
    cmp r0, r2
    cmpeq r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    str r0, [r3, #0xc]
    ldr r0, [r1]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    mov r2, #0x2
    bl func_0202160c
    mov r4, r0
    mov r1, #0x2
    mov r2, #0x29
    bl func_0202165c
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x41
    bl func_0202165c
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    ldr r2, [r0, #0xc]
    add r0, r0, #0x70
    bl func_02091554
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b25ec
_LIT1: .word data_ov008_021b263c
