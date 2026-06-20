; func_ov002_021b0184 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022d016c
        .extern func_ov002_021b1cf0
        .extern func_ov002_021d479c
        .global func_ov002_021b0184
        .arm
func_ov002_021b0184:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1, #0xcf4]
    cmp r1, r0
    ldmneia sp!, {r3, pc}
    bl func_ov002_021b1cf0
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r2, [r1, #0xcf0]
    str r2, [r1, #0xcf4]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0xb
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x0000ffff
_LIT2: .word data_ov002_022cd73c
