; func_ov002_02255f9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b3d48
        .extern func_ov002_021d5a90
        .extern func_ov002_021df5e4
        .extern func_ov002_021e0f5c
        .global func_ov002_02255f9c
        .arm
func_ov002_02255f9c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r7, #0x0
    mov r6, #0xb
.L_1614:
    ldr r0, [r4, #0xcec]
    mov r1, r6
    eor r8, r0, r7
    mov r0, r8
    mov r2, r5
    bl func_ov002_021b3d48
    cmp r0, #0x0
    beq .L_1668
    ldr r1, _LIT0
    mov r0, r8
    bl func_ov002_021df5e4
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021e0f5c
    mov r1, #0xb
    mov r0, r8
    add r2, r1, #0x1a00
    mov r3, #0x0
    bl func_ov002_021d5a90
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1668:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_1614
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00001a0b
_LIT1: .word data_ov002_022d008c
