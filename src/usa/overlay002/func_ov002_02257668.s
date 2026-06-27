; func_ov002_02257668 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .global func_ov002_02257668
        .arm
func_ov002_02257668:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, #0x0
    mov sl, r0
    mov r9, r1
    mov r5, r4
    mov r7, r4
    mov fp, #0x1
.L_1c:
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r5, #0x1
    mla r8, r2, r1, r0
    mov r6, #0x0
.L_30:
    ldr r0, [r8, #0x40]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    bne .L_5c
    mov r0, sl
    mov r1, r5
    mov r2, r6
    blx r9
    cmp r0, #0x0
    addne r0, r6, r7
    orrne r4, r4, fp, lsl r0
.L_5c:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x14
    ble .L_30
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x10
    blt .L_1c
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
