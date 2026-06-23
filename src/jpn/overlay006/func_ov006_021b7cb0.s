; func_ov006_021b7cb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4674
        .extern func_0202b08c
        .extern func_0202b678
        .extern func_0202bacc
        .extern func_ov006_021b833c
        .global func_ov006_021b7cb0
        .arm
func_ov006_021b7cb0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, #0x0
    mov sl, r0
    mov r9, r1
    mov r4, r5
.L_c8:
    mov r0, sl
    mov r1, r5
    mov r2, r4
    bl func_ov006_021b833c
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_c8
    ldr r0, _LIT0
    mov r4, #0x0
    ldr fp, [r0]
    mov r5, r4
    cmp fp, #0x1
    mov r7, #0x1
    ble .L_16c
    add r0, sl, #0x2a0
    add r8, r0, #0x6000
.L_108:
    mov r0, r7
    bl func_0202b08c
    mov r6, r0
    cmp r9, #0x0
    bne .L_130
    bl func_0202bacc
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_140
.L_130:
    bl func_0202b678
    cmp r9, r0
    moveq r0, #0x1
    movne r0, #0x0
.L_140:
    cmp r0, #0x0
    beq .L_160
    strh r6, [r8]
    mov r0, #0x1
    strb r0, [r8, #0x2]
    add r5, r5, #0x1
    add r8, r8, #0x4
    add r4, r4, #0x1
.L_160:
    add r7, r7, #0x1
    cmp r7, fp
    blt .L_108
.L_16c:
    add r0, sl, #0x8100
    strh r4, [r0, #0x60]
    strh r5, [r0, #0x6a]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020b4674
