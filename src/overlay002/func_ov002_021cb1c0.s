; func_ov002_021cb1c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf26c
        .extern data_ov002_022cfa6c
        .extern data_ov002_022d016c
        .extern func_ov002_021b218c
        .extern func_ov002_021b2ab4
        .global func_ov002_021cb1c0
        .arm
func_ov002_021cb1c0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    beq .L_44
    ldr r0, _LIT1
    mov r2, #0x1
    ldrh r0, [r0, #0x16]
    ldr r1, _LIT2
    mov r3, r2
    bl func_ov002_021b218c
    ldr r0, _LIT3
    mov r2, #0x1
    ldrh r0, [r0, #0x7e]
    ldr r1, _LIT2
    mov r3, r2
    bl func_ov002_021b218c
.L_44:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0]
    bic r1, r1, #0x1
    str r1, [r0, #0xd0]
    bl func_ov002_021b2ab4
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf26c
_LIT2: .word 0x000019b8
_LIT3: .word data_ov002_022cfa6c
_LIT4: .word data_ov002_022ce950
