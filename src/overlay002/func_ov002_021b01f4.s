; func_ov002_021b01f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022d016c
        .extern func_ov002_021d479c
        .global func_ov002_021b01f4
        .arm
func_ov002_021b01f4:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r1, [r2, #0xe0]
    cmp r1, #0x0
    ldmneia sp!, {r3, pc}
    mov r3, #0x1
    str r3, [r2, #0xe0]
    ldr r1, _LIT1
    mov r2, #0x0
    ldr r1, [r1, #0x4]
    cmp r0, r1
    moveq r3, #0x2
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    ldr r1, _LIT0
    orr r0, r0, #0x23
    str r3, [r1, #0xd00]
    mov r0, r0, lsl #0x10
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, #0xb
    bl func_ov002_021d479c
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd73c
