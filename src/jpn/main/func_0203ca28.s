; func_0203ca28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c8b0
        .global func_0203ca28
        .arm
func_0203ca28:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, #0x1
    mov r5, r1
    mov r4, r2
    bl func_0203c8b0
    ldrb r2, [r0, #0x8]
    ands r1, r2, r6
    ldmeqia sp!, {r4, r5, r6, pc}
    mvn r1, r6
    and r1, r2, r1
    strb r1, [r0, #0x8]
    ldr r3, [r0, #0x4]
    mov r0, r6
    mov r1, r5
    mov r2, r4
    blx r3
    ldmia sp!, {r4, r5, r6, pc}
