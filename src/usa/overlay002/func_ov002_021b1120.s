; func_ov002_021b1120 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b1120
        .arm
func_ov002_021b1120:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, #0x0
    mov r9, r0
    mov r7, r6
    mov r4, r6
    mov r5, r6
.L_5c4:
    mov r8, r5
.L_5c8:
    mov r0, r7
    mov r1, r8
    mov r2, r4
    blx r9
    cmp r0, #0x0
    add r8, r8, #0x1
    addne r6, r6, #0x1
    cmp r8, #0xa
    ble .L_5c8
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_5c4
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
