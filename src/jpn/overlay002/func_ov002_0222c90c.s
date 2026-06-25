; func_ov002_0222c90c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021d6718
        .extern func_ov002_02257564
        .global func_ov002_0222c90c
        .arm
func_ov002_0222c90c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, #0x0
    ldr r4, _LIT0
    mov sl, r0
    mov r6, #0x1
    mov r5, r9
    mov fp, r9
.L_488:
    ldr r0, [r4, #0xcec]
    mov r8, fp
    eor r7, r0, r9
.L_494:
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_4c4
    mov r0, sl
    mov r1, r7
    mov r2, r8
    mov r3, r5
    str r6, [sp]
    bl func_ov002_021d6718
.L_4c4:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_494
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_488
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
