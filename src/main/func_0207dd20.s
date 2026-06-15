; func_0207dd20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207de6c
        .extern func_020975f0
        .extern func_02097668
        .extern func_02097700
        .extern func_02097810
        .extern func_020aaddc
        .global func_0207dd20
        .arm
func_0207dd20:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    mov r7, r2
    mov r6, #0x0
    mov r9, r0
    mov r0, r7
    mov r8, r1
    mov r5, r6
    mov r4, r6
    bl func_0207de6c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r7, #0xc]
    ldrh r0, [r7, #0xe]
    mov r2, r6
    add r1, r7, r1
    cmp r0, #0x0
    ble .L_9c
    ldr r3, _LIT0
    ldr ip, _LIT1
    ldr lr, _LIT2
.L_5c:
    ldr sl, [r1]
    cmp sl, lr
    beq .L_7c
    cmp sl, ip
    beq .L_84
    cmp sl, r3
    moveq r5, r1
    b .L_88
.L_7c:
    mov r6, r1
    b .L_88
.L_84:
    mov r4, r1
.L_88:
    ldr sl, [r1, #0x4]
    add r2, r2, #0x1
    add r1, r1, sl
    cmp r2, r0
    blt .L_5c
.L_9c:
    mov r0, r9
    bl func_02097810
    str r7, [r9, #0x5c]
    mov r0, r8
    str r6, [r9, #0x60]
    add r4, r4, #0x8
    str r4, [r9, #0x64]
    bl func_020aaddc
    mov r2, r0
    mov r0, r9
    mov r1, r8
    bl func_02097700
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, r5, #0x8
    sub r0, r0, r4
    str r0, [sp]
    ldr r0, [r5, #0x4]
    add r2, r6, #0xc
    sub r0, r0, #0x8
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r3, [r6, #0x4]
    mov r0, r9
    mov r1, r4
    sub r2, r2, r4
    sub r3, r3, #0xc
    bl func_020975f0
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r9
    bl func_02097668
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x464e5442
_LIT1: .word 0x46494d47
_LIT2: .word 0x46415442
