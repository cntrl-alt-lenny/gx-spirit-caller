; func_02082494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02082494
        .arm
func_02082494:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    mov r0, #0x0
    mov r6, r1
    str r0, [r7]
    add r4, sp, #0x0
    mov r5, r2, lsl #0x1
    mov r8, #0x1
.L_1c8:
    add r1, r5, r6
    ldrh r2, [r1, #0x1a]
    ands r1, r2, #0x100
    beq .L_200
    ldr r3, [r6, #0xc]
    mov r0, r4
    mov r1, r6
    and r2, r2, #0xff
    blx r3
    ldr r2, [r7]
    ldr r1, [sp]
    mov r0, r8
    orr r1, r2, r1
    str r1, [r7]
.L_200:
    ldr r6, [r6, #0x10]
    cmp r6, #0x0
    bne .L_1c8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
