; func_ov002_0224cbfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_02253458
        .global func_ov002_0224cbfc
        .arm
func_ov002_0224cbfc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r7, r1, r0, r2
    mov r6, #0x0
    mov r5, #0xd
    b .L_598
.L_584:
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02253458
    add r6, r6, #0x1
.L_598:
    ldr r0, [r7, #0x10]
    cmp r6, r0
    ldmcsia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r6, #0x3
    blt .L_584
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
