; func_ov002_022632b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4040
        .extern func_ov002_021d5a90
        .extern func_ov002_021e2fc4
        .global func_ov002_022632b8
        .arm
func_ov002_022632b8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r5, r1
    mov r7, #0x0
    mov r6, #0xb
.L_c08:
    eor r4, r8, r7
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_021b4040
    cmp r0, #0x0
    ble .L_c68
    mov r1, r4, lsl #0x1f
    and r1, r1, #-2147483648
    orr r2, r1, #0x4e0000
    mov r1, r0, lsl #0x10
    orr r2, r2, #0xa000000
    mov r0, r5, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
    mov r0, r4
    mov r2, r5
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5a90
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c68:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_c08
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
