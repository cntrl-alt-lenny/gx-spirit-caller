; func_ov002_022017dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_0223dda4
        .extern func_ov002_022574e0
        .global func_ov002_022017dc
        .arm
func_ov002_022017dc:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    mov r5, r1
    mov r4, r2
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
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
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r2, r5, #0xff
    and r1, r4, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT2
    mov ip, #0x1
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str ip, [r3, #0x5c4]
    bl func_ov002_022574e0
    ldr r1, _LIT2
    mov r2, #0x0
    str r2, [r1, #0x5c4]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022ce1a8
