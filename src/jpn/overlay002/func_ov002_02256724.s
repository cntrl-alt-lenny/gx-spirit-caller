; func_ov002_02256724 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021babc8
        .extern func_ov002_021de390
        .global func_ov002_02256724
        .arm
func_ov002_02256724:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r5, _LIT0
    ldr r6, _LIT1
    ldr r4, _LIT2
    ldr fp, _LIT3
    mov r9, #0x0
.L_644:
    ldr r0, [r4, #0xcec]
    mov r8, #0x0
    eor r7, r0, r9
    and r0, r7, #0x1
    mla sl, r0, fp, r6
.L_658:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    ldrneh r0, [sl, #0x36]
    cmpne r0, #0x0
    beq .L_694
    mov r2, #0x0
    mov r0, r7
    mov r1, r8
    mov r3, r2
    bl func_ov002_021de390
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_694:
    add r8, r8, #0x1
    cmp r8, #0x4
    add sl, sl, #0x14
    ble .L_658
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_644
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000016bf
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000868
