; func_0207d1b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207cef4
        .extern func_0207d1b4
        .global func_0207d1b4
        .arm
func_0207d1b4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r1, #0x0
    mov r6, r0
    bl func_0207cef4
    movs r4, r0
    beq .L_60
.L_1c:
    ldr r0, [r4, #0x18]
    cmp r0, r5
    bhi .L_4c
    ldr r0, [r4, #0x1c]
    cmp r5, r0
    bcs .L_4c
    mov r1, r5
    add r0, r4, #0xc
    bl func_0207d1b4
    cmp r0, #0x0
    moveq r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_4c:
    mov r0, r6
    mov r1, r4
    bl func_0207cef4
    movs r4, r0
    bne .L_1c
.L_60:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
