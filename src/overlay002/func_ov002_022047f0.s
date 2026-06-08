; func_ov002_022047f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bbeac
        .global func_ov002_022047f0
        .arm
func_ov002_022047f0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r6, #0x0
.L_98:
    mov r0, r6
    bl func_ov002_021bbeac
    and r2, r6, #0x1
    mla r1, r2, r4, r5
    ldr r1, [r1, #0xc]
    add r0, r1, r0
    cmp r0, #0x6
    movcs r0, #0x1
    ldmcsia sp!, {r4, r5, r6, pc}
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_98
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
