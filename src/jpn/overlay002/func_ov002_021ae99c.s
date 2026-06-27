; func_ov002_021ae99c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021ae6d8
        .extern func_ov002_021af4c0
        .global func_ov002_021ae99c
        .arm
func_ov002_021ae99c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021ae6d8
    ldr r1, _LIT0
    mov r2, #0x3
    ldr r0, _LIT1
    str r2, [r1, #0xd04]
    mov r2, #0x0
    str r2, [r0]
    mov lr, #0x1
    ldr ip, _LIT2
    str r2, [r0, #0x4]
    str r2, [ip, r2, lsl #0x2]
    ldr r2, [r0, #0x4]
    mov r3, #0x9
    eor r2, r2, #0x1
    str lr, [ip, r2, lsl #0x2]
    ldr ip, [r0, #0x4]
    rsb r2, lr, #0x10000
    str ip, [r0, #0x10]
    str r3, [r1, #0xcf0]
    str r2, [r1, #0xcf4]
    ldr r2, [r0]
    mov r0, r4
    str r2, [r1, #0xce4]
    bl func_ov002_021af4c0
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022cd664
