; func_02044254 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02044228
        .extern func_02094688
        .global func_02044254
        .arm
func_02044254:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl func_02044228
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    add r1, sp, #0x0
    mov r0, r5
    mov r2, #0x4
    bl func_02094688
    add r1, sp, #0x4
    mov r0, r4
    mov r2, #0x4
    bl func_02094688
    ldr r3, [sp, #0x4]
    ldr r2, [sp]
    mvn r0, #0x1
    orr r1, r2, r3
    cmp r1, r0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    mvn r0, r3
    ands r0, r2, r0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
