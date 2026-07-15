; func_ov010_021b6a58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b9784
        .extern data_ov010_021b9790
        .extern func_020371b8
        .extern func_020b377c
        .extern func_ov005_021ac8c0
        .extern func_ov010_021b3914
        .global func_ov010_021b6a58
        .arm
func_ov010_021b6a58:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [r2, #0x94]
    mov r7, r1
    ldr r4, _LIT1
    bl func_ov005_021ac8c0
    mov r5, r0
    cmp r5, #0x0
    mov r1, #0x0
    ble .L_198
    ldrsh r0, [r7, #0x2]
    mov r1, r5
    sub r0, r0, #0x24
    bl func_020b377c
    mov r1, r0
.L_198:
    ldr r0, [r4]
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrsh r2, [r7, #0x6]
    ldrsh r0, [r7, #0x2]
    sub r0, r2, r0
    cmp r0, r5
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0xe8]
    cmp r1, r0
    bne .L_1d4
    ldr r0, [r4, #0x358]
    orr r0, r0, #0x10
    str r0, [r4, #0x358]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1d4:
    add r0, r4, #0x8c
    bl func_ov010_021b3914
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r6, [r4, #0x4]
    bl func_020371b8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov010_021b9784
_LIT1: .word data_ov010_021b9790
