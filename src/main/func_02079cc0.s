; func_02079cc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02079cc0
        .arm
func_02079cc0:
    stmdb sp!, {r4, lr}
    cmp r3, #0x0
    mov r4, #0x0
    ble .L_dec
.L_dc8:
    mov lr, r4, lsl #0x1
    ldrh ip, [r1, lr]
    add r2, r2, ip
    strh r2, [r0, lr]
    movs r2, r2, lsr #0x10
    beq .L_dec
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_dc8
.L_dec:
    cmp r0, r1
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r4, r4, #0x1
    cmp r4, r3
    ldmgeia sp!, {r4, lr}
    bxge lr
.L_e08:
    mov ip, r4, lsl #0x1
    ldrh r2, [r1, ip]
    add r4, r4, #0x1
    cmp r4, r3
    strh r2, [r0, ip]
    blt .L_e08
    ldmia sp!, {r4, lr}
    bx lr
