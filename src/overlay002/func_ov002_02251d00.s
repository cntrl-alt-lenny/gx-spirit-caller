; func_ov002_02251d00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b890
        .extern func_ov002_021b9128
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_02251d00
        .arm
func_ov002_02251d00:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, _LIT0
    ldr r3, _LIT1
    and ip, r4, #0x1
    mla r0, ip, r0, r3
    mov r6, r2
    add r0, r0, r6, lsl #0x2
    ldr r2, [r0, #0x120]
    mov r0, r1
    mov r1, r2, lsl #0x13
    mov r5, r1, lsr #0x13
    bl func_0202b890
    mov r1, r0
    mov r0, r5
    bl func_ov002_021b9128
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021ca440
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r2, r6
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
