; func_020ac288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021aa380
        .extern func_020aaab8
        .extern func_020ab03c
        .extern func_020aff68
        .extern func_020b2884
        .extern func_020b29c0
        .extern func_020b2ae8
        .global func_020ac288
        .arm
func_020ac288:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r7, r0
    mov r0, #0x0
    mov r6, r1
    str r0, [sp, #0x8]
    add r4, sp, #0xc
    str r7, [sp, #0x4]
    ldr r1, _LIT0
    add r2, sp, #0x4
    add r3, sp, #0x10
    sub r0, r0, #-2147483647
    str r4, [sp]
    bl func_020ab03c
    mov r5, r1
    mov r4, r0
    cmp r6, #0x0
    ldrne r0, [sp, #0x10]
    mov r1, r5
    addne r0, r7, r0
    strne r0, [r6]
    mov r0, r4
    bl func_020aff68
    ldr r2, [sp, #0xc]
    mov r6, r0
    mov r7, r1
    cmp r2, #0x0
    bne .L_1304
    mov r0, #0x0
    mov r1, r0
    mov r2, r4
    mov r3, r5
    bl func_020b2ae8
    beq .L_1310
    mov r0, r6
    mov r1, r7
    mov r2, #0x0
    mov r3, #0x100000
    bl func_020b29c0
    bcc .L_1304
    ldr r3, _LIT1
    mov r0, r6
    mov r1, r7
    mvn r2, #0x0
    bl func_020b2884
    bls .L_1310
.L_1304:
    ldr r0, _LIT2
    mov r1, #0x22
    str r1, [r0]
.L_1310:
    mov r0, r4
    mov r1, r5
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_020aaab8
_LIT1: .word 0x7fefffff
_LIT2: .word data_021aa380
