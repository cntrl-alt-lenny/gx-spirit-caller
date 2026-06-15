; func_020629b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101530
        .extern func_02062280
        .extern func_02064490
        .global func_020629b8
        .arm
func_020629b8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r4, r0
    ldrb r3, [r1]
    ldrb r2, [r1, #0x1]
    add r0, sp, #0x0
    mov r1, #0x64
    strb r3, [r0]
    strb r2, [r0, #0x1]
    strb r1, [sp, #0x2]
    ldrh r2, [r4, #0x66]
    mov r1, #0x3
    bl func_02064490
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x5
    bl func_02062280
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x90]
    movne r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02101530
