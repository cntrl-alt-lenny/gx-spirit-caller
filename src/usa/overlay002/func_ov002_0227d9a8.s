; func_ov002_0227d9a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ba5ec
        .extern func_ov002_021bad9c
        .extern func_ov002_021c3a04
        .global func_ov002_0227d9a8
        .arm
func_ov002_0227d9a8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, _LIT0
    rsb r0, r5, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, r5
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov002_021c3a04
    mov r4, r0
    ldr r1, _LIT1
    mov r0, r5
    bl func_ov002_021ba5ec
    add r0, r4, r0
    cmp r0, #0x0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001256
_LIT1: .word 0x0000144d
