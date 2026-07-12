; func_ov000_021ade0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ade0c
        .arm
func_ov000_021ade0c:
    stmdb sp!, {r3, r4, r5, lr}
    cmp r1, #0x0
    mov r4, #0x0
    ble .L_20c
    mov r3, #0x1
    mov lr, r4
.L_1c0:
    mov r5, lr
    b .L_1f0
.L_1c8:
    ldrsb ip, [r0]
    cmp ip, #0x0
    beq .L_1e0
    cmp ip, #0xa
    moveq r5, r3
    b .L_1ec
.L_1e0:
    mov r0, #0x0
    strb r0, [r2]
    ldmia sp!, {r3, r4, r5, pc}
.L_1ec:
    add r0, r0, #0x1
.L_1f0:
    cmp r0, #0x0
    beq .L_200
    cmp r5, #0x0
    beq .L_1c8
.L_200:
    add r4, r4, #0x1
    cmp r4, r1
    blt .L_1c0
.L_20c:
    mov r4, #0x0
    mov r3, r4
    mov r1, #0x1
    b .L_240
.L_21c:
    ldrsb ip, [r0]
    cmp ip, #0x0
    cmpne ip, #0xa
    bne .L_238
    mov r4, r1
    strb r3, [r2]
    b .L_240
.L_238:
    add r0, r0, #0x1
    strb ip, [r2], #0x1
.L_240:
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x0
    beq .L_21c
    ldmia sp!, {r3, r4, r5, pc}
