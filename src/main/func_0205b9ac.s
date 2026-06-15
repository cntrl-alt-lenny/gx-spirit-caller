; func_0205b9ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a20
        .extern data_02100a64
        .extern data_02100a7c
        .extern func_0205ba5c
        .extern func_0205ffc0
        .extern func_020a6d54
        .global func_0205b9ac
        .arm
func_0205b9ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    mov r4, r1, asr #0x18
    mov lr, r1, asr #0x10
    and r7, r4, #0xff
    mov r4, r0
    and r6, lr, #0xff
    and r5, r1, ip
    mov r9, r2
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r8, r3
    bl func_0205ba5c
    cmp r0, #0x0
    bne .L_b38
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, #0x0
    mov r3, #0xb7
    bl func_020a6d54
.L_b38:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0205ba5c
    cmp r0, #0x0
    strne r7, [r9]
    ldrne r0, [sp, #0x20]
    strne r6, [r8]
    strne r5, [r0]
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT3
    mov r0, r4
    bl func_0205ffc0
    mov r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word data_02100a64
_LIT2: .word data_02100a20
_LIT3: .word data_02100a7c
