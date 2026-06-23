; func_ov006_021b7bfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4674
        .extern func_0202b08c
        .extern func_0202b998
        .extern func_0202bacc
        .extern func_ov006_021b833c
        .global func_ov006_021b7bfc
        .arm
func_ov006_021b7bfc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, #0x0
    mov sl, r0
    mov r4, r5
.L_10:
    mov r0, sl
    mov r1, r5
    mov r2, r4
    bl func_ov006_021b833c
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_10
    ldr r0, _LIT0
    mov r4, #0x0
    ldr fp, [r0]
    mov r6, r4
    cmp fp, #0x1
    mov r8, #0x1
    ble .L_9c
    add r0, sl, #0x2a0
    add r9, r0, #0x6000
.L_50:
    mov r0, r8
    bl func_0202b08c
    mov r7, r0
    bl func_0202b998
    mov r5, r0
    cmp r5, #0x0
    bgt .L_7c
    mov r0, r7
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_90
.L_7c:
    strh r7, [r9]
    strb r5, [r9, #0x2]
    add r6, r6, r5
    add r9, r9, #0x4
    add r4, r4, #0x1
.L_90:
    add r8, r8, #0x1
    cmp r8, fp
    blt .L_50
.L_9c:
    add r0, sl, #0x8100
    strh r4, [r0, #0x60]
    strh r6, [r0, #0x6a]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020b4674
