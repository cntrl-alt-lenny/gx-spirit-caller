; func_02038984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8000
        .extern func_02037ab8
        .extern func_02088d7c
        .extern func_02091768
        .global func_02038984
        .arm
func_02038984:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, [sl]
    mov r9, r1
    mov r8, r2
    mov fp, r3
    mov r7, #0x0
    cmp r0, #0x0
    subeq r0, r7, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_02088d7c
    cmp r0, #0x0
    beq .L_d0
    cmp r8, #0x0
    ble .L_144
    ldr r5, _LIT0
    mvn r4, #0x29
.L_44:
    mov r0, #0x1
    bl func_02037ab8
    cmp r0, #0x0
    bne .L_b4
    mov r6, #0x200
    cmp r7, r8
    bge .L_b4
.L_60:
    ldrh r0, [r5]
    rsb r0, r0, #0xb6
    cmp r0, r4
    addle r0, r0, #0x7
    addle r0, r0, #0x100
    cmp r0, #0x0
    blt .L_b4
    add r0, r7, r6
    cmp r0, r8
    subgt r6, r8, r7
    mov r0, sl
    mov r1, r7
    mov r2, r9
    mov r3, r6
    bl func_01ff8000
    cmp r0, #0x0
    beq .L_b4
    add r7, r7, r6
    cmp r7, r8
    add r9, r9, r6
    blt .L_60
.L_b4:
    cmp fp, #0x0
    beq .L_c4
    mov r0, #0x1
    bl func_02091768
.L_c4:
    cmp r7, r8
    blt .L_44
    b .L_144
.L_d0:
    cmp r8, #0x0
    ble .L_144
    mov r4, #0x200
    ldr r6, _LIT0
    rsb r4, r4, #0x0
.L_e4:
    ldrh r0, [r6]
    rsbs r5, r0, #0xc0
    addmi r0, r5, #0x7
    addmi r5, r0, #0x100
    ands r5, r4, r5, lsl #0x6
    beq .L_12c
    add r0, r7, r5
    cmp r0, r8
    subgt r5, r8, r7
    mov r0, sl
    mov r1, r7
    mov r2, r9
    mov r3, r5
    bl func_01ff8000
    cmp r0, #0x0
    beq .L_144
    add r9, r9, r5
    add r7, r7, r5
.L_12c:
    cmp fp, #0x0
    beq .L_13c
    mov r0, #0x1
    bl func_02091768
.L_13c:
    cmp r7, r8
    blt .L_e4
.L_144:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04000006
