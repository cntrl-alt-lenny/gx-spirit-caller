; func_02032790 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020469f0
        .extern func_02046a58
        .extern func_02052644
        .extern func_020527a4
        .global func_02032790
        .arm
func_02032790:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    add r0, sp, #0x0
    bl func_020469f0
    mov r6, r0
    mov r5, #0x0
    cmp r6, #0x0
    mov r4, r5
    addle sp, sp, #0x4
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_2c:
    ldr r0, [sp]
    ldrb r8, [r0, r4]
    bl func_02046a58
    cmp r8, r0
    addeq r5, r5, #0x1
    beq .L_6c
    ldr r2, [r7, #0xe9c]
    ldr r1, [r7, #0xea0]
    sub r0, r4, r5
    mla r1, r0, r2, r1
    mov r0, r8
    bl func_020527a4
    ldr r0, [sp]
    ldr r1, [r7, #0xea8]
    ldrb r0, [r0, r4]
    bl func_02052644
.L_6c:
    add r4, r4, #0x1
    cmp r4, r6
    blt .L_2c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
