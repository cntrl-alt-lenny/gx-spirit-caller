; func_020acca0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021aa460
        .extern func_020aabac
        .extern func_020ac46c
        .global func_020acca0
        .arm
func_020acca0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r5, r0
    mov lr, #0x0
    mov r0, r2
    mov r4, r1
    add r2, sp, #0x1c
    str r5, [sp, #0xc]
    str lr, [sp, #0x10]
    str r2, [sp]
    add r1, sp, #0x18
    str r1, [sp, #0x4]
    add ip, sp, #0x14
    ldr r2, _LIT0
    add r3, sp, #0xc
    sub r1, lr, #-2147483647
    str ip, [sp, #0x8]
    bl func_020ac46c
    cmp r4, #0x0
    ldrne r1, [sp, #0x1c]
    addne r1, r5, r1
    strne r1, [r4]
    ldr r1, [sp, #0x14]
    cmp r1, #0x0
    beq .L_8b0
    ldr r0, _LIT1
    mov r1, #0x22
    str r1, [r0]
    add sp, sp, #0x20
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_8b0:
    ldr r1, [sp, #0x18]
    cmp r1, #0x0
    rsbne r0, r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_020aabac
_LIT1: .word data_021aa460
