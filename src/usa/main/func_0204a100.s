; func_0204a100 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bec44
        .extern data_020ff894
        .extern func_02045948
        .extern func_0204987c
        .extern func_020689ac
        .extern func_02068aa8
        .extern func_02068c34
        .extern func_02068c44
        .extern func_02068c54
        .extern func_020b377c
        .global func_0204a100
        .arm
func_0204a100:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov r8, #0x0
    mov r7, r8
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r0, #0x1
    addle sp, sp, #0x1c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r9, r8
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r0, #0x0
    ble .L_90
    ldr r4, _LIT0
    ldr r6, _LIT1
    mvn r5, #0x0
.L_4c:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, r9
    bl func_02068c54
    mov r1, r6
    mov r2, r5
    bl func_020689ac
    cmp r0, r8
    movgt r8, r0
    ldr r0, [r4, r9, lsl #0x2]
    add r9, r9, #0x1
    add r7, r7, r0
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r9, r0
    blt .L_4c
.L_90:
    mov r0, #0x64
    bl func_02045948
    mov r9, r0
    mov r6, #0x0
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r0, #0x0
    ble .L_128
    add r5, sp, #0x0
    mov fp, r6
    mov r4, #0x64
.L_c0:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    sub r0, r0, #0x1
    cmp r6, r0
    beq .L_128
    cmp r6, #0x0
    subgt r0, r6, #0x1
    ldrgt sl, [r5, r0, lsl #0x2]
    ldr r0, _LIT0
    movle sl, fp
    ldr r2, [r0, r6, lsl #0x2]
    mov r1, r7
    mul r0, r2, r4
    bl func_020b377c
    add r0, r0, sl
    str r0, [r5, r6, lsl #0x2]
    ldr r0, [r5, r6, lsl #0x2]
    cmp r9, r0
    bcc .L_128
    add r6, r6, #0x1
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r6, r0
    blt .L_c0
.L_128:
    mvn r0, #-2147483648
    cmp r8, r0
    addlt r8, r8, #0x1
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_02068c54
    ldr r1, _LIT1
    mov r2, r8
    bl func_02068aa8
    bl func_0204987c
    mov r1, #0x0
    ldr r0, [r0, #0xe4]
    ldr r2, _LIT1
    mov r3, r1
    bl func_02068c34
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020bec44
_LIT1: .word data_020ff894
