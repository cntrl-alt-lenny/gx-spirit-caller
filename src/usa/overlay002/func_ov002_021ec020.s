; func_ov002_021ec020 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b32d0
        .extern func_ov002_021c22cc
        .global func_ov002_021ec020
        .arm
func_ov002_021ec020:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    cmp r4, #0x5
    mov r5, r1
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r3, r5, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    mla r1, r4, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r0, #0x2]
    mov r0, r5
    mov r1, r4
    mov r3, r2, lsl #0x1a
    mov ip, r2, lsl #0x1f
    mov r2, ip, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_021b32d0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c22cc
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
