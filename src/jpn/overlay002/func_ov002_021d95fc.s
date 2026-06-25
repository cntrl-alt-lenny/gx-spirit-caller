; func_ov002_021d95fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9dec
        .global func_ov002_021d95fc
        .arm
func_ov002_021d95fc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r7, #0x1
    mla r0, r2, r0, r3
    mov r6, r1
    add r5, r0, #0x64
    mov r4, #0x5
.L_5cc:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r6, r0
    bne .L_614
    ldr r3, [r5, #0x40]
    ldrh r2, [r5, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_614:
    add r4, r4, #0x1
    cmp r4, #0xa
    add r5, r5, #0x14
    blt .L_5cc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
