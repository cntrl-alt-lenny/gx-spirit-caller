; func_02082774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02082774
        .arm
func_02082774:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r1
    mov r0, #0x0
    mov r4, r2, lsl #0x1
    mov r7, #0x1
.L_54c:
    add r1, r4, r5
    ldrh r2, [r1, #0x1a]
    ands r1, r2, #0x100
    beq .L_574
    ldr r3, [r5, #0xc]
    mov r0, r6
    mov r1, r5
    and r2, r2, #0xff
    blx r3
    mov r0, r7
.L_574:
    ldr r5, [r5, #0x10]
    cmp r5, #0x0
    bne .L_54c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
