; func_ov002_021d7100 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d479c
        .extern func_ov002_021d6dbc
        .extern func_ov002_021d6e70
        .global func_ov002_021d7100
        .arm
func_ov002_021d7100:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r2
    mov r5, r1
    and r6, r4, #0xff
    and r2, r5, #0xff
    and ip, r2, #0x1
    ldr r1, _LIT0
    ldr r3, _LIT1
    and r7, r6, #0x1
    mla r6, r7, r1, r3
    mla r3, ip, r1, r3
    mov lr, r4, asr #0x8
    mov r2, r5, asr #0x8
    and lr, lr, #0xff
    mov r1, #0x14
    mla ip, lr, r1, r6
    and r2, r2, #0xff
    mla r1, r2, r1, r3
    ldr r2, [ip, #0x30]
    ldr r1, [r1, #0x30]
    mov r2, r2, lsl #0x13
    mov r1, r1, lsl #0x13
    mov r3, r2, lsr #0x13
    mov r2, r1, lsr #0x13
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r6, r0
    mov r1, r1, lsr #0x10
    movs r0, r2, lsr #0x10
    cmpne r1, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021d6dbc
    mov r0, r4
    mov r1, r5
    bl func_ov002_021d6dbc
    cmp r6, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x3e
    mov r0, r0, lsl #0x10
    mov r1, r5
    mov r2, r4
    mov r0, r0, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    mov r0, r5
    mov r1, r4
    bl func_ov002_021d6e70
    mov r0, r4
    mov r1, r5
    bl func_ov002_021d6e70
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
