; func_ov006_021cae24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_02094504
        .global func_ov006_021cae24
        .arm
func_ov006_021cae24:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldrh ip, [r1]
    mov r3, r2, lsl #0x10
    bic ip, ip, #0x3
    strh ip, [r1]
    ldrh ip, [r1]
    and ip, ip, #0x43
    orr ip, ip, #0x490
    strh ip, [r1]
    ldr ip, [r0, #0x10]
    ldr r0, [r0, #0x14]
    rsb ip, ip, #0x0
    rsb r0, r0, #0x0
    and r2, ip, r2
    and r0, r3, r0, lsl #0x10
    orr r0, r2, r0
    str r0, [r1, #0xc]
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    bl func_0208de4c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x2040
    bl func_02094504
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x0400100c
_LIT1: .word 0x000001ff
