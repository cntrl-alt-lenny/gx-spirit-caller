; func_ov002_021f16d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .global func_ov002_021f16d4
        .arm
func_ov002_021f16d4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r3, _LIT0
    ldr r4, _LIT1
    and ip, r5, #0x1
    mla r6, ip, r3, r4
    mov r4, r2
    mov r3, #0x14
    mla r3, r4, r3, r6
    ldr r3, [r3, #0x30]
    mov r6, r0
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r3, [r6, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r5, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
