; func_ov002_022635e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4040
        .extern func_ov002_021d5a90
        .extern func_ov002_021e2fc4
        .global func_ov002_022635e4
        .arm
func_ov002_022635e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r5, _LIT0
    mov r9, r0
    mov r7, #0x0
    mov r6, #0xb
.L_14:
    eor r8, r9, r7
    mov r0, r8
    mov r1, r6
    mov r2, r5
    bl func_ov002_021b4040
    movs r4, r0
    bmi .L_6c
    ldr r2, _LIT0
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5a90
    mov r2, r8, lsl #0x1f
    mov r1, r4, lsl #0xd
    and r3, r2, #-2147483648
    ldr r0, _LIT1
    mov r2, r4
    orr r0, r3, r0
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6c:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_14
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000016b9
_LIT1: .word 0x0a4f16b9
