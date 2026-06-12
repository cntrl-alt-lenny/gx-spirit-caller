; func_ov002_0226bb58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202e234
        .global func_ov002_0226bb58
        .arm
func_ov002_0226bb58:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0xd94]
    cmp r0, r3
    beq .L_ac
    cmp r1, #0xb
    bne .L_ac
    ldr r1, _LIT1
    ldr r3, _LIT2
    and ip, r0, #0x1
    mla r0, ip, r1, r3
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, pc}
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
