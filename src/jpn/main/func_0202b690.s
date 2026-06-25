; func_0202b690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b678
        .global func_0202b690
        .arm
func_0202b690:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    movs r6, r2
    mov r8, r0
    mov r5, #0x0
    mov r7, r1
    subeq r0, r5, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_20:
    mov r0, r4
    bl func_0202b678
    cmp r8, r0
    bne .L_44
    cmp r5, r6
    mvnge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    str r4, [r7, r5, lsl #0x2]
    add r5, r5, #0x1
.L_44:
    add r4, r4, #0x1
    cmp r4, #0x1b80
    blt .L_20
    cmp r5, r6
    movlt r0, #0x0
    strlt r0, [r7, r5, lsl #0x2]
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000fa6
