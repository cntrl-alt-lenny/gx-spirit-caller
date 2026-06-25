; func_0206b574 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020688e8
        .extern func_02068b20
        .global func_0206b574
        .arm
func_0206b574:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x5d0]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    str r0, [sp]
    cmp r0, #0x0
    beq .L_4c
    add r4, sp, #0x0
.L_2c:
    ldr r0, [sp]
    bl func_020688e8
    mov r5, r0
    mov r0, r4
    bl func_02068b20
    str r5, [sp]
    cmp r5, #0x0
    bne .L_2c
.L_4c:
    mov r0, #0x0
    str r0, [r6, #0x5d0]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
