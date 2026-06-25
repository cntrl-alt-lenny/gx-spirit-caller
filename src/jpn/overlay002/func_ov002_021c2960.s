; func_ov002_021c2960 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202e2a4
        .extern func_ov002_021b90e4
        .global func_ov002_021c2960
        .arm
func_ov002_021c2960:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r1, [r6]
    ldr r0, _LIT0
    mov r2, r1, lsl #0x12
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r5, r2, r0
    ldr r0, _LIT1
    ldr r4, _LIT2
    add r0, r0, r5
    add r0, r0, #0x18
    ldr r2, [r4, r5]
    add r0, r0, #0x400
    mov r1, r1, lsl #0x13
    add r7, r0, r2, lsl #0x2
    movs r0, r1, lsr #0x13
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_0202e2a4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b90e4
    ldr r0, [r4, r5]
    add r0, r0, #0x1
    str r0, [r4, r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0a0
