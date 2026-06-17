; func_ov002_0224b1e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_0202e234
        .extern func_ov002_021ca5bc
        .extern func_ov002_02253458
        .global func_ov002_0224b1e0
        .arm
func_ov002_0224b1e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, _LIT0
    ldr r3, _LIT1
    and r4, r6, #0x1
    mla r0, r4, r0, r3
    mov r4, r2
    add r8, r0, #0x120
    ldr r0, [r8, r4, lsl #0x2]
    mov r5, r1
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    bl func_0202b878
    mov r7, r0
    mov r0, r5
    bl func_0202b878
    cmp r7, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [r8, r4, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r6
    mov r2, r4
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
