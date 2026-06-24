; func_02031f48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031e68
        .extern func_02031f1c
        .global func_02031f48
        .arm
func_02031f48:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r5, [r7, #0xc]
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r4, #0x1
.L_18:
    ldr r1, [r5, #0x14]
    ldr r0, [r5, #0x18]
    ldr r6, [r5]
    cmp r1, r0
    ldmccia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    mov r1, r4
    bl func_02031f1c
    mov r0, r7
    mov r1, r5
    bl func_02031e68
    mov r5, r6
    cmp r6, #0x0
    bne .L_18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
