; func_ov002_02263858 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4120
        .extern func_ov002_021d5b80
        .extern func_ov002_021e30b4
        .global func_ov002_02263858
        .arm
func_ov002_02263858:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r5, _LIT0
    mov r8, r0
    mov r7, #0x0
    mov r6, #0xb
.L_118:
    eor r4, r8, r7
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_021b4120
    cmp r0, #0x0
    ble .L_190
    and r1, r0, #0x1
    cmp r1, r4
    movne r2, #0x1
    moveq r2, #0x0
    mov r1, r1, lsl #0x1f
    and r3, r1, #-2147483648
    mov r1, r0, lsl #0x10
    mov r2, r2, lsl #0x18
    orr r3, r3, #0xa000000
    and r2, r2, #0x1000000
    ldr r0, _LIT1
    orr r2, r3, r2
    orr r0, r2, r0
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    ldr r2, _LIT0
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5b80
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_190:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_118
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000018bc
_LIT1: .word 0x004f18bc
