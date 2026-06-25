; func_ov002_02280684 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022d008c
        .extern func_ov002_021afa84
        .extern func_ov002_021afe6c
        .extern func_ov002_021bce20
        .extern func_ov002_022535a4
        .extern func_ov002_0227ef2c
        .global func_ov002_02280684
        .arm
func_ov002_02280684:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r3
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_ov002_022535a4
    cmp r4, r0
    movge r4, r0
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r7, [r1]
    cmp r6, r0
    bne .L_44
    rsb r0, r7, #0x1
    bl func_ov002_021bce20
    cmp r4, r0
    movge r4, r0
.L_44:
    cmp r4, #0x0
    moveq r4, #0x1
    cmp r4, #0x0
    mov r9, #0x0
    ble .L_8c
.L_58:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_0227ef2c
    movs r8, r0
    bmi .L_8c
    bl func_ov002_021afa84
    mov r0, r8
    add r1, r9, #0x1
    bl func_ov002_021afe6c
    add r9, r9, #0x1
    cmp r9, r4
    blt .L_58
.L_8c:
    ldr r1, _LIT2
    mov r0, r9
    str r9, [r1, #0xd44]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word 0x000018e0
_LIT2: .word data_ov002_022d008c
