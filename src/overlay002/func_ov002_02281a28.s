; func_ov002_02281a28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .global func_ov002_02281a28
        .arm
func_ov002_02281a28:
    stmdb sp!, {r3, lr}
    cmp r1, #0xb
    bne .L_3c
    ldr r1, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    cmp r0, #0x16
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_3c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
