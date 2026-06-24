; func_02054244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa24
        .extern data_020ffa90
        .extern func_0204537c
        .extern func_020a6c60
        .global func_02054244
        .arm
func_02054244:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    ldr r0, [r4, #0xc]
    add r0, r1, r0
    str r0, [r4, #0x4]
    ldr r2, [r4, #0x4]
    ldr r1, [r4, #0x8]
    ldr r0, [r4, #0x14]
    mul r1, r2, r1
    bl func_0204537c
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x41
    bl func_020a6c60
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ffa90
_LIT1: .word data_020ffa24
