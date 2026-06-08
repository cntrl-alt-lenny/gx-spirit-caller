; func_ov002_021bc07c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e2f8
        .global func_ov002_021bc07c
        .arm
func_ov002_021bc07c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    mov r5, #0x0
    mov r4, r5
    add r6, r1, #0x30
.L_104:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2f8
    cmp r0, #0x0
    add r4, r4, #0x1
    addne r5, r5, #0x1
    cmp r4, #0xa
    add r6, r6, #0x14
    ble .L_104
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
