; func_ov002_021e30b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b97d4
        .extern func_ov002_021e2e80
        .extern func_ov002_021fd81c
        .global func_ov002_021e30b4
        .arm
func_ov002_021e30b4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    movs r0, r5, asr #0x1
    bne .L_268
    and r0, r6, #-2147483648
    mov r1, r6, lsl #0x10
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x10
    bl func_ov002_021b97d4
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
.L_268:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021fd81c
    cmp r0, #0x0
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov002_021e2e80
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
