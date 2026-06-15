; func_0200bff4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200bff4
        .arm
func_0200bff4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    mov r4, r1
    mov lr, r2
    mov ip, r3
    mov r2, r5
    mov r1, #0x0
.L_1c:
    ldr r0, [r2, #0xdc]
    cmp r0, #0x0
    blt .L_40
    cmp r4, r0
    beq .L_40
    add r1, r1, #0x1
    cmp r1, #0x8
    add r2, r2, #0x24
    blt .L_1c
.L_40:
    cmp r1, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x24
    mul r8, r1, r0
    add r0, r5, #0xbc
    add r7, r0, r8
    mov r6, r7
    ldmia ip!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia ip, {r0, r1, r2, r3}
    stmia r6, {r0, r1, r2, r3}
    str lr, [r7, #0x18]
    add r0, r5, r8
    str r4, [r0, #0xdc]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
