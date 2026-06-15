; func_0200ef60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern func_0200ed48
        .extern func_0200edb8
        .global func_0200ef60
        .arm
func_0200ef60:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_0200ed48
    movs r4, r0
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r4
    mov r2, #0x284
    bl Fill32
    mov r0, r6
    mov r1, r4
    mov r2, #0x34
    bl Copy32
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_200
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x18]
.L_200:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_218
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x1c]
.L_218:
    mov r0, r4
    str r5, [r4, #0x27c]
    bl func_0200edb8
    ldmia sp!, {r4, r5, r6, pc}
