; func_ov002_02255774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021babc8
        .extern func_ov002_021bb82c
        .extern func_ov002_021de390
        .global func_ov002_02255774
        .arm
func_ov002_02255774:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, #0x0
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r6, r9
.L_69c:
    ldr r0, [r4, #0xcec]
    mov r8, r6
    eor r7, r0, r9
.L_6a8:
    mov r0, r7
    mov r1, r8
    add r2, r5, #0xb
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_6f0
    mov r0, r7
    mov r1, r5
    bl func_ov002_021bb82c
    cmp r0, #0x0
    bne .L_6f0
    mov r2, #0x0
    mov r0, r7
    mov r1, r8
    mov r3, r2
    bl func_ov002_021de390
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6f0:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_6a8
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_69c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000146f
_LIT1: .word data_ov002_022d008c
