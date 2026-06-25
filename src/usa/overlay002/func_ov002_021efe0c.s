; func_ov002_021efe0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e2a4
        .extern func_ov002_021c1d64
        .global func_ov002_021efe0c
        .arm
func_ov002_021efe0c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r4, #0x1
    mla r3, ip, r1, r3
    mov r5, r2
    mov r1, #0x14
    mla r1, r5, r1, r3
    ldr r1, [r1, #0x30]
    mov r6, r0
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_0202e2a4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1d64
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
