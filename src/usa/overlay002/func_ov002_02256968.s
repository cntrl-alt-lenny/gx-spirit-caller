; func_ov002_02256968 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .extern func_ov002_021e2ca4
        .global func_ov002_02256968
        .arm
func_ov002_02256968:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, #0x0
    ldr r4, _LIT0
    ldr r5, _LIT1
    mov r7, #0x5
    mov r6, sl
    mov fp, sl
.L_91c:
    ldr r0, [r5, #0xcec]
    mov r9, fp
    eor r8, r0, sl
.L_928:
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9dec
    cmp r0, r4
    bne .L_950
    mov r0, r8
    mov r1, r9
    mov r2, r7
    mov r3, r6
    bl func_ov002_021e2ca4
.L_950:
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_928
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_91c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001744
_LIT1: .word data_ov002_022d008c
