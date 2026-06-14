; func_ov006_021b8e4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005a60
        .extern func_0202b4f4
        .extern func_020a97b8
        .extern func_ov006_021b7240
        .extern func_ov006_021b7bb0
        .extern func_ov006_021b843c
        .extern func_ov006_021b8f88
        .extern func_ov006_021b9c88
        .global func_ov006_021b8e4c
        .arm
func_ov006_021b8e4c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    mov r4, r3
    cmp r2, #0x0
    beq .L_3c
    mov r0, r1
    mov r1, #0x0
    bl func_0202b4f4
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    add r0, r5, #0xc000
    str r1, [r0, #0xa94]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3c:
    add r2, r5, #0xc000
    mov r0, r1
    ldr r1, [r2, #0xa90]
    bl func_0202b4f4
    add r1, r5, #0xc000
    str r0, [r1, #0xa94]
    ldr r0, [r1, #0xa90]
    ldr r1, [r1, #0xa94]
    ldr r3, _LIT0
    mov r2, #0x2
    bl func_020a97b8
    add r0, r5, #0xc000
    ldr r1, [r0, #0xa94]
    ldr r0, [r0, #0xa90]
    mov r1, r1, lsl #0x10
    ldr r3, _LIT0
    mov r1, r1, lsr #0x10
    mov r2, #0x2
    bl func_02005a60
    add r1, r5, #0xc000
    str r0, [r1, #0xa94]
    cmp r4, #0x0
    beq .L_124
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl func_ov006_021b843c
    add r4, r5, #0xc000
    ldr r0, [r4, #0xa94]
    mov r9, #0x0
    cmp r0, #0x0
    ble .L_104
    mov r8, #0x1
    mov r7, #0x4
    mvn r6, #0x0
.L_c8:
    cmp r9, #0x40
    bge .L_104
    mov r0, r5
    mov r1, r9
    bl func_ov006_021b8f88
    mov r3, r0
    mov r0, r5
    mov r1, r7
    mov r2, r6
    str r8, [sp]
    bl func_ov006_021b7240
    ldr r0, [r4, #0xa94]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_c8
.L_104:
    add r2, r5, #0x8100
    strh r0, [r2, #0x68]
    add r0, r5, #0xc000
    ldr r3, [r0, #0xa94]
    mov r0, r5
    mov r1, #0x4
    strh r3, [r2, #0x72]
    bl func_ov006_021b7bb0
.L_124:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word func_ov006_021b9c88
