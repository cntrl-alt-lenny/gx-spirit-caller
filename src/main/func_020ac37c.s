; func_020ac37c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021aa460
        .extern func_020aabac
        .extern func_020ab130
        .extern func_020b005c
        .extern func_020b2978
        .extern func_020b2ab4
        .extern func_020b2bdc
        .global func_020ac37c
        .arm
func_020ac37c:
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
    bl func_020ab130
    mov r5, r1
    mov r4, r0
    cmp r6, #0x0
    ldrne r0, [sp, #0x10]
    mov r1, r5
    addne r0, r7, r0
    strne r0, [r6]
    mov r0, r4
    bl func_020b005c
    ldr r2, [sp, #0xc]
    mov r6, r0
    mov r7, r1
    cmp r2, #0x0
    bne .L_163c
    mov r0, #0x0
    mov r1, r0
    mov r2, r4
    mov r3, r5
    bl func_020b2bdc
    beq .L_1648
    mov r0, r6
    mov r1, r7
    mov r2, #0x0
    mov r3, #0x100000
    bl func_020b2ab4
    bcc .L_163c
    ldr r3, _LIT1
    mov r0, r6
    mov r1, r7
    mvn r2, #0x0
    bl func_020b2978
    bls .L_1648
.L_163c:
    ldr r0, _LIT2
    mov r1, #0x22
    str r1, [r0]
.L_1648:
    mov r0, r4
    mov r1, r5
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_020aabac
_LIT1: .word 0x7fefffff
_LIT2: .word data_021aa460
