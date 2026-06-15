; func_0204ec90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_02049990
        .extern func_02049d6c
        .extern func_0204aaf4
        .extern func_02062510
        .extern func_02064f84
        .extern func_020657c0
        .extern func_02068d50
        .global func_0204ec90
        .arm
func_0204ec90:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldrb r0, [r7]
    cmp r0, #0x0
    bne .L_1880
    bl func_020498f0
    mov r4, r0
    mov r1, #0x0
    ldr r0, [r7, #0x4]
    mov r2, r1
    bl func_02064f84
    mov r1, r0
    ldrh r2, [r7, #0x2]
    ldr r0, [r4, #0xe4]
    ldr r3, [r7, #0x8]
    bl func_02068d50
    bl func_0204aaf4
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_1880:
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r6, #0x0
.L_188c:
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062510
    str r5, [sp]
    str r7, [sp, #0x4]
    ldrb r2, [r7]
    ldr r1, [r7, #0x8]
    mov r3, r4
    bl func_020657c0
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r0, #0x3
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_188c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02049990
_LIT1: .word func_02049d6c
