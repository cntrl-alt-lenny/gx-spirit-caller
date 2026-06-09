; func_ov002_02288a48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202ef08
        .global func_ov002_02288a48
        .arm
func_ov002_02288a48:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x14]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r4, r0, lsr #0x13
    mov r0, r4
    bl func_0202ef08
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    cmp r4, r0
    bne .L_148
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_148:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word 0x000019bc
