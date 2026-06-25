; func_ov002_022281a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b9d20
        .extern func_ov002_021d90f0
        .global func_ov002_022281a0
        .arm
func_ov002_022281a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, #0x0
    ldr r6, _LIT0
    ldr r5, _LIT1
    ldr r4, _LIT2
    mov fp, r9
.L_17c:
    ldr r0, [r5, #0xcec]
    mov r8, fp
    eor r7, r0, r9
    and r0, r7, #0x1
    mla sl, r0, r4, r6
.L_190:
    ldrh r0, [sl, #0x38]
    cmp r0, #0x0
    beq .L_1c0
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9d20
    movs r2, r0
    beq .L_1c0
    mov r0, r7
    mov r1, r8
    rsb r2, r2, #0x0
    bl func_ov002_021d90f0
.L_1c0:
    add r8, r8, #0x1
    cmp r8, #0xa
    add sl, sl, #0x14
    ble .L_190
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_17c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
