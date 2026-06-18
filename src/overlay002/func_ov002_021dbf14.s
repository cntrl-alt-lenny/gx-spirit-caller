; func_ov002_021dbf14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021dbd48
        .global func_ov002_021dbf14
        .arm
func_ov002_021dbf14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r7, #0x0
    mov fp, r0
    mov sl, r1
    str r2, [sp, #0x4]
    mov r9, r3
    mov r5, r7
    mov r8, r7
.L_1f0:
    mov r6, #0x0
.L_1f4:
    add r4, r6, r8
    mov r0, #0x1
    tst sl, r0, lsl r4
    beq .L_228
    ldr r3, [sp, #0x4]
    mov r0, fp
    mov r1, r5
    mov r2, r6
    str r9, [sp]
    bl func_ov002_021dbd48
    cmp r0, #0x0
    movne r0, #0x1
    orrne r7, r7, r0, lsl r4
.L_228:
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_1f4
    add r5, r5, #0x1
    cmp r5, #0x2
    add r8, r8, #0x10
    blt .L_1f0
    mov r0, r7
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
