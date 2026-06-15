; func_020a6a28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a6a28
        .arm
func_020a6a28:
    stmdb sp!, {r4, lr}
    ldrsb r2, [r0]
    mov r4, #0x0
    cmp r2, #0x0
    beq .L_88
    mov r3, r4
.L_40:
    mov lr, r3
    b .L_4c
.L_48:
    add lr, lr, #0x1
.L_4c:
    ldrsb ip, [r1, lr]
    cmp ip, #0x0
    beq .L_68
    add r2, r4, lr
    ldrsb r2, [r0, r2]
    cmp r2, ip
    beq .L_48
.L_68:
    cmp ip, #0x0
    addeq r0, r0, r4
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r4, r4, #0x1
    ldrsb r2, [r0, r4]
    cmp r2, #0x0
    bne .L_40
.L_88:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
