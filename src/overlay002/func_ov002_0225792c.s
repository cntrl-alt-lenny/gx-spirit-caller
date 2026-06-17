; func_ov002_0225792c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .global func_ov002_0225792c
        .arm
func_ov002_0225792c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    ldr r4, _LIT0
    ldr r1, _LIT1
    and r3, r8, #0x1
    mla r6, r3, r1, r4
    mov r4, #0x0
    ldr r1, _LIT2
    mov r9, r0
    mov r7, r2
    mov r5, r4
    str r4, [r1, #0x5c0]
.L_d4:
    ldr r0, [r6, #0x40]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    bne .L_fc
    mov r0, r9
    mov r1, r8
    mov r2, r5
    blx r7
    cmp r0, #0x0
    addne r4, r4, #0x1
.L_fc:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    ble .L_d4
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce288
