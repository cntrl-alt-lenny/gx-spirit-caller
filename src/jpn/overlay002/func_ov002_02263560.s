; func_ov002_02263560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4040
        .extern func_ov002_021d5a90
        .extern func_ov002_021e2fc4
        .global func_ov002_02263560
        .arm
func_ov002_02263560:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r5, _LIT0
    mov r9, r0
    mov r7, #0x0
    mov r6, #0xb
.L_14c:
    eor r8, r9, r7
    mov r0, r8
    mov r1, r6
    mov r2, r5
    bl func_ov002_021b4040
    movs r4, r0
    bmi .L_1a0
    ldr r2, _LIT0
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5a90
    mov r1, r8, lsl #0x1f
    ldr r0, _LIT1
    and r1, r1, #-2147483648
    orr r0, r1, r0
    mov r2, r4
    mov r1, #0x0
    bl func_ov002_021e2fc4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1a0:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_14c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000015b8
_LIT1: .word 0x0a5015b8
