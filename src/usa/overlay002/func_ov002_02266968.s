; func_ov002_02266968 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b40c4
        .extern func_ov002_021d5b60
        .extern func_ov002_021e2fc4
        .global func_ov002_02266968
        .arm
func_ov002_02266968:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r1, #0xb
    mov r5, r0
    bl func_ov002_021b40c4
    movs r4, r0
    movmi r0, #0x1
    ldmmiia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT0
    mov r0, r5
    mov r3, r4
    mov r1, #0xb
    bl func_ov002_021d5b60
    mov r1, r5, lsl #0x1f
    ldr r0, _LIT1
    and r1, r1, #-2147483648
    orr r0, r1, r0
    mov r2, r4
    mov r1, #0x0
    bl func_ov002_021e2fc4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001a02
_LIT1: .word 0x04501a02
