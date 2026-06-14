; func_ov006_021b6898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020b4768
        .extern data_ov006_0224f448
        .extern func_0202b0e0
        .extern func_0202b9b0
        .extern func_0202bb20
        .extern func_ov006_021b7240
        .extern func_ov006_021b7bb0
        .extern func_ov006_021b7c94
        .extern func_ov006_021b7cc0
        .extern func_ov006_021b843c
        .extern func_ov006_021b8bf4
        .extern func_ov006_021b8d30
        .global func_ov006_021b6898
        .arm
func_ov006_021b6898:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldr r2, _LIT1
    mov r0, #0x0
    bl Fill32
    mov r0, sl
    bl func_ov006_021b8d30
    mov r0, sl
    bl func_ov006_021b8bf4
    mov r5, #0x0
    mov r4, r5
.L_30:
    mov r0, sl
    mov r1, r5
    mov r2, r4
    bl func_ov006_021b843c
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_30
    ldr r0, _LIT2
    mov r4, #0x0
    ldr r9, [r0]
    mov r5, r4
    cmp r9, #0x1
    mov r7, #0x1
    blt .L_d0
    add r0, sl, #0x2a0
    add r8, r0, #0x6000
    mov fp, #0x2
.L_74:
    mov r0, r7
    bl func_0202b0e0
    ldr r1, _LIT3
    mov r6, r0
    add r1, r6, r1
    cmp r1, #0x2
    bhi .L_9c
    bl func_0202bb20
    cmp r0, #0x0
    beq .L_c4
.L_9c:
    mov r0, r6
    bl func_0202b9b0
    cmp r0, #0x3
    bge .L_c4
    strh r6, [r8]
    and r0, fp, #0xff
    strb fp, [r8, #0x2]
    add r5, r5, r0
    add r8, r8, #0x4
    add r4, r4, #0x1
.L_c4:
    add r7, r7, #0x1
    cmp r7, r9
    ble .L_74
.L_d0:
    add r0, sl, #0x8100
    strh r4, [r0, #0x60]
    strh r5, [r0, #0x6a]
    cmp r4, #0x0
    mov r5, #0x0
    ble .L_128
    add r0, sl, #0x2a0
    add r8, r0, #0x6000
    mov r7, #0x1
    mov r6, r5
.L_f8:
    ldrh r0, [r8]
    bl func_0202b9b0
    mov r1, r0
    str r7, [sp]
    ldrh r3, [r8], #0x4
    mov r0, sl
    mov r2, r6
    add r1, r1, #0x1
    bl func_ov006_021b7240
    add r5, r5, #0x1
    cmp r5, r4
    blt .L_f8
.L_128:
    mov r9, #0x0
    mov r8, #0x8
    mov r7, r9
    mvn r6, #0x0
    mov r5, #0x1
    mov r4, #0x2
    mov fp, #0x3
.L_144:
    mov r0, sl
    mov r1, r9
    mov r2, r8
    bl func_ov006_021b7c94
    mov r0, sl
    mov r1, r9
    mov r2, r7
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, r4
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x4
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x5
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x6
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    bl func_ov006_021b7bb0
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_144
    mov r2, #0x0
.L_1fc:
    add r0, sl, r2, lsl #0x1
    add r0, r0, #0x8100
    ldrh r1, [r0, #0x6a]
    add r2, r2, #0x1
    cmp r2, #0x5
    strh r1, [r0, #0x74]
    blt .L_1fc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word 0x0000ca98
_LIT2: .word data_020b4768
_LIT3: .word 0xffffec7a
