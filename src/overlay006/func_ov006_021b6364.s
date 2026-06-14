; func_ov006_021b6364 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021040ac
        .extern data_ov006_0224f448
        .extern func_020124a4
        .extern func_ov006_021b7bb0
        .extern func_ov006_021b7c94
        .extern func_ov006_021b7cc0
        .extern func_ov006_021b7cfc
        .extern func_ov006_021b7e80
        .extern func_ov006_021b8bf4
        .extern func_ov006_021b8d30
        .global func_ov006_021b6364
        .arm
func_ov006_021b6364:
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
    ldr r0, _LIT2
    mov r1, sl
    ldr r0, [r0, #0xc3c]
    bl func_020124a4
    mov r0, sl
    add r1, sl, #0x6000
    mov r2, #0x1
    str r2, [r1, #0x294]
    bl func_ov006_021b7cfc
    mov r0, sl
    bl func_ov006_021b7e80
    mov r9, #0x0
    add r0, sl, #0x6000
    mov r8, #0x1
    str r9, [r0, #0x294]
    mov r7, r9
    mvn r6, #0x0
    mov r5, r8
    mov r4, #0x2
    mov fp, #0x3
.L_47c:
    sub r0, r9, #0x1
    cmp r0, #0x1
    bhi .L_530
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
.L_530:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_47c
    mov r2, #0x0
.L_540:
    add r0, sl, r2, lsl #0x1
    add r0, r0, #0x8100
    ldrh r1, [r0, #0x6a]
    add r2, r2, #0x1
    cmp r2, #0x5
    strh r1, [r0, #0x74]
    blt .L_540
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word 0x0000ca98
_LIT2: .word data_021040ac
