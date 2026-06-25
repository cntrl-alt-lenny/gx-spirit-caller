; func_02011b9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0209448c
        .global func_02011b9c
        .arm
func_02011b9c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, r1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    mov r1, r5
    mov r0, #0x0
    mov r2, #0x108
    bl func_0209448c
    ldrh r1, [r4, #0x8]
    add r0, r4, #0xa
    mov r3, #0x0
    str r1, [r5]
    cmp r1, #0x0
    bls .L_60
.L_44:
    ldrh r2, [r0], #0x2
    add r1, r5, r3, lsl #0x1
    add r3, r3, #0x1
    strh r2, [r1, #0xc]
    ldr r1, [r5]
    cmp r3, r1
    bcc .L_44
.L_60:
    ldrh r1, [r0], #0x2
    mov r3, #0x0
    str r1, [r5, #0x8]
    cmp r1, #0x0
    bls .L_90
.L_74:
    ldrh r2, [r0], #0x2
    add r1, r5, r3, lsl #0x1
    add r3, r3, #0x1
    strh r2, [r1, #0xca]
    ldr r1, [r5, #0x8]
    cmp r3, r1
    bcc .L_74
.L_90:
    ldrh r1, [r0], #0x2
    mov r3, #0x0
    str r1, [r5, #0x4]
    cmp r1, #0x0
    bls .L_c0
.L_a4:
    ldrh r2, [r0], #0x2
    add r1, r5, r3, lsl #0x1
    add r3, r3, #0x1
    strh r2, [r1, #0xac]
    ldr r1, [r5, #0x4]
    cmp r3, r1
    bcc .L_a4
.L_c0:
    mov r0, r4
    bl Task_Invoke
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
