; func_ov004_021d641c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_0220f228
        .extern func_02052cdc
        .global func_ov004_021d641c
        .arm
func_ov004_021d641c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r6, _LIT1
    mov r5, #0x0
    add r4, r0, #0xd4
.L_668:
    mov r1, r6
    add r0, r4, #0x3c00
    bl func_02052cdc
    cmp r0, #0x0
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    cmp r5, #0x3c
    add r6, r6, #0x54
    blt .L_668
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_0220f228
