; func_ov002_02280714 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022d016c
        .extern func_ov002_021afb64
        .extern func_ov002_021aff4c
        .extern func_ov002_0225368c
        .extern func_ov002_0227f03c
        .global func_ov002_02280714
        .arm
func_ov002_02280714:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r3
    mov r9, r0
    mov r8, r1
    mov r7, r2
    bl func_ov002_0225368c
    cmp r6, r0
    movge r6, r0
    ldr r0, _LIT0
    cmp r6, #0x0
    str r9, [r0]
    mov r5, #0x0
    ble .L_68
.L_34:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_0227f03c
    movs r4, r0
    bmi .L_68
    bl func_ov002_021afb64
    mov r0, r4
    add r1, r5, #0x1
    bl func_ov002_021aff4c
    add r5, r5, #0x1
    cmp r5, r6
    blt .L_34
.L_68:
    ldr r1, _LIT1
    mov r0, r5
    str r5, [r1, #0xd44]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022d016c
