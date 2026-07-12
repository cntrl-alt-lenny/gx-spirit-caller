; func_ov016_021b50f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b9024
        .extern func_ov016_021b27f4
        .global func_ov016_021b50f0
        .arm
func_ov016_021b50f0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, _LIT0
    mov r6, #0x0
    mov r4, #0xa
.L_cc:
    add r1, r6, #0x1
    mla r0, r1, r4, r5
    bl func_ov016_021b27f4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    add r6, r6, #0x1
    cmp r6, #0xe
    blt .L_cc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov016_021b9024
