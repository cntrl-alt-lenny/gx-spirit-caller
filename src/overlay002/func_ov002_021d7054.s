; func_ov002_021d7054 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d479c
        .extern func_ov002_021d6dbc
        .extern func_ov002_021d6e70
        .global func_ov002_021d7054
        .arm
func_ov002_021d7054:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    and r4, r6, #0xff
    ldr ip, _LIT0
    ldr r2, _LIT1
    and r3, r4, #0x1
    mla r7, r3, ip, r2
    mov r3, r6, asr #0x8
    and r5, r3, #0xff
    mov lr, #0x14
    mla r3, r5, lr, r7
    mov r5, r1
    ldr r3, [r3, #0x30]
    mov r8, r5, asr #0x8
    mov r7, r3, lsl #0x13
    and r9, r5, #0xff
    and r3, r8, #0xff
    movs r7, r7, lsr #0x13
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    and r7, r9, #0x1
    mla r2, r7, ip, r2
    mla r2, r3, lr, r2
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021d6dbc
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x3d
    mov r0, r0, lsl #0x10
    mov r1, r6
    mov r2, r5
    mov r0, r0, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    mov r0, r6
    mov r1, r5
    bl func_ov002_021d6e70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
