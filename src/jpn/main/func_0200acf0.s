; func_0200acf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_02186a08
        .extern data_02186a20
        .extern func_0200ac28
        .global func_0200acf0
        .arm
func_0200acf0:
    stmdb sp!, {r3, lr}
    mov r1, #0x284
    mul r3, r0, r1
    ldr r2, _LIT0
    mov r1, #0x4
    str r0, [r2, #0xc]
    mov r0, r3
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    ldr r0, _LIT0
    mov r2, #0x284
    str r1, [r0, #0x14]
    ldr r3, [r0, #0xc]
    mov r0, #0x0
    mul r2, r3, r2
    bl Fill32
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x30
    bl Fill32
    bl func_0200ac28
    ldr r0, _LIT0
    mov r2, #0x0
    strh r2, [r0]
    mov r1, #0x40
    strh r1, [r0, #0x6]
    strh r2, [r0, #0x2]
    str r2, [r0, #0x8]
    str r2, [r0, #0x10]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02186a08
_LIT1: .word data_02186a20
