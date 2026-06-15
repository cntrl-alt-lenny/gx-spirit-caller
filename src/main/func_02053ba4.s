; func_02053ba4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02053ba4
        .arm
func_02053ba4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r2
    mov sl, r0
    mov r9, r1
    mov r7, r3
    cmp r8, #0x0
    ldr r6, [sp, #0x20]
    mov r5, #0x0
    ble .L_480
    mov r4, r5
.L_458:
    mov r0, sl
    add r1, r9, r4
    blx r6
    cmp r0, #0x0
    mlaeq r0, r7, r5, r9
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r5, r5, #0x1
    cmp r5, r8
    add r4, r4, r7
    blt .L_458
.L_480:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
