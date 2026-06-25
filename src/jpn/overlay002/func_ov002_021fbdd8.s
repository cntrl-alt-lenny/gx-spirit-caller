; func_ov002_021fbdd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b98d4
        .extern func_ov002_021d8038
        .global func_ov002_021fbdd8
        .arm
func_ov002_021fbdd8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b98d4
    ldrh r1, [r4, #0x2]
    mov ip, r0
    ldr r3, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, ip, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d8038
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
