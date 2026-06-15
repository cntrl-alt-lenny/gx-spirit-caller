; func_02070278 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eec4
        .extern data_0219eee4
        .extern data_0219ef14
        .extern data_0219ef1c
        .extern func_02073738
        .extern func_02074498
        .extern func_02091768
        .extern func_020930b0
        .global func_02070278
        .arm
func_02070278:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    blx r0
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    bl func_02073738
    mov r0, #0x64
    bl func_02091768
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_02073738
    bl func_020930b0
    mov r4, r0, lsr #0x10
    orr r4, r4, r1, lsl #0x10
    ldr r6, _LIT2
    mov r7, #0x64
    ldr r5, _LIT3
    b .L_694
.L_66c:
    ldrb r0, [r6]
    cmp r0, #0x0
    beq .L_68c
    mov r0, #0x4
    bl func_02074498
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_68c:
    mov r0, r7
    bl func_02091768
.L_694:
    ldr r0, [r5]
    blx r0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    bl func_020930b0
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r4
    cmp r0, #0x17
    blt .L_66c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219eee4
_LIT1: .word data_0219ef1c
_LIT2: .word data_0219eec4
_LIT3: .word data_0219ef14
