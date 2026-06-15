; func_02046fc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_02045280
        .extern func_020463dc
        .extern func_020466f4
        .extern func_0204937c
        .global func_02046fc4
        .arm
func_02046fc4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02045280
    cmp r0, #0x0
    bne .L_378
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0x24]
    cmp r1, #0x3
    blt .L_378
    cmp r1, #0x4
    bne .L_384
.L_378:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_384:
    str r6, [r2, #0x78]
    ldr r1, [r0]
    mov r0, #0x4
    str r5, [r1, #0x7c]
    bl func_020466f4
    ldr r0, _LIT0
    ldr r1, [sp, #0x20]
    ldr r3, [r0]
    ldr r0, [sp, #0x24]
    str r4, [sp]
    str r1, [sp, #0x4]
    ldr r4, [sp, #0x28]
    str r0, [sp, #0x8]
    ldr r2, _LIT1
    add r0, r3, #0xe0
    add r1, r3, #0x1e0
    mov r3, #0x0
    str r4, [sp, #0xc]
    bl func_0204937c
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219daec
_LIT1: .word func_020463dc
