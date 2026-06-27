; func_0200eed4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern func_0200ed2c
        .extern func_0200ed9c
        .global func_0200eed4
        .arm
func_0200eed4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_0200ed2c
    movs r4, r0
    mov r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, r4
    mov r2, #0x284
    bl Fill32
    mov r0, r7
    mov r1, r4
    mov r2, #0x34
    bl Copy32
    cmp r5, #0x1
    bne .L_68
    mov r0, r4
    bl func_0200ed9c
    cmp r0, #0x0
    cmpne r6, #0x0
    strne r6, [r0, #0x98]
    strne r5, [r0, #0x9c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_68:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
