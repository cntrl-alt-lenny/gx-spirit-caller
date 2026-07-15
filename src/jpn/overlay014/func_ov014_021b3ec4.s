; func_ov014_021b3ec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov014_02234fe0
        .extern func_02005898
        .extern func_0201eee8
        .global func_ov014_021b3ec4
        .arm
func_ov014_021b3ec4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r5, #0x0
    add r6, r8, #0x10
    add r7, r8, #0xc
    mov r4, r5
.L_a74:
    ldr r0, [r8, #0x4]
    mov r1, r7
    mov r2, r6
    bl func_0201eee8
    add r5, r5, #0x1
    str r4, [r8, #0x14]
    str r4, [r8, #0x10]
    cmp r5, #0x4
    add r6, r6, #0x14
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_a74
    bl func_02005898
    ldr r4, _LIT0
    mov r5, #0x0
.L_ab0:
    ldr r0, [r4, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_ac0
    bl Task_InvokeLocked
.L_ac0:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_ab0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov014_02234fe0
