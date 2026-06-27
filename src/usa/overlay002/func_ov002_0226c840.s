; func_ov002_0226c840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021bf1b4
        .global func_ov002_0226c840
        .arm
func_ov002_0226c840:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0xd94]
    cmp r0, r3
    bne .L_e80
    add r3, r1, r2
    cmp r3, #0x4
    bgt .L_e80
    mov r2, #0x1
    str r2, [sp]
    ldr r1, _LIT1
    mov r2, r0
    ldrh r1, [r1, #0xa2]
    rsb r0, r0, #0x1
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, pc}
.L_e80:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022d0d8c
