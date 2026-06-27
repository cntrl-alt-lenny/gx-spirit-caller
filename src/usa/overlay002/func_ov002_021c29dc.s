; func_ov002_021c29dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a8
        .extern data_ov002_022cf814
        .extern func_0202e2a4
        .extern func_ov002_021b90e4
        .global func_ov002_021c29dc
        .arm
func_ov002_021c29dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldr r3, [r8]
    ldr r0, _LIT0
    mov r2, r3, lsl #0x12
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r6, r2, r0
    ldr r4, _LIT1
    ldr r2, _LIT2
    mov r0, r3, lsl #0x13
    add r2, r2, r6
    ldr r5, [r4, r6]
    add r2, r2, #0x5d0
    mov r7, r1
    add r9, r2, r5, lsl #0x2
    movs r0, r0, lsr #0x13
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_0202e2a4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b90e4
    ldr r0, _LIT3
    mov r1, r5, lsl #0x1
    add r0, r0, r6
    strh r7, [r1, r0]
    ldr r0, [r4, r6]
    add r0, r0, #0x1
    str r0, [r4, r6]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a8
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf814
