; func_02079a60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02079a60
        .arm
func_02079a60:
    stmdb sp!, {r4, lr}
    cmp r3, #0x0
    mov r4, #0x0
    ble .L_38
.L_10:
    mov lr, r4, lsl #0x1
    ldrh ip, [r1, lr]
    sub ip, ip, r2
    mov r2, ip, lsr #0x10
    strh ip, [r0, lr]
    ands r2, r2, #0x1
    beq .L_38
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_10
.L_38:
    cmp r0, r1
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r4, r4, #0x1
    cmp r4, r3
    ldmgeia sp!, {r4, lr}
    bxge lr
.L_54:
    mov ip, r4, lsl #0x1
    ldrh r2, [r1, ip]
    add r4, r4, #0x1
    cmp r4, r3
    strh r2, [r0, ip]
    blt .L_54
    ldmia sp!, {r4, lr}
    bx lr
