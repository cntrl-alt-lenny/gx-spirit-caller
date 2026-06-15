; func_02011620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .global func_02011620
        .arm
func_02011620:
    stmdb sp!, {r3, lr}
    mov r1, r1, asr #0x4
    mov r3, r1, lsl #0x1
    add r1, r3, #0x1
    mov r2, #0x1000
    ldr lr, _LIT0
    mov r1, r1, lsl #0x1
    mov r3, r3, lsl #0x1
    ldrsh ip, [lr, r3]
    str r2, [r0]
    mov r3, #0x0
    str r3, [r0, #0x4]
    str r3, [r0, #0x8]
    ldrsh r2, [lr, r1]
    str r3, [r0, #0xc]
    rsb r1, ip, #0x0
    str r2, [r0, #0x10]
    str ip, [r0, #0x14]
    str r3, [r0, #0x18]
    str r1, [r0, #0x1c]
    str r2, [r0, #0x20]
    str r3, [r0, #0x24]
    str r3, [r0, #0x28]
    str r3, [r0, #0x2c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_020bef80
