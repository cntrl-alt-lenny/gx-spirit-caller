; func_02063e0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061c5c
        .extern func_02061fa4
        .extern func_020628fc
        .extern func_020643d8
        .global func_02063e0c
        .arm
func_02063e0c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x1
    beq .L_198
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_198:
    bl func_02061fa4
    mov r0, r6
    bl func_020628fc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r2, r5
    mov r3, r4
    mov r1, #0x2
    bl func_02061c5c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
