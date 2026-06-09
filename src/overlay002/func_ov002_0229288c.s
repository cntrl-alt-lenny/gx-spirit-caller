; func_ov002_0229288c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_022927d0
        .global func_ov002_0229288c
        .arm
func_ov002_0229288c:
    stmdb sp!, {r3, lr}
    ldrh ip, [r0, #0x2]
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov ip, ip, lsl #0x1f
    mov ip, ip, lsr #0x1f
    and ip, ip, #0x1
    mla r2, ip, r2, r3
    ldr r3, [r2, #0xf8]
    ldr r2, _LIT2
    mov r3, r3, lsl #0x13
    cmp r2, r3, lsr #0x13
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_ov002_022927d0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x000010f4
