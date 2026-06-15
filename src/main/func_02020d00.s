; func_02020d00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern data_02193340
        .extern func_02020ce0
        .extern func_020944a4
        .extern func_020a078c
        .global func_02020d00
        .arm
func_02020d00:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r1
    ldr r1, _LIT0
    mov r2, #0x30
    bl func_020944a4
    ldr r2, _LIT0
    ldr r0, _LIT1
    mov r1, #0x30
    str r2, [r0, #0xa0]
    strh r1, [r0, #0xa4]
    ldr r0, [r0, #0x30]
    cmp r0, #0x4
    addne sp, sp, #0x8
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT1
    cmp r4, #0x0
    ldrh ip, [r2, #0xac]
    movne r0, #0x1
    moveq r0, #0x0
    and r3, r0, #0xff
    str ip, [sp]
    str r3, [sp, #0x4]
    ldr r3, [r2, #0xa8]
    ldr r0, _LIT2
    ldr r1, _LIT0
    mov r2, #0x30
    bl func_020a078c
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02193340
_LIT1: .word data_02191f40
_LIT2: .word func_02020ce0
