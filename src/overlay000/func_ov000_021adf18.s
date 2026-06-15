; func_ov000_021adf18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021adf18
        .arm
func_ov000_021adf18:
    stmdb sp!, {r3, r4, r5, lr}
    cmp r1, #0x0
    mov r4, #0x0
    ble .L_238
    mov r3, #0x1
    mov lr, r4
.L_1ec:
    mov r5, lr
    b .L_21c
.L_1f4:
    ldrsb ip, [r0]
    cmp ip, #0x0
    beq .L_20c
    cmp ip, #0xa
    moveq r5, r3
    b .L_218
.L_20c:
    mov r0, #0x0
    strb r0, [r2]
    ldmia sp!, {r3, r4, r5, pc}
.L_218:
    add r0, r0, #0x1
.L_21c:
    cmp r0, #0x0
    beq .L_22c
    cmp r5, #0x0
    beq .L_1f4
.L_22c:
    add r4, r4, #0x1
    cmp r4, r1
    blt .L_1ec
.L_238:
    mov r4, #0x0
    mov r3, r4
    mov r1, #0x1
    b .L_26c
.L_248:
    ldrsb ip, [r0]
    cmp ip, #0x0
    cmpne ip, #0xa
    bne .L_264
    mov r4, r1
    strb r3, [r2]
    b .L_26c
.L_264:
    add r0, r0, #0x1
    strb ip, [r2], #0x1
.L_26c:
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x0
    beq .L_248
    ldmia sp!, {r3, r4, r5, pc}
