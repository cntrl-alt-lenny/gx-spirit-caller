; func_ov002_021ba03c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_ov002_021b90e4
        .global func_ov002_021ba03c
        .arm
func_ov002_021ba03c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r6, r0, r2
    ldr r4, _LIT1
    mov r7, r1
    ldr r5, [r4, r6]
    cmp r5, #0x0
    ble .L_54
    ldr r0, _LIT2
    add r0, r0, r6
    add r8, r0, #0x260
    add r9, r8, r5, lsl #0x2
.L_34:
    sub r1, r5, #0x1
    mov r0, r9
    add r1, r8, r1, lsl #0x2
    bl func_ov002_021b90e4
    sub r5, r5, #0x1
    cmp r5, #0x0
    sub r9, r9, #0x4
    bgt .L_34
.L_54:
    ldr r0, _LIT2
    ldr r1, [r4, r6]
    add r0, r0, r6
    add r2, r1, #0x1
    mov r1, r7
    add r0, r0, #0x260
    str r2, [r4, r6]
    bl func_ov002_021b90e4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
