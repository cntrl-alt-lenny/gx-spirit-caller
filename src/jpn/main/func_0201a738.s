; func_0201a738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b58ec
        .extern data_020b5a3c
        .extern data_020c5b9c
        .extern data_020c5bb0
        .extern func_0201a4a8
        .extern func_02091554
        .global func_0201a738
        .arm
func_0201a738:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x5c
    mov r5, r0
    mov r4, r1
    bl func_0201a4a8
    ldr r1, _LIT0
    mov r7, r0
    add r3, sp, #0x0
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r6, _LIT1
    add lr, sp, #0xc
    mov ip, #0x5
.L_1ac:
    ldmia r6!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_1ac
    cmp r5, #0x0
    add r0, sp, #0xc
    bne .L_1e0
    ldr r2, [r0, r5, lsl #0x2]
    ldr r1, _LIT2
    mov r0, r4
    bl func_02091554
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1e0:
    cmp r7, #0x3
    moveq r1, #0xa
    movne r1, #0x0
    add r2, sp, #0x0
    sub r3, r7, #0x1
    add r1, r5, r1
    ldr r2, [r2, r3, lsl #0x2]
    ldr r3, [r0, r1, lsl #0x2]
    ldr r1, _LIT3
    mov r0, r4
    bl func_02091554
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020b58ec
_LIT1: .word data_020b5a3c
_LIT2: .word data_020c5b9c
_LIT3: .word data_020c5bb0
