; func_02060c10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02060c10
        .arm
func_02060c10:
    sub r2, r1, #0x6
    mov r3, r0
    cmp r2, #0x0
    ble .L_7d8
.L_770:
    ldrsb r1, [r3]
    cmp r1, #0x5c
    bne .L_7c8
    ldrsb r1, [r3, #0x1]
    cmp r1, #0x66
    bne .L_7c8
    ldrsb r1, [r3, #0x2]
    cmp r1, #0x69
    bne .L_7c8
    ldrsb r1, [r3, #0x3]
    cmp r1, #0x6e
    bne .L_7c8
    ldrsb r1, [r3, #0x4]
    cmp r1, #0x61
    bne .L_7c8
    ldrsb r1, [r3, #0x5]
    cmp r1, #0x6c
    bne .L_7c8
    ldrsb r1, [r3, #0x6]
    cmp r1, #0x5c
    moveq r0, r3
    bxeq lr
.L_7c8:
    add r3, r3, #0x1
    sub r1, r3, r0
    cmp r1, r2
    blt .L_770
.L_7d8:
    mov r0, #0x0
    bx lr
