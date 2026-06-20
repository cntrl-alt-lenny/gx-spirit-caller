; func_ov002_022b50a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f7c
        .extern func_02034784
        .extern func_02034810
        .extern func_0207f05c
        .extern func_ov002_022b3c5c
        .extern func_ov002_022b3fbc
        .extern func_ov002_022b4380
        .extern func_ov002_022b4588
        .extern func_ov002_022b4950
        .extern func_ov002_022b4df0
        .global func_ov002_022b50a4
        .arm
func_ov002_022b50a4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r5, #0x0
.L_1778:
    mov r0, r4
    mov r1, r5
    bl func_ov002_022b3fbc
    mov r0, r4
    mov r1, r5
    bl func_ov002_022b4380
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_1778
    bl func_02034784
    cmp r0, #0x0
    beq .L_17e0
    bl func_02034810
    mov r0, r0, lsl #0x8
    add r0, r0, #0x380
    add r1, r0, #0x4000
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov ip, r0, asr #0x5
    ldr r3, _LIT0
    ldr r0, _LIT1
    add r1, sp, #0x0
    mov r2, #0x1
    str r3, [sp]
    strh ip, [sp, #0x4]
    bl func_0207f05c
.L_17e0:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_022b4df0
    mov r0, r4
    bl func_ov002_022b4588
    mov r5, #0x0
.L_1804:
    mov r0, r4
    mov r1, r5
    bl func_ov002_022b3c5c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_1804
    mov r0, r4
    bl func_ov002_022b4950
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x40ef2001
_LIT1: .word data_ov002_022d0f7c
