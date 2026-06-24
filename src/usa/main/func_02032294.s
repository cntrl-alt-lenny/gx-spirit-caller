; func_02032294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031e68
        .extern func_02031f1c
        .global func_02032294
        .arm
func_02032294:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r7, r0
    ldrne r5, [r7, #0x8]
    cmpne r5, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r4, #0x2
.L_238:
    ldr r0, [r5, #0x10]
    ldr r6, [r5, #0x4]
    tst r0, #0x2
    beq .L_26c
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    bne .L_26c
    mov r0, r5
    mov r1, r4
    bl func_02031f1c
    mov r0, r7
    mov r1, r5
    bl func_02031e68
.L_26c:
    mov r5, r6
    cmp r6, #0x0
    bne .L_238
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
