; func_ov002_022577a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .global func_ov002_022577a0
        .arm
func_ov002_022577a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r3, _LIT0
    mov r4, #0x0
    mov fp, r0
    mov sl, r1
    mov r9, r2
    mov r5, r4
    str r4, [r3, #0x5c0]
.L_20:
    ldr r1, _LIT1
    ldr r0, _LIT2
    and r2, r5, #0x1
    mla r7, r2, r1, r0
    mov r6, #0x0
    and r8, r5, #0xff
.L_38:
    and r0, r6, #0xff
    orr r0, r8, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r9, r0, lsr #0x10
    beq .L_74
    ldr r0, [r7, #0x40]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    bne .L_74
    mov r0, fp
    mov r1, r5
    mov r2, r6
    blx sl
    cmp r0, #0x0
    addne r4, r4, #0x1
.L_74:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r7, r7, #0x14
    ble .L_38
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_20
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
