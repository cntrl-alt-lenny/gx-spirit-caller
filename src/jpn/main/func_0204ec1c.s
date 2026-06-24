; func_0204ec1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204991c
        .extern func_02049cf8
        .extern func_0204aa80
        .extern func_0206249c
        .extern func_02064f10
        .extern func_0206574c
        .extern func_02068cdc
        .global func_0204ec1c
        .arm
func_0204ec1c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldrb r0, [r7]
    cmp r0, #0x0
    bne .L_330
    bl func_0204987c
    mov r4, r0
    mov r1, #0x0
    ldr r0, [r7, #0x4]
    mov r2, r1
    bl func_02064f10
    mov r1, r0
    ldrh r2, [r7, #0x2]
    ldr r0, [r4, #0xe4]
    ldr r3, [r7, #0x8]
    bl func_02068cdc
    bl func_0204aa80
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_330:
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r6, #0x0
.L_33c:
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_0206249c
    str r5, [sp]
    str r7, [sp, #0x4]
    ldrb r2, [r7]
    ldr r1, [r7, #0x8]
    mov r3, r4
    bl func_0206574c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r0, #0x3
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_33c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_0204991c
_LIT1: .word func_02049cf8
