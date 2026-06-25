; func_02041e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02091a0c
        .extern func_02092660
        .extern func_020926d0
        .global func_02041e50
        .arm
func_02041e50:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1000
    ldrb r0, [r0]
    cmp r0, #0xff
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    add r0, r4, r0
    bl func_020926d0
    ldr r0, _LIT0
    add r1, r4, #0x1000
    mov r2, #0x1
    add r0, r4, r0
    str r2, [r1, #0xc0c]
    bl func_02092660
    add r0, r4, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    add r0, r4, r0
    bl func_02091a0c
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001bf4
_LIT1: .word 0x00001b34
