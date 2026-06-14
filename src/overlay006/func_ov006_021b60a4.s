; func_ov006_021b60a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_02105a4c
        .extern func_020124a4
        .extern func_ov006_021b6ad8
        .extern func_ov006_021b7bb0
        .extern func_ov006_021b7c94
        .extern func_ov006_021b7cc0
        .extern func_ov006_021b7cfc
        .extern func_ov006_021b7e80
        .global func_ov006_021b60a4
        .arm
func_ov006_021b60a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r3, #0x0
    mov r5, r0
    mov r4, r2
    str r1, [sp]
    bl func_ov006_021b6ad8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1dc
    b .L_188
    b .L_1a0
    b .L_1bc
    b .L_1d0
.L_188:
    add r0, r5, #0x248
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r5
    bl Copy32
    b .L_1dc
.L_1a0:
    add r0, r5, #0xb50
    add r0, r0, #0x3000
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r5
    bl Copy32
    b .L_1dc
.L_1bc:
    ldr r0, _LIT0
    mov r1, r5
    mov r2, #0x124
    bl Copy32
    b .L_1dc
.L_1d0:
    mov r0, r4
    mov r1, r5
    bl func_020124a4
.L_1dc:
    mov r0, r5
    add r1, r5, #0x6000
    mov r2, #0x1
    str r2, [r1, #0x294]
    bl func_ov006_021b7cfc
    mov r0, r5
    bl func_ov006_021b7e80
    mov sl, #0x0
    add r0, r5, #0x6000
    mov r9, #0x1
    str sl, [r0, #0x294]
    mov r8, sl
    mvn r7, #0x0
    mov r6, r9
    mov fp, #0x2
.L_218:
    cmp sl, #0x0
    beq .L_2c8
    mov r0, r5
    mov r1, sl
    mov r2, r9
    bl func_ov006_021b7c94
    mov r0, r5
    mov r1, sl
    mov r2, r8
    mov r3, r7
    bl func_ov006_021b7cc0
    mov r0, r5
    mov r1, sl
    mov r2, r6
    mov r3, r7
    bl func_ov006_021b7cc0
    mov r0, r5
    mov r1, sl
    mov r2, fp
    mov r3, r7
    bl func_ov006_021b7cc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x3
    mov r3, r7
    bl func_ov006_021b7cc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x4
    mov r3, r7
    bl func_ov006_021b7cc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x5
    mov r3, r7
    bl func_ov006_021b7cc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x6
    mov r3, r7
    bl func_ov006_021b7cc0
    mov r0, r5
    mov r1, sl
    bl func_ov006_021b7bb0
.L_2c8:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_218
    ldr r0, [sp]
    add r1, r5, #0x6000
    str r0, [r1, #0x23c]
    str r4, [r1, #0x240]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02105a4c
