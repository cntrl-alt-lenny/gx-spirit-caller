; func_ov002_0227c540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021baf88
        .global func_ov002_0227c540
        .arm
func_ov002_0227c540:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    bl func_ov002_021baf88
    mov r1, #0x1f4
    ldr r2, _LIT1
    and r3, r4, #0x1
    mul ip, r3, r2
    mul r1, r0, r1
    ldr r2, _LIT2
    ldr r0, [r2, ip]
    cmp r0, r1
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000132c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
