; func_ov002_02292c10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bc64c
        .extern func_ov002_02292a9c
        .global func_ov002_02292c10
        .arm
func_ov002_02292c10:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, #0x0
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r8, r0
    mov r7, r1
    mov r6, r5
.L_190:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    and r3, r1, #0x1
    mla r2, r3, r9, r4
    add r2, r2, r6
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    beq .L_1d0
    mov r2, r5
    bl func_ov002_021bc64c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1d0:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, #0x14
    blt .L_190
    mov r0, r8
    mov r1, r7
    bl func_ov002_02292a9c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
