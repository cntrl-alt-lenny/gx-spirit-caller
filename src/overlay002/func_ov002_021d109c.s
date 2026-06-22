; func_ov002_021d109c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b0b54
        .extern func_ov002_0229ade0
        .global func_ov002_021d109c
        .arm
func_ov002_021d109c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldrh r0, [r0]
    mov r1, #0x0
    mov r3, #0x7
    tst r0, #0x8000
    ldr r0, [r2, #0xcec]
    movne r4, #0x1
    eor r0, r0, #0x1
    str r0, [r2, #0xcec]
    ldr ip, [r2, #0xcf0]
    ldr r0, _LIT2
    add ip, ip, #0x1
    str ip, [r2, #0xcf0]
    str r1, [r2, #0xd1c]
    str r1, [r2, #0xd20]
    str r3, [r2, #0xcf8]
    ldr r3, [r0, #0x4]
    ldr r0, _LIT3
    eor r2, r3, #0x1
    and r3, r3, #0x1
    mul ip, r3, r0
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r3, _LIT4
    moveq r4, #0x0
    ldr r2, [r3, ip]
    ldr r0, [r3, r0]
    cmp r2, r0
    movlt r1, #0x1
    mov r0, #0x38
    bl func_ov002_021b0b54
    mov r2, #0x0
    mov r3, r2
    rsb r1, r4, #0x1
    mov r0, #0x5
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd73c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
