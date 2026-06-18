; func_ov002_0220ba94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c84e0
        .global func_ov002_0220ba94
        .arm
func_ov002_0220ba94:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    mov r3, #0x14
    ldr r2, _LIT1
    ldr ip, _LIT2
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r2, lr, r2, ip
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021c84e0
    cmp r0, #0x3
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
