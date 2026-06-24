; func_020070e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020070c0
        .global func_020070e8
        .arm
func_020070e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r1
    mov r6, r0
    mov r0, r5
    bl func_020070c0
    mov r4, r0
    mov r0, r6
    bl func_020070c0
    sub r0, r0, r4
    add r9, r0, #0x1
    cmp r9, #0x0
    mov r0, #0x0
    ble .L_98
    ldrsb r8, [r5]
    mov r1, #0x1
    mov ip, r0
.L_40:
    ldrsb r2, [r6, r0]
    add sl, r6, r0
    cmp r8, r2
    bne .L_8c
    mov r7, ip
    mov lr, ip
    cmp r4, #0x0
    ble .L_84
.L_60:
    ldrsb r3, [sl]
    ldrsb r2, [r5, lr]
    cmp r3, r2
    movne r7, r1
    bne .L_84
    add lr, lr, #0x1
    cmp lr, r4
    add sl, sl, #0x1
    blt .L_60
.L_84:
    cmp r7, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8c:
    add r0, r0, #0x1
    cmp r0, r9
    blt .L_40
.L_98:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
