; func_020817b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020817b0
        .arm
func_020817b0:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r2, [r0, #0xc]
    ldrh r3, [r0, #0xe]
    mov r1, #0x0
    add r2, r0, r2
    cmp r3, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT0
    ldr ip, _LIT1
    ldr r4, _LIT2
    ldr lr, _LIT3
.L_2c:
    ldr r5, [r2]
    cmp r5, r4
    bhi .L_48
    cmp r5, r4
    bcs .L_b0
    cmp r5, lr
    b .L_c4
.L_48:
    cmp r5, ip
    bhi .L_5c
    cmp r5, ip
    beq .L_98
    b .L_c4
.L_5c:
    cmp r5, r3
    bne .L_c4
    add r6, r2, #0x8
    ldr r5, [r6, #0x8]
    add r5, r5, r0
    str r5, [r6, #0x8]
    ldr r5, [r6, #0xc]
    cmp r5, #0x0
    addne r5, r5, r0
    strne r5, [r6, #0xc]
    ldr r5, [r6, #0x10]
    cmp r5, #0x0
    addne r5, r5, r0
    strne r5, [r6, #0x10]
    b .L_c4
.L_98:
    add r6, r2, #0x8
    ldr r5, [r6, #0x4]
    cmp r5, #0x0
    addne r5, r5, r0
    strne r5, [r6, #0x4]
    b .L_c4
.L_b0:
    add r6, r2, #0x8
    ldr r5, [r6, #0x8]
    cmp r5, #0x0
    addne r5, r5, r0
    strne r5, [r6, #0x8]
.L_c4:
    ldrh r5, [r0, #0xe]
    ldr r6, [r2, #0x4]
    add r1, r1, #0x1
    cmp r1, r5
    add r2, r2, r6
    blt .L_2c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x46494e46
_LIT1: .word 0x43574448
_LIT2: .word 0x434d4150
_LIT3: .word 0x43474c50
