; func_0201a134 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b59e0
        .extern data_02104f4c
        .extern func_02018a84
        .extern func_02019210
        .global func_0201a134
        .arm
func_0201a134:
    stmdb sp!, {r3, lr}
    bl func_02019210
    ldr r2, _LIT0
    sub lr, r0, #0x44
    ldr r0, _LIT1
    mov r3, lr, lsl #0x1
    ldr ip, [r2, #0xa74]
    mov r1, #0x1
    orr ip, ip, r1, lsl lr
    ldrh r0, [r0, r3]
    str ip, [r2, #0xa74]
    bl func_02018a84
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_020b59e0+0x62
