; func_ov002_021bc000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9ecc
        .global func_ov002_021bc000
        .arm
func_ov002_021bc000:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r8, #0x1
    mla r6, r2, r0, r3
    mov r5, #0x0
    mov r7, r1
    mov r4, r5
.L_24:
    ldrh r0, [r6, #0x38]
    cmp r0, #0x0
    beq .L_5c
    ldr r1, [r6, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_5c
    mov r0, r8
    mov r1, r4
    bl func_ov002_021b9ecc
    blx r7
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_5c:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r6, r6, #0x14
    blt .L_24
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
