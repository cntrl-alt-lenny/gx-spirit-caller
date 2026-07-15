; func_ov015_021b3618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021058a9
        .extern func_020a690c
        .extern func_020a6a08
        .global func_ov015_021b3618
        .arm
func_ov015_021b3618:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r1
    ldrsb r1, [r4]
    mov r5, r0
    mov r7, #0x0
    cmp r1, #0x0
    beq .L_c0
    ldr r6, _LIT0
.L_20:
    tst r1, #0x80
    beq .L_4c
    cmp r5, #0x0
    beq .L_40
    strb r1, [r5]
    ldrsb r0, [r4, #0x1]
    strb r0, [r5, #0x1]
    add r5, r5, #0x2
.L_40:
    add r4, r4, #0x2
    add r7, r7, #0x2
    b .L_b4
.L_4c:
    cmp r1, #0x5e
    bne .L_a4
    ldrsb r0, [r4, #0x1]
    cmp r0, #0x70
    bne .L_90
    mov r0, r6
    bl func_020a690c
    mov r8, r0
    cmp r5, #0x0
    beq .L_84
    mov r0, r5
    mov r1, r6
    bl func_020a6a08
    add r5, r5, r8
.L_84:
    add r7, r7, r8
    add r4, r4, #0x2
    b .L_b4
.L_90:
    cmp r5, #0x0
    strneb r1, [r5], #0x1
    add r4, r4, #0x1
    add r7, r7, #0x1
    b .L_b4
.L_a4:
    cmp r5, #0x0
    strneb r1, [r5], #0x1
    add r4, r4, #0x1
    add r7, r7, #0x1
.L_b4:
    ldrsb r1, [r4]
    cmp r1, #0x0
    bne .L_20
.L_c0:
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021058a9
