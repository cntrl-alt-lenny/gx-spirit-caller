; func_ov002_021d1538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022d016c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d1538
        .arm
func_ov002_021d1538:
    stmdb sp!, {r3, lr}
    ldr ip, _LIT0
    ldr r0, _LIT1
    ldrh r1, [ip, #0x2]
    str r1, [r0, #0xdc]
    ldr r0, [ip, #0x810]
    cmp r0, #0x0
    bne .L_3c
    add lr, r0, #0x1
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x6
    str lr, [ip, #0x810]
    bl func_ov002_0229ade0
    ldmia sp!, {r3, pc}
.L_3c:
    mov r0, #0x6
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022d016c
