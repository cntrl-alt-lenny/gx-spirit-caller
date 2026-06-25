; func_02046eb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02045230
        .extern func_020461ac
        .extern func_0204664c
        .extern func_02046788
        .extern func_020513b8
        .global func_02046eb8
        .arm
func_02046eb8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02045230
    cmp r0, #0x0
    bne .L_2d4
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x3
    beq .L_2e0
.L_2d4:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_2e0:
    bl func_02046788
    ldr r1, _LIT0
    mov r0, #0x5
    ldr r2, [r1]
    str r5, [r2, #0x80]
    ldr r1, [r1]
    str r4, [r1, #0x84]
    bl func_0204664c
    ldr r1, [sp, #0x20]
    sub r0, r7, #0x1
    ldr r4, [sp, #0x24]
    str r1, [sp]
    ldr r2, _LIT1
    mov r1, r6
    and r0, r0, #0xff
    mov r3, #0x0
    str r4, [sp, #0x4]
    bl func_020513b8
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219da0c
_LIT1: .word func_020461ac
