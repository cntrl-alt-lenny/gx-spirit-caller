; func_ov002_022578c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_0225737c
        .global func_ov002_022578c0
        .arm
func_ov002_022578c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r5, #0x0
    bl func_ov002_0225737c
    movs r6, r0
    ldr r0, _LIT0
    mov r7, r5
    str r7, [r0, #0x5c0]
    ldrne r0, [r6, #0x8]
    cmpne r0, #0x0
    beq .L_88
    ldr r4, _LIT1
    ldr fp, _LIT2
.L_34:
    and r0, r7, #0x1
    mla r9, r0, fp, r4
    mov r8, #0x0
.L_40:
    ldr r0, [r9, #0x40]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    bne .L_6c
    ldr r3, [r6, #0x8]
    mov r0, sl
    mov r1, r7
    mov r2, r8
    blx r3
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_6c:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x14
    ble .L_40
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_34
.L_88:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
