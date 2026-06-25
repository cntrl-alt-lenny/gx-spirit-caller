; func_ov002_02281650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_022574e0
        .extern func_ov002_02281494
        .global func_ov002_02281650
        .arm
func_ov002_02281650:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r1
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, r8, #0x1
    mla r6, r2, r1, r3
    mov r5, #0x0
    mov r9, r0
    mov r4, r5
    add r7, r6, #0x30
    mov sl, r5
.L_480:
    ldr r0, [r6, #0x40]
    mov r0, r0, lsr #0x8
    tst r0, #0x1
    beq .L_4c4
    mov r0, r9
    mov r1, r8
    mov r2, r4
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_4c4
    ldr r0, [r7]
    mov r1, sl
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_02281494
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_4c4:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r6, r6, #0x14
    add r7, r7, #0x14
    ble .L_480
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
