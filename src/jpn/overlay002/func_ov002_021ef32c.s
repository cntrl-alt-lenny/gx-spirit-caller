; func_ov002_021ef32c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b32d0
        .global func_ov002_021ef32c
        .arm
func_ov002_021ef32c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r1
    ldr r4, _LIT0
    ldr r5, _LIT1
    and r0, sl, #0x1
    mla r1, r0, r4, r5
    mov r9, r2
    mov r0, #0x14
    mla r0, r9, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, #0x0
    mov fp, r6
.L_3cc:
    and r0, r6, #0x1
    mla r1, r0, r4, r5
    mov r7, fp
    add r8, r1, #0x30
.L_3dc:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_40c
    mov r0, sl
    mov r1, r9
    mov r2, r6
    mov r3, r7
    bl func_ov002_021b32d0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_40c:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r8, r8, #0x14
    ble .L_3dc
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_3cc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
