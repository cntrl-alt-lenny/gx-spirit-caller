; func_ov002_021d6ccc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b3538
        .extern func_ov002_021b9dec
        .extern func_ov002_021d59c4
        .global func_ov002_021d6ccc
        .arm
func_ov002_021d6ccc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r2, r0, asr #0x8
    and r4, r0, #0xff
    and r0, r1, #0xff
    and r5, r2, #0xff
    cmp r4, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT1
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r1, _LIT2
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3538
    ldr r1, _LIT3
    cmp r0, r1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    and r2, r4, #0xff
    and r1, r5, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    and r0, r0, #0xff
    and r1, r3, #0xff
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d59c4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word 0x000014ac
_LIT3: .word 0x0000ffff
